import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../outside/repositories/memes/repository.dart';
import '../../../shared/mixins/logging.dart';
import 'events.dart';
import 'state.dart';

class MemeFeed_Bloc extends Bloc<MemeFeed_Event, MemeFeed_State>
    with SharedMixin_Logging {
  MemeFeed_Bloc({
    required Meme_Repository memeRepository,
    required MemeFeed_State initialState,
  })  : _memeRepository = memeRepository,
        super(initialState) {
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
    } catch (e, stackTrace) {
      log.warning('${event.runtimeType}: error', e, stackTrace);
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
