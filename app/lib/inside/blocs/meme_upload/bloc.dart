import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../outside/repositories/posts/repository.dart';
import 'events.dart';
import 'state.dart';

class MemeUpload_Bloc extends Bloc<MemeUpload_Event, MemeUpload_State> {
  final Meme_Repository memeRepository;

  MemeUpload_Bloc({required this.memeRepository})
      : super(const MemeUpload_State()) {
    on<MemeUpload_Event_SubmitMeme>(_onSubmitMeme);
  }

  Future<void> _onSubmitMeme(
    MemeUpload_Event_SubmitMeme event,
    Emitter<MemeUpload_State> emit,
  ) async {
    emit(state.copyWith(status: MemeUpload_Status.loading));
    try {
      await memeRepository.uploadMeme(
        title: event.title,
        imageFile: event.imageFile,
      );
      emit(state.copyWith(status: MemeUpload_Status.success));
    } catch (error) {
      emit(state.copyWith(
        status: MemeUpload_Status.failure,
        errorMessage: error.toString(),
      ));
    } finally {
      emit(state.copyWith(status: MemeUpload_Status.idle));
    }
  }
}
