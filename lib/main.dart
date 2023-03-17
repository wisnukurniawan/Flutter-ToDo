import 'package:flutter/material.dart';
import 'package:flutter_todo_list/dataprovider/local/todo_database.dart';
import 'package:flutter_todo_list/dataprovider/local/todo_list_provider.dart';
import 'package:flutter_todo_list/dataprovider/local/todo_task_provider.dart';
import 'package:flutter_todo_list/dataprovider/todo_list_repository.dart';
import 'package:flutter_todo_list/dataprovider/todo_task_repository.dart';
import 'package:flutter_todo_list/foundation/theme/color.dart';
import 'package:flutter_todo_list/foundation/theme/text.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import 'feature/test_repository/ui/test_repository_screen.dart';

void main() {
  final getIt = GetIt.instance;

  getIt.registerSingletonAsync<Database>(() async {
    return ToDoDatabase.db.openDb();
  });
  getIt.registerLazySingleton<ToDoListProvider>(
    () => ToDoListProvider(getIt<Database>()),
  );
  getIt.registerLazySingleton<ToDoTaskProvider>(
    () => ToDoTaskProvider(getIt<Database>()),
  );
  getIt.registerLazySingleton<ToDoListRepository>(
    () => ToDoListRepository(getIt<ToDoListProvider>()),
  );
  getIt.registerLazySingleton<ToDoTaskRepository>(
    () => ToDoTaskRepository(getIt<ToDoTaskProvider>()),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        return FutureBuilder(
            future: GetIt.instance.allReady(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return const MyHomePage(
                title: "ToDo",
              );
            });
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorPalette,
        textTheme: textTheme,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: TestRepositoryScreen(),
      ),
    );
  }
}
