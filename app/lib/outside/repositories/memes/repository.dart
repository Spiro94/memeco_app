import 'dart:convert';
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../shared/models/meme.dart';
import '../../../shared/models/meme_with_votes.dart';
import '../base.dart';

class Meme_Repository extends Repository_Base {
  Meme_Repository({required SupabaseClient supabaseClient})
      : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  @override
  Future<void> init() async {}

  Stream<SupabaseStreamEvent> streamMeme() {
    return _supabaseClient
        .from('memes')
        .stream(primaryKey: ['id']).order('created_at', ascending: false);
  }

  Future<List<Model_Meme>> fetchMemes() async {
    final response = await _supabaseClient
        .from('memes')
        .select()
        .order('created_at', ascending: false);

    return response.map(Model_Meme.fromJson).toList();
  }

  Future<List<Model_Meme_WithVotes>> fetchMemesWithVotes() async {
    final response =
        await _supabaseClient.rpc<List<dynamic>>('get_memes_with_votes');

    return response
        .map(
          (json) => Model_Meme_WithVotes.fromJson(json as Map<String, dynamic>),
        )
        .toList();
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

  /// Fetch meme details from the backend.
  Future<Model_Meme> fetchMemeDetail(String memeId) async {
    final response =
        await _supabaseClient.from('memes').select().eq('id', memeId).single();

    return Model_Meme.fromJson(response);
  }

  Future<Model_Meme_WithVotes> fetchMemeWithVotes({
    required String memeId,
  }) async {
    final response = await _supabaseClient.rpc<List<dynamic>>(
      'get_meme_details',
      params: {
        'p_meme_id': memeId,
      },
    );

    return Model_Meme_WithVotes.fromJson(
      response.first as Map<String, dynamic>,
    );
  }

  Future<void> likeMeme({
    required String memeId,
    bool shouldDeleteVote = false,
  }) async {
    if (shouldDeleteVote) {
      await _supabaseClient.from('meme_votes').delete().eq(
            'meme_id',
            memeId,
          );
    } else {
      await _supabaseClient.from('meme_votes').upsert(
        {
          'meme_id': memeId,
          'user_id': _getUserId(),
          'is_like': true,
        },
        onConflict: 'meme_id,user_id',
      );
    }
  }

  Future<void> dislikeMeme({
    required String memeId,
    bool shouldDeleteVote = false,
  }) async {
    if (shouldDeleteVote) {
      await _supabaseClient.from('meme_votes').delete().eq(
            'meme_id',
            memeId,
          );
    } else {
      await _supabaseClient.from('meme_votes').upsert(
        {
          'meme_id': memeId,
          'user_id': _getUserId(),
          'is_like': false,
        },
        onConflict: 'meme_id,user_id',
      );
    }
  }

  // Utility method to get the user ID from the Supabase client.
  String _getUserId() {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }
    return user.id;
  }
}
