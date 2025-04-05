import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../outside/repositories/memes/repository.dart';
import 'events.dart';
import 'state.dart';

class MemeDetails_Bloc extends Bloc<MemeDetails_Event, MemeDetails_State> {
  MemeDetails_Bloc({
    required Meme_Repository memeRepository,
    required MemeDetails_State initialState,
  })  : _memeRepository = memeRepository,
        super(initialState) {
    on<MemeDetails_Event_Fetch>(
      _onFetchMeme,
      transformer: sequential(),
    );
  }

  final Meme_Repository _memeRepository;

  Future<void> _onFetchMeme(
    MemeDetails_Event_Fetch event,
    Emitter<MemeDetails_State> emit,
  ) async {
    emit(
      state.copyWith(
        status: MemeDetails_Status.loading,
      ),
    );
    try {
      final meme =
          await _memeRepository.fetchMemeWithVotes(memeId: event.memeId);
      emit(
        state.copyWith(
          status: MemeDetails_Status.loaded,
          memeWithVotes: meme,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: MemeDetails_Status.error,
          errorMessage: e.toString(),
        ),
      );
    } finally {
      emit(state.copyWith(status: MemeDetails_Status.idle));
    }
  }
}
