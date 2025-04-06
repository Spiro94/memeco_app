import 'package:json_annotation/json_annotation.dart';

import '../../../shared/models/meme_stats.dart';

part 'state.g.dart';

enum MemeStats_Status {
  idle,
  loading,
  loaded,
  error,
}

@JsonSerializable()
class MemeStats_State {
  MemeStats_State({
    required this.memeStats,
    this.status = MemeStats_Status.idle,
  });

  final Model_MemeStats memeStats;
  final MemeStats_Status status;

  factory MemeStats_State.initial() {
    return MemeStats_State(
      status: MemeStats_Status.idle,
      memeStats: Model_MemeStats(
        likesGiven: 0,
        memesPosted: 0,
      ),
    );
  }

  MemeStats_State copyWith({
    MemeStats_Status? status,
    Model_MemeStats? memeStats,
  }) {
    return MemeStats_State(
      status: status ?? this.status,
      memeStats: memeStats ?? this.memeStats,
    );
  }

  factory MemeStats_State.fromJson(Map<String, dynamic> json) =>
      _$MemeStats_StateFromJson(json);
  Map<String, dynamic> toJson() => _$MemeStats_StateToJson(this);
}
