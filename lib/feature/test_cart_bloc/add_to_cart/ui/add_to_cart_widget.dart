import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_list/feature/test_cart_bloc/add_to_cart/bloc/add_to_cart_bloc.dart';
import 'package:flutter_todo_list/feature/test_cart_bloc/add_to_cart/bloc/add_to_cart_event.dart';
import 'package:flutter_todo_list/feature/test_cart_bloc/add_to_cart/bloc/add_to_cart_state.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => AddToCartBloc(),
      child: const MaterialApp(
        home: Scaffold(
          body: Center(
            child: PlusMinusButton(),
          ),
        ),
      ),
    ),
  );
}

class PlusMinusButton extends StatelessWidget {
  const PlusMinusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddToCartBloc, AddToCartState>(
      builder: (context, state) {
        return Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                BlocProvider.of<AddToCartBloc>(context).add(const ClickMinus());
              },
            ),
            Text('${state.count}'),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                BlocProvider.of<AddToCartBloc>(context).add(const ClickPlus());
              },
            ),
          ],
        );
      },
    );
  }
}
