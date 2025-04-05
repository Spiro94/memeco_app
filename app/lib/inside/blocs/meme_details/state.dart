import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../shared/models/meme_with_votes.dart';

part 'state.g.dart';

enum MemeDetails_Status { idle, loading, loaded, error }

@JsonSerializable()
class MemeDetails_State extends Equatable {
  final MemeDetails_Status status;
  final Model_Meme_WithVotes? memeWithVotes;
  final String? errorMessage;

  const MemeDetails_State({
    required this.status,
    this.memeWithVotes,
    this.errorMessage,
  });

  factory MemeDetails_State.initial() =>
      const MemeDetails_State(status: MemeDetails_Status.idle);

  MemeDetails_State copyWith({
    MemeDetails_Status? status,
    Model_Meme_WithVotes? memeWithVotes,
    String? errorMessage,
  }) {
    return MemeDetails_State(
      status: status ?? this.status,
      memeWithVotes: memeWithVotes ?? this.memeWithVotes,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, memeWithVotes, errorMessage];

  factory MemeDetails_State.fromJson(Map<String, dynamic> json) =>
      _$MemeDetails_StateFromJson(json);
  Map<String, dynamic> toJson() => _$MemeDetails_StateToJson(this);
}
