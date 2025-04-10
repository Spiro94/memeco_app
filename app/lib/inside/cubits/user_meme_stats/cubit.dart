import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../outside/repositories/profile/repository.dart';
import 'state.dart';

class UserMemeStats_Cubit extends Cubit<UserMemeStats_State> {
  UserMemeStats_Cubit({
    required Profile_Repository profileRepository,
    required UserMemeStats_State initialState,
  })  : _profileRepository = profileRepository,
        super(initialState);

  final Profile_Repository _profileRepository;

  Future<void> fetchMemeStats({required String userId}) async {
    try {
      emit(state.copyWith(status: MemeStats_Status.loading));

      final stats = await _profileRepository.fetchMemeStats(
        userId: userId,
      );

      emit(
        state.copyWith(
          status: MemeStats_Status.loaded,
          memeStats: stats,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: MemeStats_Status.error));
    }
  }
}
