import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../outside/repositories/memes/repository.dart';
import 'events.dart';
import 'state.dart';

class MemeVote_Bloc extends Bloc<MemeVote_Event, MemeVote_State> {
  MemeVote_Bloc({
    required Meme_Repository memeRepository,
    required MemeVote_State initialState,
  })  : _memeRepository = memeRepository,
        super(initialState) {
    on<MemeVote_LikeMemeEvent>(
      _onLikeMeme,
      transformer: sequential(),
    );
    on<MemeVote_DislikeMemeEvent>(
      _onDislikeMeme,
      transformer: sequential(),
    );
  }

  final Meme_Repository _memeRepository;

  FutureOr<void> _onLikeMeme(
    MemeVote_LikeMemeEvent event,
    Emitter<MemeVote_State> emit,
  ) async {
    emit(state.copyWith(status: MemeVote_Status.loading));
    try {
      emit(
        state.copyWith(
          likes: state.likes + (state.isLiked ? -1 : 1),
          isLiked: !state.isLiked,
          isDisliked: false,
          dislikes: state.isDisliked ? state.dislikes - 1 : state.dislikes,
          status: MemeVote_Status.success,
        ),
      );
      await _memeRepository.likeMeme(
        memeId: state.memeId,
        shouldDeleteVote: !state.isLiked,
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

  FutureOr<void> _onDislikeMeme(
    MemeVote_DislikeMemeEvent event,
    Emitter<MemeVote_State> emit,
  ) async {
    emit(state.copyWith(status: MemeVote_Status.loading));
    try {
      emit(
        state.copyWith(
          dislikes: state.dislikes + (state.isDisliked ? -1 : 1),
          isDisliked: !state.isDisliked,
          isLiked: false,
          likes: state.isLiked ? state.likes - 1 : state.likes,
          status: MemeVote_Status.success,
        ),
      );
      await _memeRepository.dislikeMeme(
        memeId: state.memeId,
        shouldDeleteVote: !state.isDisliked,
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
