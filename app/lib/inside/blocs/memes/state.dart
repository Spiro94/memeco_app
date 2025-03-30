import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../shared/models/meme.dart';

part 'state.g.dart';

enum MemeFeed_Status {
  idle,
  loading,
  loaded,
  loadError,
  success,
  failure,
}

@JsonSerializable()
final class MemeFeed_State extends Equatable {
  const MemeFeed_State({
    this.status = MemeFeed_Status.idle,
    this.memes = const [],
    this.errorMessage,
  });

  final MemeFeed_Status status;
  final List<Meme> memes;
  final String? errorMessage;

  MemeFeed_State copyWith({
    MemeFeed_Status? status,
    List<Meme>? memes,
    String? errorMessage,
  }) {
    return MemeFeed_State(
      status: status ?? this.status,
      memes: memes ?? this.memes,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory MemeFeed_State.fromJson(Map<String, dynamic> json) =>
      _$MemeFeed_StateFromJson(json);

  Map<String, dynamic> toJson() => _$MemeFeed_StateToJson(this);

  @override
  List<Object?> get props => [status, memes, errorMessage];
}
