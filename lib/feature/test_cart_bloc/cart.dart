import 'package:flutter/foundation.dart';

@immutable
class Cart {
  final String name;
  final double price;
  final int quantity;

  const Cart({
    required this.name,
    required this.price,
    required this.quantity,
  });

  Cart copyWith({
    String? name,
    double? price,
    int? quantity,
  }) {
    return Cart(
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  String toString() {
    return 'Cart(name: $name, price: $price, quantity: $quantity)';
  }
}
