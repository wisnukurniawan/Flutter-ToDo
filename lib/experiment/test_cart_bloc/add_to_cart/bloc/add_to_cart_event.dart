import 'package:equatable/equatable.dart';

abstract class AddToCartEvent extends Equatable {
  const AddToCartEvent();

  @override
  List<Object> get props => [];
}

class ClickPlus extends AddToCartEvent {
  const ClickPlus();
}

class ClickMinus extends AddToCartEvent {
  const ClickMinus();
}
