import 'package:flutter_todo_list/data_provider/repository/locale_repository.dart';
import 'package:flutter_todo_list/data_provider/preference/locale_provider.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_todo_list/data_provider/local/todo_database.dart';
import 'package:flutter_todo_list/data_provider/local/todo_list_provider.dart';
import 'package:flutter_todo_list/data_provider/local/todo_task_provider.dart';
import 'package:flutter_todo_list/data_provider/repository/theme_repository.dart';
import 'package:flutter_todo_list/data_provider/repository/todo_list_repository.dart';
import 'package:flutter_todo_list/data_provider/repository/todo_task_repository.dart';
import 'package:flutter_todo_list/feature/host/bloc/host_bloc.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../../data_provider/preference/theme_provider.dart';

final getIt = GetIt.instance;

Future initLocator() async {
  _initDb();
  _initPreferences();
  _initDataProvider();
  _initRepository();
  _initBloc();
}

void _initDb() {
  getIt.registerLazySingleton<ToDoDatabase>(
    () => ToDoDatabase(),
  );
}

void _initPreferences() {
  getIt.registerLazySingletonAsync<StreamingSharedPreferences>(
    () async => StreamingSharedPreferences.instance,
  );
}

void _initDataProvider() {
  getIt.registerLazySingleton<ToDoListProvider>(
    () => ToDoListProvider(getIt.get()),
  );
  getIt.registerLazySingleton<ToDoTaskProvider>(
    () => ToDoTaskProvider(getIt.get()),
  );
  getIt.registerLazySingletonAsync<ThemeProvider>(
    () async => ThemeProvider(await getIt.getAsync()),
  );
  getIt.registerLazySingletonAsync<LocaleProvider>(
    () async => LocaleProvider(await getIt.getAsync()),
  );
}

// no need to put it in get it
// make repository as interface
void _initRepository() {
  getIt.registerLazySingleton<ToDoListRepository>(
    () => ToDoListRepository(getIt.get()),
  );
  getIt.registerLazySingleton<ToDoTaskRepository>(
    () => ToDoTaskRepository(getIt.get()),
  );
  getIt.registerLazySingletonAsync<ThemeRepository>(
    () async => ThemeRepository(await getIt.getAsync()),
  );
  getIt.registerLazySingletonAsync<LocaleRepository>(
    () async => LocaleRepository(await getIt.getAsync()),
  );
}

// no need to put it in get it
void _initBloc() {
  getIt.registerFactoryAsync(
    () async => HostBloc(
      themeRepository: await getIt.getAsync(),
      localeRepository: await getIt.getAsync(),
    ),
  );
}
