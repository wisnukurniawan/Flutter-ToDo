import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_list/experiment/test_cart_bloc/add_to_cart/bloc/add_to_cart_event.dart';
import 'package:flutter_todo_list/experiment/test_cart_bloc/add_to_cart/bloc/add_to_cart_state.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  AddToCartBloc() : super(const AddToCartState()) {
    on<ClickPlus>(_onClickPlus);
    on<ClickMinus>(_onClickMinus);
  }

  void _onClickPlus(ClickPlus event, Emitter<AddToCartState> emit) {
    emit(state.copyWith(count: state.count + 1));
  }

  void _onClickMinus(ClickMinus event, Emitter<AddToCartState> emit) {
    emit(state.copyWith(count: state.count - 1));
  }
}
