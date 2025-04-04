// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model_Profile _$Model_ProfileFromJson(Map<String, dynamic> json) =>
    Model_Profile(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      profilePicture: json['profile_picture'] as String?,
    );

Map<String, dynamic> _$Model_ProfileToJson(Model_Profile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'profile_picture': instance.profilePicture,
    };
