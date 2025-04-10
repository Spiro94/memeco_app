// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile_State _$UserProfile_StateFromJson(Map<String, dynamic> json) =>
    UserProfile_State(
      profile: json['profile'] == null
          ? null
          : Model_Profile.fromJson(json['profile'] as Map<String, dynamic>),
      status:
          $enumDecodeNullable(_$UserProfile_StatusEnumMap, json['status']) ??
              UserProfile_Status.idle,
    );

Map<String, dynamic> _$UserProfile_StateToJson(UserProfile_State instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'status': _$UserProfile_StatusEnumMap[instance.status]!,
    };

const _$UserProfile_StatusEnumMap = {
  UserProfile_Status.idle: 'idle',
  UserProfile_Status.loading: 'loading',
  UserProfile_Status.loaded: 'loaded',
  UserProfile_Status.loadError: 'loadError',
  UserProfile_Status.success: 'success',
  UserProfile_Status.failure: 'failure',
};
