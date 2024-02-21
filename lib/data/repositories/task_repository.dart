import 'package:todo_with_firebase/data/model/task_model.dart';

abstract class TaskRepository {
  Future<void> addTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(String task);
}
