import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../outside/repositories/memes/repository.dart';
import '../../../shared/mixins/logging.dart';
import 'events.dart';
import 'state.dart';

class MemeUpload_Bloc extends Bloc<MemeUpload_Event, MemeUpload_State>
    with SharedMixin_Logging {
  MemeUpload_Bloc({
    required Meme_Repository memeRepository,
    required MemeUpload_State initialState,
  })  : _memeRepository = memeRepository,
        super(initialState) {
    on<MemeUpload_Event_SubmitMeme>(_onSubmitMeme);
  }

  final Meme_Repository _memeRepository;

  Future<void> _onSubmitMeme(
    MemeUpload_Event_SubmitMeme event,
    Emitter<MemeUpload_State> emit,
  ) async {
    emit(state.copyWith(status: MemeUpload_Status.loading));
    try {
      final result = await _memeRepository.uploadMeme(
        title: event.title,
        imageFile: event.imageFile,
      );
      if (result) {
        emit(state.copyWith(status: MemeUpload_Status.success));
      } else {
        emit(
          state.copyWith(
            status: MemeUpload_Status.imageNotSafe,
            errorMessage: 'Image is not safe for upload',
          ),
        );
      }
    } catch (e, stackTrace) {
      log.warning('${event.runtimeType}: error', e, stackTrace);
      emit(
        state.copyWith(
          status: MemeUpload_Status.failure,
          errorMessage: e.toString(),
        ),
      );
    } finally {
      emit(state.copyWith(status: MemeUpload_Status.idle));
    }
  }
}
