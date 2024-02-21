import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_with_firebase/service/notiifcation/firebase_notification.dart';
import '../../data/data.dart';

class EditController extends GetxController {
// Alarm swutch
  RxBool isAlarm = false.obs;

//  #######################################################
// update task
  RxBool isLoading = false.obs;

  final TextEditingController taskController = TextEditingController();
  // late String taskName;
  late DateTime taskDate;

  late String taskId;
  TaskRepository taskRepository = TaskRepositoryImp(TaskFirebaseDataeSource());
  late RxString taskTime = RxString('');

  // late Rx<TimeOfDay?> taskTime = Rx<TimeOfDay?>(null);
  @override
  void onInit() {
    final arguments = Get.arguments;

    if (arguments != null) {
      taskId = arguments['id'];
      taskController.text = arguments['taskName'];
      taskDate = arguments['date'];
      taskTime.value = arguments['time'];
      isAlarm.value = arguments['isAlarm'];
    }
    super.onInit();
  }

//  #######################################################
// Select the time

  Future<void> editTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      // taskTime.value = picked.format(context);
      final pickedTime = DateTime(
        taskDate.year,
        taskDate.month,
        taskDate.day,
        picked.hour,
        picked.minute,
      );
      taskTime.value = DateFormat("h:mm a").format(pickedTime);
      log('${picked.hour}:${picked.minute}');
    }
  }

//  #######################################################
// update the task
  Future<void> updateTasks(BuildContext context) async {
    DateTime time = DateFormat("h:mm a").parse(taskTime.value);
    log('Parsed Time: $time');
    final editTime = DateTime(
      taskDate.year,
      taskDate.month,
      taskDate.day,
      time.hour,
      time.minute,
    );
    final task = TaskModel(
      id: taskId,
      taskTitle: taskController.text,
      date: taskDate,
      time: taskTime.value,
      isAlarm: isAlarm.value,
    );
    isLoading.value = true;
    await taskRepository.updateTask(task);
    isLoading.value = false;
    if (isAlarm.value) {
      final time = DateFormat("h:mm a").parse(taskTime.value);
      NotificationServices().scheduleNotification(
        title: taskController.text,
        body: taskTime.value,
        selectedTime: editTime,
      );
      log('${time.hour} : ${time.minute}');
    }
    Get.back();
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }
}
