import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'todo_status.dart';

@immutable
class ToDoTask {
  final String id;
  final String name;
  final ToDoStatus status;
  final DateTime? completedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ToDoTask(
      {required this.id,
      required this.name,
      this.status = ToDoStatus.inProgress,
      this.completedAt,
      required this.createdAt,
      required this.updatedAt});

  ToDoTask copyWith({
    String? id,
    String? name,
    ToDoStatus? status,
    DateTime? completedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ToDoTask(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      completedAt: completedAt ?? this.completedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'ToDoTask{id: $id, name: $name, status: $status, completedAt: ${completedAt != null ? DateFormat('yyyy-MM-dd HH:mm:ss').format(completedAt!) : null}, createdAt: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(createdAt)}, updatedAt: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(updatedAt)}}';
  }
}
