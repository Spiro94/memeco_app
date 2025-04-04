import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Model_Profile {
  final String id;
  final String username;
  final String email;
  final String? profilePicture;

  const Model_Profile({
    required this.id,
    required this.username,
    required this.email,
    this.profilePicture,
  });

  factory Model_Profile.fromJson(Map<String, dynamic> json) =>
      _$Model_ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$Model_ProfileToJson(this);
}
