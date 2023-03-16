
import 'package:sqflite/sqflite.dart';

class ToDoProvider {

  final Database database;

  const ToDoProvider(this.database);

  Future<List<Map<String, Object?>>> rawQuery(String query, [List<Object?>? arguments]) async {
    return database.rawQuery(query, arguments);
  }
}
