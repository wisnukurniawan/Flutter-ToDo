import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_todo_list/data_provider/theme_repository.dart';
import 'package:flutter_todo_list/feature/host/bloc/host_logic.dart';

import 'host_event.dart';
import 'host_state.dart';

class HostBloc extends Bloc<HostEvent, HostState> {
  HostBloc({
    required ThemeRepository themeRepository,
  }) : _themeRepository = themeRepository, super(const HostState()) {
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
    emit(state.copyWith(colorScheme: toColorScheme(event.theme)));
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
