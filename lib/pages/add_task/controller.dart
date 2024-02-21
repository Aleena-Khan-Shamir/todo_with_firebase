import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todo_with_firebase/service/notiifcation/firebase_notification.dart';

import '../../data/data.dart';
import '../../service/deviceInfo/device_info.dart';

class AddController extends GetxController {
  final TextEditingController taskName = TextEditingController();
  final key = GlobalKey<FormState>();
  TaskRepository taskRepository = TaskRepositoryImp(TaskFirebaseDataeSource());

//  #######################################################
// Alarm swutch
  RxBool isAlarm = false.obs;
//  #######################################################
// Select the time
  Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(TimeOfDay.now());
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      selectedTime.value = picked;
      log('${picked.hour}:${picked.minute}');
    }
  }

//  #######################################################
// notiifcation
  NotificationServices notificationServices = NotificationServices();

//  #######################################################
  // Device info
  final DeviceInfo deviceInfo = DeviceInfo();
  String deviceID = 'Loading';
  Future<String> getId() async {
    deviceID = await deviceInfo.getDeviceId();
    update();
    return deviceID;
  }

//  #######################################################
// Add task
  DateTime selectedDate = DateTime.now();
  RxBool isLoading = false.obs;

  Future<void> addTasks(BuildContext context) async {
    final time = selectedTime.value ?? TimeOfDay.now();
    // Convert TimeOfDay to DateTime
    final selectedDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      time.hour,
      time.minute,
    );
    TaskModel task = TaskModel(
      taskTitle: taskName.text,
      date: selectedDate,
      time: time.format(context),
      isAlarm: isAlarm.value,
    );

    isLoading.value = true;
    await taskRepository.addTask(task);
    isLoading.value = false;
    Get.back();
    if (isAlarm.value) {
      NotificationServices().scheduleNotification(
        title: taskName.text,
        body: selectedTime.value!.format(context),
        selectedTime: selectedDateTime,
      );
    }
  }

  @override
  void dispose() {
    taskName.dispose();
    super.dispose();
  }
}
