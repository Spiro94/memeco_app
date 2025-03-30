import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Model_Post {
  Model_Post({
    required this.id,
    required this.title,
    required this.filePath,
  });

  final String id;
  final String title;
  final String filePath;

  factory Model_Post.fromJson(Map<String, dynamic> json) =>
      _$Model_PostFromJson(json);

  Map<String, dynamic> toJson() => _$Model_PostToJson(this);
}
