import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_list/feature/host/bloc/host_bloc.dart';
import 'package:flutter_todo_list/feature/host/bloc/host_event.dart';
import 'package:flutter_todo_list/feature/host/bloc/host_state.dart';
import 'package:flutter_todo_list/runtime/navigation/main_router.dart';

import '../../../foundation/theme/text.dart';
import '../../test_repository/ui/test_repository_screen.dart';

class HostScreen extends StatelessWidget {
  const HostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HostBloc()..add(const LoadTheme()),
      child: const Theme(),
    );
  }
}

class Theme extends StatelessWidget {
  const Theme({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HostBloc, HostState>(
      builder: (context, state) {
        return MaterialApp.router(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: state.colorScheme,
            textTheme: textTheme,
          ),
          routerConfig: mainRouter,
        );
      },
    );
  }
}

