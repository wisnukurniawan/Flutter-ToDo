import 'package:flutter/material.dart';
import 'package:flutter_todo_list/dataprovider/local/todo_database.dart';
import 'package:flutter_todo_list/dataprovider/local/todo_list_provider.dart';
import 'package:flutter_todo_list/dataprovider/local/todo_task_provider.dart';
import 'package:flutter_todo_list/dataprovider/todo_list_repository.dart';
import 'package:flutter_todo_list/dataprovider/todo_task_repository.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
      ),
      home: const TestRepositoryScreen(),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
