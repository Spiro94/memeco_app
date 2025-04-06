import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../outside/repositories/profile/repository.dart';
import 'state.dart';

class UploadedMemes_Cubit extends Cubit<UploadedMemes_State> {
  UploadedMemes_Cubit({
    required Profile_Repository profileRepository,
    required UploadedMemes_State initialState,
  })  : _profileRepository = profileRepository,
        super(initialState);

  final Profile_Repository _profileRepository;

  Future<void> fetchUploadedMemes({required String userId}) async {
    try {
      emit(state.copyWith(status: UploadedMemes_Status.loading));

      final memes = await _profileRepository.fetchUploadedMemes(
        creatorId: userId,
      );

      emit(
        state.copyWith(
          status: UploadedMemes_Status.loaded,
          memes: memes,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: UploadedMemes_Status.error));
    }
  }
}
