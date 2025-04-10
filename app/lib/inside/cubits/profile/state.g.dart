// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile_State _$Profile_StateFromJson(Map<String, dynamic> json) =>
    Profile_State(
      profile: json['profile'] == null
          ? null
          : Model_Profile.fromJson(json['profile'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$Profile_StatusEnumMap, json['status']) ??
          Profile_Status.idle,
    );

Map<String, dynamic> _$Profile_StateToJson(Profile_State instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'status': _$Profile_StatusEnumMap[instance.status]!,
    };

const _$Profile_StatusEnumMap = {
  Profile_Status.idle: 'idle',
  Profile_Status.loading: 'loading',
  Profile_Status.loaded: 'loaded',
  Profile_Status.loadError: 'loadError',
  Profile_Status.success: 'success',
  Profile_Status.failure: 'failure',
};
