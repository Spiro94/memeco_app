// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemeFeed_State _$MemeFeed_StateFromJson(Map<String, dynamic> json) =>
    MemeFeed_State(
      status: $enumDecodeNullable(_$MemeFeed_StatusEnumMap, json['status']) ??
          MemeFeed_Status.idle,
      memesWithVotes: (json['memesWithVotes'] as List<dynamic>?)
              ?.map((e) =>
                  Model_Meme_WithVotes.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$MemeFeed_StateToJson(MemeFeed_State instance) =>
    <String, dynamic>{
      'status': _$MemeFeed_StatusEnumMap[instance.status]!,
      'memesWithVotes': instance.memesWithVotes,
      'errorMessage': instance.errorMessage,
    };

const _$MemeFeed_StatusEnumMap = {
  MemeFeed_Status.idle: 'idle',
  MemeFeed_Status.loading: 'loading',
  MemeFeed_Status.loaded: 'loaded',
  MemeFeed_Status.loadError: 'loadError',
  MemeFeed_Status.success: 'success',
  MemeFeed_Status.failure: 'failure',
};
