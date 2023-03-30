import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class State1 extends Equatable {
  const State1({
    this.text = "",
  });

  final String text;

  State1 copyWith({
    String? text,
  }) {
    return State1(
      text: text ?? this.text,
    );
  }

  @override
  List<Object?> get props => [text];
}
