import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_todo_list/entity/theme.dart';
import 'package:flutter_todo_list/feature/host/bloc/host_logic.dart';

@immutable
class HostState extends Equatable {
  const HostState({
    this.theme = Theme.light,
  });

  final Theme theme;

  ColorScheme get colorScheme => toColorScheme(theme);

  HostState copyWith({
    Theme? theme,
  }) {
    return HostState(
      theme: theme ?? this.theme,
    );
  }

  @override
  List<Object?> get props => [theme];

  @override
  String toString() {
    return 'HostState(theme: $theme)';
  }
}
