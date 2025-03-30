import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../outside/repositories/posts/repository.dart';
import 'events.dart';
import 'state.dart';

class MemeFeed_Bloc extends Bloc<MemeFeed_Event, MemeFeed_State> {
  MemeFeed_Bloc({
    required Meme_Repository memeRepository,
  })  : _memeRepository = memeRepository,
        super(
          const MemeFeed_State(
            status: MemeFeed_Status.idle,
          ),
        ) {
    on<MemeFeed_Event_FetchMemes>(_onLoad);
  }

  final Meme_Repository _memeRepository;

  Future<void> _onLoad(
    MemeFeed_Event_FetchMemes event,
    Emitter<MemeFeed_State> emit,
  ) async {
    try {
      final memes = await _memeRepository.fetchMemes();

      emit(
        state.copyWith(
          memes: memes,
          status: MemeFeed_Status.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: MemeFeed_Status.loadError,
        ),
      );
    } finally {
      emit(
        state.copyWith(
          status: MemeFeed_Status.idle,
        ),
      );
    }
  }
}
