import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../outside/repositories/memes/repository.dart';
import '../../../shared/mixins/logging.dart';
import 'state.dart';

class NewMemesNotification_Cubit extends Cubit<NewMemesNotification_State>
    with SharedMixin_Logging {
  NewMemesNotification_Cubit({
    required Meme_Repository memeRepository,
    required NewMemesNotification_State initialState,
  })  : _memeRepository = memeRepository,
        super(initialState) {
    _streamSubscription = _memeRepository
        .streamMeme()
        .debounceTime(const Duration(seconds: 300))
        .listen(
      (data) {
        log.finer('### New memes notification stream: ${data.length}');
        if (data.length > state.currentAmountOfMemes) {
          emit(
            state.copyWith(
              hasNewMemes: true,
              currentAmountOfMemes: data.length,
            ),
          );
        } else {
          emit(state.copyWith(hasNewMemes: false));
        }
      },
      onError: (dynamic error) {
        log.severe('Error in new memes notification stream: $error');
      },
    );
  }

  final Meme_Repository _memeRepository;
  StreamSubscription<List<Map<String, dynamic>>>? _streamSubscription;

  void clearNotification() {
    emit(state.copyWith(hasNewMemes: false));
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    return super.close();
  }
}
