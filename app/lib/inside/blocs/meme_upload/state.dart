import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'state.g.dart';

enum MemeUpload_Status { idle, loading, success, failure, imageNotSafe }

@JsonSerializable()
class MemeUpload_State extends Equatable {
  const MemeUpload_State({
    this.status = MemeUpload_Status.idle,
    this.errorMessage,
  });

  final MemeUpload_Status status;
  final String? errorMessage;

  MemeUpload_State copyWith({
    MemeUpload_Status? status,
    String? errorMessage,
  }) {
    return MemeUpload_State(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory MemeUpload_State.fromJson(Map<String, dynamic> json) =>
      _$MemeUpload_StateFromJson(json);

  Map<String, dynamic> toJson() => _$MemeUpload_StateToJson(this);

  @override
  List<Object?> get props => [status, errorMessage];
}
