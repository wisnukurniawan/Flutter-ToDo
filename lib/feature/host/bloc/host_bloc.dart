import 'package:bloc/bloc.dart';
import 'package:flutter_todo_list/entity/theme.dart';
import 'package:flutter_todo_list/feature/host/bloc/host_logic.dart';

import 'host_event.dart';
import 'host_state.dart';

class HostBloc extends Bloc<HostEvent, HostState> {
  HostBloc() : super(const HostState()) {
    on<LoadTheme>(_onLoadTheme);
  }

  void _onLoadTheme(HostEvent event, Emitter<HostState> emit) {
    // TODO get current theme from local
    // Emit that
    emit(state.copyWith(colorScheme: toColorScheme(Theme.light)));
  }
}
