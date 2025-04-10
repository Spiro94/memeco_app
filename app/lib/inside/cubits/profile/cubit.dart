import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../outside/repositories/profile/repository.dart';
import '../../../shared/mixins/logging.dart';
import 'state.dart';

class Profile_Cubit extends Cubit<Profile_State> with SharedMixin_Logging {
  Profile_Cubit({
    required Profile_Repository profileRepository,
  })  : _profileRepository = profileRepository,
        super(Profile_State());

  final Profile_Repository _profileRepository;

  Future<void> fetchProfile({required String userId}) async {
    try {
      final profile = await _profileRepository.fetchProfile(userId: userId);

      emit(
        state.copyWith(
          profile: profile,
          status: Profile_Status.loaded,
        ),
      );
    } catch (e, stackTrace) {
      log.warning('$runtimeType: error', e, stackTrace);
      emit(
        state.copyWith(
          status: Profile_Status.loadError,
        ),
      );
    } finally {
      emit(
        state.copyWith(
          status: Profile_Status.idle,
        ),
      );
    }
  }
}
