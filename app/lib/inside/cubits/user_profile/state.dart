import 'package:json_annotation/json_annotation.dart';

import '../../../shared/models/profile.dart';

part 'state.g.dart';

enum UserProfile_Status {
  idle,
  loading,
  loaded,
  loadError,
  success,
  failure,
}

@JsonSerializable()
class UserProfile_State {
  final Model_Profile? profile;
  final UserProfile_Status status;

  UserProfile_State({
    this.profile,
    this.status = UserProfile_Status.idle,
  });

  UserProfile_State copyWith({
    Model_Profile? profile,
    UserProfile_Status? status,
  }) {
    return UserProfile_State(
      profile: profile ?? this.profile,
      status: status ?? this.status,
    );
  }

  factory UserProfile_State.fromJson(Map<String, dynamic> json) =>
      _$UserProfile_StateFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfile_StateToJson(this);
}
