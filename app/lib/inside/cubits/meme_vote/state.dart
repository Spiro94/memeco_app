import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'state.g.dart';

enum MemeVote_Status { idle, loading, loaded, error }

@JsonSerializable()
class MemeVote_State extends Equatable {
  final MemeVote_Status status;

  final String? errorMessage;

  const MemeVote_State({
    required this.status,
    this.errorMessage,
  });

  factory MemeVote_State.initial() =>
      const MemeVote_State(status: MemeVote_Status.idle);

  MemeVote_State copyWith({
    MemeVote_Status? status,
    String? errorMessage,
  }) {
    return MemeVote_State(
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];

  Map<String, dynamic> toJson() => _$MemeVote_StateToJson(this);
  static MemeVote_State fromJson(Map<String, dynamic> json) =>
      _$MemeVote_StateFromJson(json);
}
