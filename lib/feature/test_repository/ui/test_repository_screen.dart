import 'package:flutter/material.dart';
import 'package:flutter_todo_list/dataprovider/todo_list_repository.dart';
import 'package:flutter_todo_list/dataprovider/todo_task_repository.dart';
import 'package:flutter_todo_list/entity/todo_status.dart';
import 'package:flutter_todo_list/entity/todo_task.dart';
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
              ),
              FilledButton(
                onPressed: () async {
                  await toDoListRepository.deleteToDoList("1");
                },
                child: const Text('Delete todo list by id'),
              ),
              FilledButton(
                onPressed: () async {
                  await toDoTaskRepository.insertToDoTasks([
                    ToDoTask(
                        id: "1",
                        name: "task 1",
                        status: ToDoStatus.inProgress,
                        completedAt: DateTime.now(),
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now()),
                    ToDoTask(
                        id: "2",
                        name: "task 2",
                        status: ToDoStatus.inProgress,
                        completedAt: DateTime.now(),
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now()),
                    ToDoTask(
                        id: "3",
                        name: "task 3",
                        status: ToDoStatus.inProgress,
                        completedAt: DateTime.now(),
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now()),
                    ToDoTask(
                        id: "4",
                        name: "task 4",
                        status: ToDoStatus.inProgress,
                        completedAt: DateTime.now(),
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now())
                  ], "1");
                },
                child: const Text('Create todo task'),
              ),
              FilledButton(
                onPressed: () async {
                  await toDoTaskRepository.updateToDoTaskStatus(
                      ToDoTask(
                          id: "1",
                          name: "task 1 new",
                          status: ToDoStatus.complete,
                          completedAt: DateTime.now(),
                          createdAt: DateTime.now(),
                          updatedAt: DateTime.now()),
                      "1");
                },
                child: const Text('Update todo task'),
              ),
              FilledButton(
                onPressed: () async {
                  await toDoTaskRepository.deleteToDoTask("1");
                },
                child: const Text('Delete todo task'),
              )
            ],
          ),
        ));
  }
}
