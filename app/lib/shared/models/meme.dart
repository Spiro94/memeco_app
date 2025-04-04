import 'package:json_annotation/json_annotation.dart';

part 'meme.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Model_Meme {
  final String id;
  final String title;
  final String imageUrl;
  final DateTime createdAt;

  Model_Meme({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.createdAt,
  });

  factory Model_Meme.fromJson(Map<String, dynamic> json) =>
      _$Model_MemeFromJson(json);
  Map<String, dynamic> toJson() => _$Model_MemeToJson(this);
}
