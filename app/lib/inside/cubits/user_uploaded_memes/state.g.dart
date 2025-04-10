// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUploadedMemes_State _$UserUploadedMemes_StateFromJson(
        Map<String, dynamic> json) =>
    UserUploadedMemes_State(
      status: $enumDecodeNullable(
              _$UserUploadedMemes_StatusEnumMap, json['status']) ??
          UserUploadedMemes_Status.idle,
      memes: (json['memes'] as List<dynamic>?)
              ?.map((e) => Model_Meme.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserUploadedMemes_StateToJson(
        UserUploadedMemes_State instance) =>
    <String, dynamic>{
      'status': _$UserUploadedMemes_StatusEnumMap[instance.status]!,
      'memes': instance.memes,
    };

const _$UserUploadedMemes_StatusEnumMap = {
  UserUploadedMemes_Status.idle: 'idle',
  UserUploadedMemes_Status.loading: 'loading',
  UserUploadedMemes_Status.loaded: 'loaded',
  UserUploadedMemes_Status.error: 'error',
};
