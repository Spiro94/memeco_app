// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meme_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model_MemeStats _$Model_MemeStatsFromJson(Map<String, dynamic> json) =>
    Model_MemeStats(
      likesGiven: (json['likes_given'] as num).toInt(),
      memesPosted: (json['memes_posted'] as num).toInt(),
    );

Map<String, dynamic> _$Model_MemeStatsToJson(Model_MemeStats instance) =>
    <String, dynamic>{
      'memes_posted': instance.memesPosted,
      'likes_given': instance.likesGiven,
    };
