// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemeVote_State _$MemeVote_StateFromJson(Map<String, dynamic> json) =>
    MemeVote_State(
      memeId: json['memeId'] as String,
      status: $enumDecode(_$MemeVote_StatusEnumMap, json['status']),
      likes: (json['likes'] as num).toInt(),
      dislikes: (json['dislikes'] as num).toInt(),
      isLiked: json['isLiked'] as bool,
      isDisliked: json['isDisliked'] as bool,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$MemeVote_StateToJson(MemeVote_State instance) =>
    <String, dynamic>{
      'memeId': instance.memeId,
      'likes': instance.likes,
      'dislikes': instance.dislikes,
      'isLiked': instance.isLiked,
      'isDisliked': instance.isDisliked,
      'errorMessage': instance.errorMessage,
      'status': _$MemeVote_StatusEnumMap[instance.status]!,
    };

const _$MemeVote_StatusEnumMap = {
  MemeVote_Status.idle: 'idle',
  MemeVote_Status.loading: 'loading',
  MemeVote_Status.loaded: 'loaded',
  MemeVote_Status.error: 'error',
  MemeVote_Status.success: 'success',
};
