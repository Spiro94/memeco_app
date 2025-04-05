// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemeVote_State _$MemeVote_StateFromJson(Map<String, dynamic> json) =>
    MemeVote_State(
      status: $enumDecode(_$MemeVote_StatusEnumMap, json['status']),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$MemeVote_StateToJson(MemeVote_State instance) =>
    <String, dynamic>{
      'status': _$MemeVote_StatusEnumMap[instance.status]!,
      'errorMessage': instance.errorMessage,
    };

const _$MemeVote_StatusEnumMap = {
  MemeVote_Status.idle: 'idle',
  MemeVote_Status.loading: 'loading',
  MemeVote_Status.loaded: 'loaded',
  MemeVote_Status.error: 'error',
};
