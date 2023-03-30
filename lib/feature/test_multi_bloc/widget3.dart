import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_list/feature/test_multi_bloc/state.dart';

import 'bloc1.dart';
import 'bloc2.dart';
import 'bloc3.dart';
import 'event.dart';

class Widget3 extends StatelessWidget {
  const Widget3({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Bloc3, State1>(builder: (context, state) {
      print("Widget3 bloc ${state.text}");
      return MultiBlocListener(
        listeners: [
          BlocListener<Bloc1, State1>(
            listener: (context, state) {
              print("Widget3 bloc1 ${state.text}");
            },
          ),
          BlocListener<Bloc2, State1>(
            listener: (context, state) {
              print("Widget3 bloc2 ${state.text}");
            },
          ),
          BlocListener<Bloc3, State1>(
            listener: (context, state) {
              print("Widget3 bloc3 ${state.text}");
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
                  hintText: 'Widget3',
                ),
                onChanged: (value) =>
                    BlocProvider.of<Bloc3>(context).add(Changes(value)),
              ),
            )
          ],
        ),
      );
    });
  }
}
