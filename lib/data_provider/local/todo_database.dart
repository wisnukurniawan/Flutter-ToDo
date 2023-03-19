import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'todo_database.g.dart';

@DriftDatabase(
  include: {'todo_database_query.drift'},
)
class ToDoDatabase extends _$ToDoDatabase {
  ToDoDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'todo_db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
