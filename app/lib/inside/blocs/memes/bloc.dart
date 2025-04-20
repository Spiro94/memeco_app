import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../outside/repositories/memes/repository.dart';
import '../../../outside/utils/constants.dart';
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
    on<MemeFeed_Event_FetchInitialPage>(
      _oInitialPage,
      transformer: sequential(),
    );
    on<MemeFeed_Event_FetchNextPage>(
      _onNextPage,
      transformer: sequential(),
    );
    on<MemeFeed_Event_RefreshPage>(
      _onRefreshPage,
      transformer: sequential(),
    );
  }

  final Meme_Repository _memeRepository;

  Future<void> _onLoad(
    MemeFeed_Event_FetchMemes event,
    Emitter<MemeFeed_State> emit,
  ) async {
    try {
      final memes = await _memeRepository.fetchMemesWithVotes();

      emit(
        state.copyWith(
          memesWithVotes: memes,
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

  Future<void> _oInitialPage(
    MemeFeed_Event_FetchInitialPage event,
    Emitter<MemeFeed_State> emit,
  ) async {
    try {
      final memes = await _memeRepository.fetchMemesWithVotesPaginated();

      emit(
        state.copyWith(
          memesWithVotes: memes,
          setCursor: (memes.isNotEmpty && memes.length == pageSize)
              ? () => memes.last.meme.createdAt
              : () => null,
          setNewestcursor:
              memes.isNotEmpty ? () => memes.first.meme.createdAt : () => null,
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

  Future<void> _onNextPage(
    MemeFeed_Event_FetchNextPage event,
    Emitter<MemeFeed_State> emit,
  ) async {
    /// Check if the cursor is null, if it is, we don't need to fetch more memes

    if (state.cursor == null) {
      return;
    }
    try {
      final memes = await _memeRepository.fetchMemesWithVotesPaginated(
        cursor: state.cursor?.toIso8601String(),
      );

      emit(
        state.copyWith(
          memesWithVotes: [...state.memesWithVotes, ...memes],
          setCursor: (memes.isNotEmpty && memes.length == pageSize)
              ? () => memes.last.meme.createdAt
              : () => null,
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

  Future<void> _onRefreshPage(
    MemeFeed_Event_RefreshPage event,
    Emitter<MemeFeed_State> emit,
  ) async {
    try {
      if (state.newestCursor == null) {
        add(const MemeFeed_Event_FetchInitialPage());
        return;
      }

      emit(
        state.copyWith(
          status: MemeFeed_Status.refreshing,
        ),
      );

      log.info(
        'Fetching memes newer than ${state.newestCursor!.toIso8601String()}',
      );

      final newerMemes = await _memeRepository.fetchMemesWithVotesNewer(
        state.newestCursor!.toIso8601String(),
      );

      if (newerMemes.isEmpty) {
        return;
      }

      final combined = [
        ...{for (final m in newerMemes) m.meme.id: m}.values,
        ...state.memesWithVotes,
      ];

      emit(
        state.copyWith(
          memesWithVotes: combined,
          setCursor: (newerMemes.isNotEmpty && newerMemes.length == pageSize)
              ? () => newerMemes.last.meme.createdAt
              : () => null,
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
