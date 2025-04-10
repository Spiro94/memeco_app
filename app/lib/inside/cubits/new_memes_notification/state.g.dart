// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewMemesNotification_State _$NewMemesNotification_StateFromJson(
        Map<String, dynamic> json) =>
    NewMemesNotification_State(
      hasNewMemes: json['hasNewMemes'] as bool,
      currentAmountOfMemes: (json['currentAmountOfMemes'] as num).toInt(),
    );

Map<String, dynamic> _$NewMemesNotification_StateToJson(
        NewMemesNotification_State instance) =>
    <String, dynamic>{
      'hasNewMemes': instance.hasNewMemes,
      'currentAmountOfMemes': instance.currentAmountOfMemes,
    };
