// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemeUpload_State _$MemeUpload_StateFromJson(Map<String, dynamic> json) =>
    MemeUpload_State(
      status: $enumDecodeNullable(_$MemeUpload_StatusEnumMap, json['status']) ??
          MemeUpload_Status.idle,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$MemeUpload_StateToJson(MemeUpload_State instance) =>
    <String, dynamic>{
      'status': _$MemeUpload_StatusEnumMap[instance.status]!,
      'errorMessage': instance.errorMessage,
    };

const _$MemeUpload_StatusEnumMap = {
  MemeUpload_Status.idle: 'idle',
  MemeUpload_Status.loading: 'loading',
  MemeUpload_Status.success: 'success',
  MemeUpload_Status.failure: 'failure',
};
