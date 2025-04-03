import 'dart:convert';
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../shared/models/meme.dart';
import '../base.dart';

class Meme_Repository extends Repository_Base {
  Meme_Repository({required SupabaseClient supabaseClient})
      : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  @override
  Future<void> init() async {}

  Future<List<Meme>> fetchMemes() async {
    final response = await _supabaseClient
        .from('memes')
        .select()
        .order('created_at', ascending: false);

    return response.map(Meme.fromJson).toList();
  }

  Future<bool> uploadMeme({
    required String title,
    required File imageFile,
  }) async {
    // Generate a unique file path.
    final fileName = imageFile.uri.pathSegments.last;
    final filePath =
        '${_getUserId()}/${DateTime.now().millisecondsSinceEpoch}_$fileName';

    final result = await _supabaseClient.functions.invoke(
      'moderate-image',
      body: {
        'base64Image': base64.encode(imageFile.readAsBytesSync()),
        'mimeType': 'image/${imageFile.path.split('.').last}',
      },
    );

    log.info('Moderation Result: ${result.data}');

    final decodedData = jsonDecode(result.data as String);
    final isSafe =
        (decodedData as Map<String, dynamic>)['safe'] as bool? ?? false;

    if (!isSafe) {
      return false;
    }

    // Upload the image to Supabase Storage.
    final response = await _supabaseClient.storage
        .from('images')
        .upload(filePath, imageFile);

    // Retrieve the public URL for the uploaded image.
    final publicUrl =
        _supabaseClient.storage.from('images').getPublicUrl(filePath);

    log.fine('response: $response');

    // Insert a new record into the memes table.
    final insertResponse = await _supabaseClient
        .from('memes')
        .insert({'title': title, 'image_url': publicUrl});

    log.fine('insertResponse: $insertResponse');

    return true;
  }

  String _getUserId() {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }
    return user.id;
  }
}
