import 'package:flutter/material.dart';
import 'package:flutter_todo_list/dataprovider/todo_list_repository.dart';
import 'package:flutter_todo_list/dataprovider/todo_task_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../../../entity/todo_list.dart';

class TestRepositoryScreen extends StatelessWidget {
  const TestRepositoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final toDoListRepository = GetIt.instance.get<ToDoListRepository>();
    final toDoTaskRepository = GetIt.instance.get<ToDoTaskRepository>();
    final logger = Logger(
      printer: PrettyPrinter(),
    );
    return Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              FilledButton(
                onPressed: () async {
                  await toDoListRepository.insertToDoLists([
                    ToDoList(
                        id: "1",
                        name: "List 1",
                        tasks: const [],
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now()),
                    ToDoList(
                        id: "2",
                        name: "List 2",
                        tasks: const [],
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now())
                  ]);
                },
                child: const Text('Insert todo list'),
              ),
              FilledButton(
                onPressed: () async {
                  await toDoListRepository.updateToDoListName(ToDoList(
                      id: "1",
                      name: "List 1 new",
                      tasks: const [],
                      createdAt: DateTime.now(),
                      updatedAt: DateTime.now()));
                },
                child: const Text('Update todo list name'),
              ),
              FilledButton(
                onPressed: () async {
                  final data = await toDoListRepository.getAllToDoLists();
                  for (var element in data) {
                    logger.d("all todo list $element");
                  }
                },
                child: const Text('Get all todo list'),
              ),
              FilledButton(
                onPressed: () async {
                  final data = await toDoListRepository.getToDoList("1");
                  logger.d("todo list by id 1 $data");
                },
                child: const Text('Get todo list by id'),
              )
            ],
          ),
        ));
  }
}
