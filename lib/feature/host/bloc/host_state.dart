import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_todo_list/entity/theme.dart';

import '../../../utils/locale.dart';
import 'host_bloc.dart';

@immutable
class HostState extends Equatable {
  const HostState({
    this.theme = Theme.light,
    this.locale = const Locale(defaultLocaleCode),
  });

  final Theme theme;
  final Locale locale;

  ColorScheme get colorScheme => HostBloc.toColorScheme(theme);

  HostState copyWith({
    Theme? theme,
    Locale? locale,
  }) {
    return HostState(
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object?> get props => [theme, locale];

  @override
  String toString() {
    return 'HostState(theme: $theme, locale: $locale)';
  }
}
