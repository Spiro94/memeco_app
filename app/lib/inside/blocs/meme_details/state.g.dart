// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemeDetails_State _$MemeDetails_StateFromJson(Map<String, dynamic> json) =>
    MemeDetails_State(
      status: $enumDecode(_$MemeDetails_StatusEnumMap, json['status']),
      memeWithVotes: json['memeWithVotes'] == null
          ? null
          : Model_Meme_WithVotes.fromJson(
              json['memeWithVotes'] as Map<String, dynamic>),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$MemeDetails_StateToJson(MemeDetails_State instance) =>
    <String, dynamic>{
      'status': _$MemeDetails_StatusEnumMap[instance.status]!,
      'memeWithVotes': instance.memeWithVotes,
      'errorMessage': instance.errorMessage,
    };

const _$MemeDetails_StatusEnumMap = {
  MemeDetails_Status.idle: 'idle',
  MemeDetails_Status.loading: 'loading',
  MemeDetails_Status.loaded: 'loaded',
  MemeDetails_Status.error: 'error',
};
