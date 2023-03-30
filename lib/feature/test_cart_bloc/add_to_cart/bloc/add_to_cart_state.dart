import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class AddToCartState extends Equatable {
  const AddToCartState({
    this.count = 0,
  });

  final int count;

  AddToCartState copyWith({
    int? count,
  }) {
    return AddToCartState(
      count: count ?? this.count,
    );
  }

  @override
  List<Object?> get props => [count];

  @override
  String toString() {
    return 'AddToCartState(count: $count)';
  }
}
