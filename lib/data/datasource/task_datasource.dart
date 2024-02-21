import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_with_firebase/data/model/task_model.dart';
import 'package:todo_with_firebase/service/deviceInfo/device_info.dart';

class TaskFirebaseDataeSource {
  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

  final DeviceInfo deviceInfo = DeviceInfo();
  Future<void> addTasks(TaskModel task) async {
    String docId = tasks.doc().id;
    String deviceId = await deviceInfo.getDeviceId();
    await tasks
        .doc(docId)
        .set({
          'id': docId,
          'deviceID': deviceId,
          'taskName': task.taskTitle,
          'time': task.time,
          'date': task.date,
          'isAlarm': task.isAlarm
        })
        .then((value) => log('Task added'))
        .catchError((error) => log('Failed to add task $error'));
  }

  Future<void> deleteTask(String task) {
    return tasks
        .doc(task)
        .delete()
        .then((value) => log("User Deleted"))
        .catchError((error) => log("Failed to delete user: $error"));
  }

  Future<void> updateTask(TaskModel task) async {
    await tasks
        .doc(task.id)
        .update({
          'id': task.id,
          'taskName': task.taskTitle,
          'date': task.date,
          'time': task.time,
          'isAlarm': task.isAlarm
        })
        .then((value) => log("task updated ${task.taskTitle} ${task.date}"))
        .catchError((error) => log("Failed to update task: $error"));
  }
}
