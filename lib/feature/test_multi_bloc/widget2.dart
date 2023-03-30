import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_list/feature/test_multi_bloc/state.dart';
import 'package:flutter_todo_list/feature/test_multi_bloc/widget3.dart';

import 'bloc1.dart';
import 'bloc2.dart';
import 'bloc3.dart';
import 'event.dart';

class Widget2 extends StatelessWidget {
  const Widget2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Bloc2, State1>(builder: (context, state) {
      print("Widget2 bloc ${state.text}");

      return MultiBlocListener(
        listeners: [
          BlocListener<Bloc1, State1>(
            listener: (context, state) {
              print("Widget2 bloc1 ${state.text}");
            },
          ),
          BlocListener<Bloc2, State1>(
            listener: (context, state) {
              print("Widget2 bloc2 ${state.text}");
            },
          ),
          BlocListener<Bloc3, State1>(
            listener: (context, state) {
              print("Widget2 bloc3 ${state.text}");
            },
          ),
        ],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Widget2',
                ),
                onChanged: (value) =>
                    BlocProvider.of<Bloc2>(context).add(Changes(value)),
              ),
            ),
            const Widget3()
          ],
        ),
      );
    });
  }
}
