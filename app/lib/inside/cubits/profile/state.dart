import 'package:json_annotation/json_annotation.dart';

import '../../../shared/models/profile.dart';

part 'state.g.dart';

enum Profile_Status {
  idle,
  loading,
  loaded,
  loadError,
  success,
  failure,
}

@JsonSerializable()
class Profile_State {
  final Model_Profile? profile;
  final Profile_Status status;

  Profile_State({
    this.profile,
    this.status = Profile_Status.idle,
  });

  Profile_State copyWith({
    Model_Profile? profile,
    Profile_Status? status,
  }) {
    return Profile_State(
      profile: profile ?? this.profile,
      status: status ?? this.status,
    );
  }

  factory Profile_State.fromJson(Map<String, dynamic> json) =>
      _$Profile_StateFromJson(json);

  Map<String, dynamic> toJson() => _$Profile_StateToJson(this);
}
