// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUploadedMemes_State _$UserUploadedMemes_StateFromJson(
        Map<String, dynamic> json) =>
    UserUploadedMemes_State(
      status:
          $enumDecodeNullable(_$UploadedMemes_StatusEnumMap, json['status']) ??
              UploadedMemes_Status.idle,
      memes: (json['memes'] as List<dynamic>?)
              ?.map((e) => Model_Meme.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserUploadedMemes_StateToJson(
        UserUploadedMemes_State instance) =>
    <String, dynamic>{
      'status': _$UploadedMemes_StatusEnumMap[instance.status]!,
      'memes': instance.memes,
    };

const _$UploadedMemes_StatusEnumMap = {
  UploadedMemes_Status.idle: 'idle',
  UploadedMemes_Status.loading: 'loading',
  UploadedMemes_Status.loaded: 'loaded',
  UploadedMemes_Status.error: 'error',
};
