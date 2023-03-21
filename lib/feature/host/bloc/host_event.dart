import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_todo_list/entity/theme.dart';

abstract class HostEvent extends Equatable {
  const HostEvent();

  @override
  List<Object> get props => [];
}

class ScreenShown extends HostEvent {
  const ScreenShown();
}

class ThemeLoaded extends HostEvent {
  const ThemeLoaded({required this.theme});

  final Theme theme;
}

class LocaleLoaded extends HostEvent {
  const LocaleLoaded({required this.locale});

  final Locale locale;
}
