import 'dart:developer';
import 'package:todo_with_firebase/data/datasource/task_datasource.dart';
import 'package:todo_with_firebase/data/model/task_model.dart';
import 'package:todo_with_firebase/data/repositories/task_repository.dart';

class TaskRepositoryImp implements TaskRepository {
  final TaskFirebaseDataeSource _taskFirebaseDataeSource;
  TaskRepositoryImp(this._taskFirebaseDataeSource);

  @override
  Future<void> addTask(TaskModel task) async {
    try {
      await _taskFirebaseDataeSource.addTasks(task);
    } catch (error) {
      log('Error $error');
    }
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    try {
      await _taskFirebaseDataeSource.updateTask(task);
    } catch (error) {
      log('Error $error');
    }
  }

  @override
  Future<void> deleteTask(String task) async {
    try {
      await _taskFirebaseDataeSource.deleteTask(task);
    } catch (error) {
      log('Error $error');
    }
  }
}
