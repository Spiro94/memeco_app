import 'package:json_annotation/json_annotation.dart';

import '../../../shared/models/meme.dart';

part 'state.g.dart';

enum UserUploadedMemes_Status {
  idle,
  loading,
  loaded,
  error,
}

@JsonSerializable()
class UserUploadedMemes_State {
  UserUploadedMemes_State({
    this.status = UserUploadedMemes_Status.idle,
    this.memes = const [],
  });

  final UserUploadedMemes_Status status;
  final List<Model_Meme> memes;

  factory UserUploadedMemes_State.initial() {
    return UserUploadedMemes_State(
      status: UserUploadedMemes_Status.idle,
      memes: [],
    );
  }

  UserUploadedMemes_State copyWith({
    UserUploadedMemes_Status? status,
    List<Model_Meme>? memes,
  }) {
    return UserUploadedMemes_State(
      status: status ?? this.status,
      memes: memes ?? this.memes,
    );
  }

  factory UserUploadedMemes_State.fromJson(Map<String, dynamic> json) =>
      _$UserUploadedMemes_StateFromJson(json);
  Map<String, dynamic> toJson() => _$UserUploadedMemes_StateToJson(this);
}
