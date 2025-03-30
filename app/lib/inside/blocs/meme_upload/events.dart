import 'dart:io';

abstract class MemeUpload_Event {}

class MemeUpload_Event_SubmitMeme extends MemeUpload_Event {
  final String title;
  final File imageFile;

  MemeUpload_Event_SubmitMeme({
    required this.title,
    required this.imageFile,
  });
}
