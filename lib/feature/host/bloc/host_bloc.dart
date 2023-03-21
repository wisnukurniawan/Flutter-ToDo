import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_todo_list/data_provider/theme_repository.dart';
import 'package:flutter/material.dart' hide Theme;
import '../../../entity/theme.dart';
import '../../../foundation/theme/color.dart';

import 'host_event.dart';
import 'host_state.dart';

class HostBloc extends Bloc<HostEvent, HostState> {
  HostBloc({
    required ThemeRepository themeRepository,
  })  : _themeRepository = themeRepository,
        super(const HostState()) {
    on<LoadTheme>(_onLoadTheme);
    on<ThemeLoaded>(_onThemeLoaded);
  }

  late final StreamSubscription _subscription;
  final ThemeRepository _themeRepository;

  void _onLoadTheme(HostEvent event, Emitter<HostState> emit) {
    _subscription = _themeRepository.getTheme().listen((theme) {
      add(ThemeLoaded(theme: theme));
    });
  }

  void _onThemeLoaded(ThemeLoaded event, Emitter<HostState> emit) {
    emit(state.copyWith(theme: event.theme));
  }

  static ColorScheme toColorScheme(Theme theme) {
    switch (theme) {
      case Theme.light:
        return lightColorPalette;
      case Theme.twilight:
        return twilightColorPalette;
      case Theme.night:
        return nightColorPalette;
      case Theme.sunrise:
        return sunriseColorPalette;
      case Theme.aurora:
        return auroraColorPalette;
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
