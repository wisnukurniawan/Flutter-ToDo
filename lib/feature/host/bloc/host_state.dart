import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Theme;

import '../../../foundation/theme/color.dart';

@immutable
class HostState extends Equatable {
  final ColorScheme colorScheme;

  const HostState({
    this.colorScheme = lightColorPalette,
  });

  HostState copyWith({
    ColorScheme? colorScheme,
  }) {
    return HostState(
      colorScheme: colorScheme ?? this.colorScheme,
    );
  }

  @override
  List<Object?> get props => [colorScheme];
}
