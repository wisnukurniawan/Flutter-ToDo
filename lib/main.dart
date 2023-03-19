import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo_list/dataprovider/local/todo_database.dart';
import 'package:flutter_todo_list/dataprovider/local/todo_list_provider.dart';
import 'package:flutter_todo_list/dataprovider/local/todo_task_provider.dart';
import 'package:flutter_todo_list/dataprovider/theme_repository.dart';
import 'package:flutter_todo_list/dataprovider/todo_list_repository.dart';
import 'package:flutter_todo_list/dataprovider/todo_task_repository.dart';
import 'package:flutter_todo_list/feature/host/bloc/host_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import 'dataprovider/preference/ThemeProvider.dart';
import 'feature/host/ui/host_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  initSystemBar();

  runApp(const HostScreen());
}

Future<void> initLocator() async {
  final getIt = GetIt.instance;

  // Init DB
  getIt.registerLazySingletonAsync<Database>(
    () async => ToDoDatabase.db.openDb(),
  );

  // Init preferences
  getIt.registerLazySingletonAsync<StreamingSharedPreferences>(
    () async => StreamingSharedPreferences.instance,
  );

  // Init data provider
  getIt.registerLazySingletonAsync<ToDoListProvider>(
    () async => ToDoListProvider(await getIt.getAsync()),
  );
  getIt.registerLazySingletonAsync<ToDoTaskProvider>(
    () async => ToDoTaskProvider(await getIt.getAsync()),
  );
  getIt.registerLazySingletonAsync<ThemeProvider>(
    () async => ThemeProvider(await getIt.getAsync()),
  );

  // Init repository
  getIt.registerLazySingletonAsync<ToDoListRepository>(
    () async => ToDoListRepository(await getIt.getAsync()),
  );
  getIt.registerLazySingletonAsync<ToDoTaskRepository>(
    () async => ToDoTaskRepository(await getIt.getAsync()),
  );
  getIt.registerLazySingletonAsync<ThemeRepository>(
    () async => ThemeRepository(await getIt.getAsync()),
  );

  // Init bloc
  getIt.registerFactoryAsync(
    () async => HostBloc(themeRepository: await getIt.getAsync()),
  );
}

void initSystemBar() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
  ));
}
