import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../shared/models/meme.dart';
import '../../../shared/models/meme_stats.dart';
import '../../../shared/models/profile.dart';
import '../base.dart';

class Profile_Repository extends Repository_Base {
  Profile_Repository({required SupabaseClient supabaseClient})
      : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  @override
  Future<void> init() async {}

  Future<Model_Profile> fetchProfile() async {
    final response =
        await _supabaseClient.from('profiles').select().eq('id', _getUserId());

    return Model_Profile.fromJson(response.first);
  }

  Future<List<Model_Meme>> fetchMyUploadedMemes() async {
    final response = await _supabaseClient
        .from('memes')
        .select()
        .eq('creator_id', _getUserId())
        .order('created_at', ascending: false);

    return response.map(Model_Meme.fromJson).toList();
  }

  Future<List<Model_Meme>> fetchUploadedMemes({
    required String creatorId,
  }) async {
    final response = await _supabaseClient
        .from('memes')
        .select()
        .eq('creator_id', creatorId)
        .order('created_at', ascending: false);

    return response.map(Model_Meme.fromJson).toList();
  }

  Future<Model_MemeStats> fetchMemeStats({
    required String userId,
  }) async {
    final response = await _supabaseClient.rpc<List<dynamic>>(
      'get_user_meme_stats',
      params: {
        '_user_id': userId,
      },
    );
    return Model_MemeStats.fromJson(response.first as Map<String, dynamic>);
  }

  String _getUserId() {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }
    return user.id;
  }
}
