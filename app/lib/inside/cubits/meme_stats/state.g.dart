// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemeStats_State _$MemeStats_StateFromJson(Map<String, dynamic> json) =>
    MemeStats_State(
      memeStats:
          Model_MemeStats.fromJson(json['memeStats'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$MemeStats_StatusEnumMap, json['status']) ??
          MemeStats_Status.idle,
    );

Map<String, dynamic> _$MemeStats_StateToJson(MemeStats_State instance) =>
    <String, dynamic>{
      'memeStats': instance.memeStats,
      'status': _$MemeStats_StatusEnumMap[instance.status]!,
    };

const _$MemeStats_StatusEnumMap = {
  MemeStats_Status.idle: 'idle',
  MemeStats_Status.loading: 'loading',
  MemeStats_Status.loaded: 'loaded',
  MemeStats_Status.error: 'error',
};
