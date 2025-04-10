import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../outside/repositories/profile/repository.dart';
import 'state.dart';

class UserUploadedMemes_Cubit extends Cubit<UserUploadedMemes_State> {
  UserUploadedMemes_Cubit({
    required Profile_Repository profileRepository,
    required UserUploadedMemes_State initialState,
  })  : _profileRepository = profileRepository,
        super(initialState);

  final Profile_Repository _profileRepository;

  Future<void> fetchUploadedMemes({required String userId}) async {
    try {
      emit(state.copyWith(status: UserUploadedMemes_Status.loading));

      final memes = await _profileRepository.fetchUploadedMemes(
        creatorId: userId,
      );

      emit(
        state.copyWith(
          status: UserUploadedMemes_Status.loaded,
          memes: memes,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: UserUploadedMemes_Status.error));
    }
  }
}
