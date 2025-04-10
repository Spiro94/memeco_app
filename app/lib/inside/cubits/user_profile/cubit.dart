import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../outside/repositories/profile/repository.dart';
import '../../../shared/mixins/logging.dart';
import 'state.dart';

class UserProfile_Cubit extends Cubit<UserProfile_State>
    with SharedMixin_Logging {
  UserProfile_Cubit({
    required Profile_Repository profileRepository,
  })  : _profileRepository = profileRepository,
        super(UserProfile_State());

  final Profile_Repository _profileRepository;

  Future<void> fetchProfile() async {
    try {
      final profile = await _profileRepository.fetchUserProfile();

      emit(
        state.copyWith(
          profile: profile,
          status: UserProfile_Status.loaded,
        ),
      );
    } catch (e, stackTrace) {
      log.warning('$runtimeType: error', e, stackTrace);
      emit(
        state.copyWith(
          status: UserProfile_Status.loadError,
        ),
      );
    }
  }
}
