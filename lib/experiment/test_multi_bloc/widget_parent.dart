import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_list/experiment/test_multi_bloc/state.dart';
import 'package:flutter_todo_list/experiment/test_multi_bloc/widget1.dart';

import 'bloc1.dart';
import 'bloc2.dart';
import 'bloc3.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<Bloc1>(
          create: (BuildContext context) => Bloc1(),
        ),
        BlocProvider<Bloc2>(
          create: (BuildContext context) => Bloc2(),
        ),
        BlocProvider<Bloc3>(
          create: (BuildContext context) => Bloc3(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<Bloc1, State1>(
            listener: (context, state) {
              print("main bloc1 ${state.text}");
            },
          ),
          BlocListener<Bloc2, State1>(
            listener: (context, state) {
              print("main bloc2 ${state.text}");
            },
          ),
          BlocListener<Bloc3, State1>(
            listener: (context, state) {
              print("main bloc3 ${state.text}");
            },
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: Center(child: Widget1()),
          ),
        ),
      ),
    ),
  );
}
