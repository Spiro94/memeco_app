import 'package:json_annotation/json_annotation.dart';

part 'meme_stats.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Model_MemeStats {
  Model_MemeStats({
    required this.likesGiven,
    required this.memesPosted,
  });

  final int memesPosted;
  final int likesGiven;

  factory Model_MemeStats.fromJson(Map<String, dynamic> json) =>
      _$Model_MemeStatsFromJson(json);

  Map<String, dynamic> toJson() => _$Model_MemeStatsToJson(this);
}
