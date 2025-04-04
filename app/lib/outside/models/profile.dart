import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class Profile {
  const Profile({
    required this.id,
    required this.username,
    required this.email,
    this.profilePicture,
  });

  final String id;
  final String username;
  final String email;
  final String? profilePicture;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
