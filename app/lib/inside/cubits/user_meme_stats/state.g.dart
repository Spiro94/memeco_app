// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMemeStats_State _$UserMemeStats_StateFromJson(Map<String, dynamic> json) =>
    UserMemeStats_State(
      memeStats:
          Model_MemeStats.fromJson(json['memeStats'] as Map<String, dynamic>),
      status:
          $enumDecodeNullable(_$UserMemeStats_StatusEnumMap, json['status']) ??
              UserMemeStats_Status.idle,
    );

Map<String, dynamic> _$UserMemeStats_StateToJson(
        UserMemeStats_State instance) =>
    <String, dynamic>{
      'memeStats': instance.memeStats,
      'status': _$UserMemeStats_StatusEnumMap[instance.status]!,
    };

const _$UserMemeStats_StatusEnumMap = {
  UserMemeStats_Status.idle: 'idle',
  UserMemeStats_Status.loading: 'loading',
  UserMemeStats_Status.loaded: 'loaded',
  UserMemeStats_Status.error: 'error',
};
