import 'package:json_annotation/json_annotation.dart';

part 'meme.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Meme {
  final String id;
  final String title;
  final String imageUrl;
  final DateTime createdAt;

  Meme({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.createdAt,
  });

  factory Meme.fromJson(Map<String, dynamic> json) => _$MemeFromJson(json);
  Map<String, dynamic> toJson() => _$MemeToJson(this);
}
