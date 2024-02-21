import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String? id;
  final String taskTitle;
  final DateTime date;
  final String time;
  final bool isAlarm;

  TaskModel({
    this.id,
    required this.taskTitle,
    required this.date,
    required this.time,
    required this.isAlarm,
  });
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    DateTime dateTime = (json['date'] as Timestamp).toDate();

    return TaskModel(
      id: json['id'],
      taskTitle: json['taskName'],
      date: dateTime,
      time: json['time'],
      isAlarm: json['isAlarm'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskName': taskTitle,
      'date': date,
      'time': time,
      'isAlarm': isAlarm,
    };
  }
}
