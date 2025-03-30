// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model_Post _$Model_PostFromJson(Map<String, dynamic> json) => Model_Post(
      id: json['id'] as String,
      title: json['title'] as String,
      filePath: json['file_path'] as String,
    );

Map<String, dynamic> _$Model_PostToJson(Model_Post instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'file_path': instance.filePath,
    };
