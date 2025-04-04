import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../outside/repositories/profile/repository.dart';
import '../../../shared/mixins/logging.dart';
import 'events.dart';
import 'state.dart';

class Profile_Bloc extends Bloc<Profile_Event, Profile_State>
    with SharedMixin_Logging {
  Profile_Bloc({
    required Profile_Repository profileRepository,
    required Profile_State initialState,
  })  : _profile_repository = profileRepository,
        super(initialState) {
    on<ProfileEvent_Load>(_onLoad);
  }

  final Profile_Repository _profile_repository;

  Future<void> _onLoad(
    ProfileEvent_Load event,
    Emitter<Profile_State> emit,
  ) async {
    try {
      final profile = await _profile_repository.fetchProfile();

      emit(
        state.copyWith(
          profile: profile,
          status: Profile_Status.loaded,
        ),
      );
    } catch (e, stackTrace) {
      log.warning('${event.runtimeType}: error', e, stackTrace);
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
