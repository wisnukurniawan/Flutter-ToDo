import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_todo_list/data_provider/locale_repository.dart';
import 'package:flutter_todo_list/data_provider/theme_repository.dart';
import 'package:flutter/material.dart' hide Theme;
import '../../../entity/theme.dart';
import '../../../foundation/theme/color.dart';

import 'host_event.dart';
import 'host_state.dart';

class HostBloc extends Bloc<HostEvent, HostState> {
  HostBloc({
    required ThemeRepository themeRepository,
    required LocaleRepository localeRepository,
  })  : _themeRepository = themeRepository,
        _localeRepository = localeRepository,
        super(const HostState()) {
    on<ScreenShown>(_onScreenShown);
    on<ThemeLoaded>(_onThemeLoaded);
    on<LocaleLoaded>(_onLocaleLoaded);
  }

  late final StreamSubscription _themeSubscription;
  late final StreamSubscription _localeSubscription;

  final ThemeRepository _themeRepository;
  final LocaleRepository _localeRepository;

  void _onScreenShown(HostEvent event, Emitter<HostState> emit) {
    _themeSubscription = _themeRepository.getTheme().listen((theme) {
      add(ThemeLoaded(theme: theme));
    });

    _localeSubscription = _localeRepository.getLocale().listen((locale) {
      add(LocaleLoaded(locale: locale));
    });
  }

  void _onThemeLoaded(ThemeLoaded event, Emitter<HostState> emit) {
    emit(state.copyWith(theme: event.theme));
  }

  void _onLocaleLoaded(LocaleLoaded event, Emitter<HostState> emit) {
    emit(state.copyWith(locale: event.locale));
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
    _themeSubscription.cancel();
    _localeSubscription.cancel();
    return super.close();
  }

  @override
  void onChange(Change<HostState> change) {
    super.onChange(change);
    debugPrint("Hostbloc-onChange: $change");
  }
}
