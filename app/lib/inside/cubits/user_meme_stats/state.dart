import 'package:json_annotation/json_annotation.dart';

import '../../../shared/models/meme_stats.dart';

part 'state.g.dart';

enum UserMemeStats_Status {
  idle,
  loading,
  loaded,
  error,
}

@JsonSerializable()
class UserMemeStats_State {
  UserMemeStats_State({
    required this.memeStats,
    this.status = UserMemeStats_Status.idle,
  });

  final Model_MemeStats memeStats;
  final UserMemeStats_Status status;

  factory UserMemeStats_State.initial() {
    return UserMemeStats_State(
      status: UserMemeStats_Status.idle,
      memeStats: Model_MemeStats(
        likesGiven: 0,
        memesPosted: 0,
      ),
    );
  }

  UserMemeStats_State copyWith({
    UserMemeStats_Status? status,
    Model_MemeStats? memeStats,
  }) {
    return UserMemeStats_State(
      status: status ?? this.status,
      memeStats: memeStats ?? this.memeStats,
    );
  }

  factory UserMemeStats_State.fromJson(Map<String, dynamic> json) =>
      _$UserMemeStats_StateFromJson(json);
  Map<String, dynamic> toJson() => _$UserMemeStats_StateToJson(this);
}
