import 'package:supabase_flutter/supabase_flutter.dart';

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

  String _getUserId() {
    final user = _supabaseClient.auth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }
    return user.id;
  }
}
