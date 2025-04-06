import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'state.g.dart';

enum MemeVote_Status {
  idle,
  loading,
  loaded,
  error,
  success,
}

@JsonSerializable()
class MemeVote_State extends Equatable {
  const MemeVote_State({
    required this.memeId,
    required this.status,
    required this.likes,
    required this.dislikes,
    required this.isLiked,
    required this.isDisliked,
    this.errorMessage,
  });

  final String memeId;
  final int likes;
  final int dislikes;
  final bool isLiked;
  final bool isDisliked;
  final String? errorMessage;
  final MemeVote_Status status;

  factory MemeVote_State.initial({
    required String memeId,
    required int likes,
    required int dislikes,
    required bool isLiked,
    required bool isDisliked,
  }) =>
      MemeVote_State(
        memeId: memeId,
        likes: likes,
        dislikes: dislikes,
        isLiked: isLiked,
        isDisliked: isDisliked,
        status: MemeVote_Status.idle,
      );

  MemeVote_State copyWith({
    String? memeId,
    int? likes,
    int? dislikes,
    bool? isLiked,
    bool? isDisliked,
    MemeVote_Status? status,
    String? errorMessage,
  }) {
    return MemeVote_State(
      memeId: memeId ?? this.memeId,
      likes: likes ?? this.likes,
      dislikes: dislikes ?? this.dislikes,
      isLiked: isLiked ?? this.isLiked,
      isDisliked: isDisliked ?? this.isDisliked,
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
