import 'package:json_annotation/json_annotation.dart';

part 'state.g.dart';

@JsonSerializable()
class NewMemesNotification_State {
  final bool hasNewMemes;
  final int currentAmountOfMemes;

  NewMemesNotification_State({
    required this.hasNewMemes,
    required this.currentAmountOfMemes,
  });

  factory NewMemesNotification_State.initial() {
    return NewMemesNotification_State(
      hasNewMemes: false,
      currentAmountOfMemes: 0,
    );
  }

  NewMemesNotification_State copyWith({
    bool? hasNewMemes,
    int? currentAmountOfMemes,
  }) {
    return NewMemesNotification_State(
      hasNewMemes: hasNewMemes ?? this.hasNewMemes,
      currentAmountOfMemes: currentAmountOfMemes ?? this.currentAmountOfMemes,
    );
  }

  factory NewMemesNotification_State.fromJson(Map<String, dynamic> json) =>
      _$NewMemesNotification_StateFromJson(json);

  Map<String, dynamic> toJson() => _$NewMemesNotification_StateToJson(this);
}
