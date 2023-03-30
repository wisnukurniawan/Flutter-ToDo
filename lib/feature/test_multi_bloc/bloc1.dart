import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class Bloc1 extends Bloc<Event1, State1> {
  Bloc1() : super(const State1()) {
    on<Changes>(_onChanges);
  }

  void _onChanges(Changes event, Emitter<State1> emit) {
    emit(state.copyWith(text: event.text));
  }
}
