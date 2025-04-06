import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../outside/repositories/memes/repository.dart';
import 'state.dart';

class MemeVote_Cubit extends Cubit<MemeVote_State> {
  MemeVote_Cubit({
    required Meme_Repository memeRepository,
    required MemeVote_State initialState,
  })  : _memeRepository = memeRepository,
        super(initialState);

  final Meme_Repository _memeRepository;

  Future<void> likeMeme(
    String memeId, {
    bool shouldDelete = false,
  }) async {
    emit(state.copyWith(status: MemeVote_Status.loading));
    try {
      await _memeRepository.likeMeme(
        memeId: memeId,
        shouldDeleteVote: shouldDelete,
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: MemeVote_Status.error,
          errorMessage: e.toString(),
        ),
      );
    } finally {
      emit(state.copyWith(status: MemeVote_Status.idle));
    }
  }

  Future<void> dislikeMeme(
    String memeId, {
    bool shouldDelete = false,
  }) async {
    emit(state.copyWith(status: MemeVote_Status.loading));
    try {
      await _memeRepository.dislikeMeme(
        memeId: memeId,
        shouldDeleteVote: shouldDelete,
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: MemeVote_Status.error,
          errorMessage: e.toString(),
        ),
      );
    } finally {
      emit(state.copyWith(status: MemeVote_Status.idle));
    }
  }
}
