import 'package:json_annotation/json_annotation.dart';

import '../../../shared/models/meme.dart';

part 'state.g.dart';

enum UploadedMemes_Status {
  idle,
  loading,
  loaded,
  error,
}

@JsonSerializable()
class UploadedMemes_State {
  UploadedMemes_State({
    this.status = UploadedMemes_Status.idle,
    this.memes = const [],
  });

  final UploadedMemes_Status status;
  final List<Model_Meme> memes;

  factory UploadedMemes_State.initial() {
    return UploadedMemes_State(
      status: UploadedMemes_Status.idle,
      memes: [],
    );
  }

  UploadedMemes_State copyWith({
    UploadedMemes_Status? status,
    List<Model_Meme>? memes,
  }) {
    return UploadedMemes_State(
      status: status ?? this.status,
      memes: memes ?? this.memes,
    );
  }

  factory UploadedMemes_State.fromJson(Map<String, dynamic> json) =>
      _$UploadedMemes_StateFromJson(json);
  Map<String, dynamic> toJson() => _$UploadedMemes_StateToJson(this);
}
