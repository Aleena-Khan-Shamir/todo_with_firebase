import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_with_firebase/config/routes/app_routes.dart';
import 'package:todo_with_firebase/data/model/task_model.dart';
import 'package:todo_with_firebase/pages/home/controller.dart';

import '../../../utils/colors.dart';

class TaskCard extends StatelessWidget {
  final Duration listPlayDuration;
  final Duration listDelayDuration;
  final TaskModel task;
  TaskCard(
      {super.key,
      required this.listPlayDuration,
      required this.listDelayDuration,
      required this.task});

  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Slidable(
              key: ValueKey(task.id),
              startActionPane:
                  ActionPane(motion: const DrawerMotion(), children: [
                SlidableAction(
                    onPressed: (context) {
                      Get.toNamed(Routes.editTask, arguments: {
                        'id': task.id,
                        'taskName': task.taskTitle,
                        'date': task.date,
                        'time': task.time,
                        'isAlarm': task.isAlarm
                      });
                    },
                    icon: Icons.edit,
                    backgroundColor: AppColor.primaryColor),
              ]),
              endActionPane:
                  ActionPane(motion: const DrawerMotion(), children: [
                SlidableAction(
                    onPressed: (context) {
                      controller.deleteTask(task.id!);
                      Get.snackbar('Delted task',
                          '${task.taskTitle} task has been deleted',
                          snackPosition: SnackPosition.BOTTOM);
                    },
                    icon: Icons.delete,
                    backgroundColor: Colors.red),
              ]),
              child: Card(
                elevation: 4,
                child: ListTile(
                  leading: Icon(Icons.circle,
                      size: 20, color: AppColor.primaryColor),
                  title: Text(task.taskTitle.toUpperCase()),
                  subtitle: Text(DateFormat('MMM d, yyyy').format(task.date)),
                  trailing: Text(task.time,
                      style: TextStyle(color: AppColor.primaryColor)),
                ),
              )),
        ).animate(delay: listDelayDuration).slideX(
            duration: listPlayDuration,
            begin: 3,
            end: 0,
            curve: Curves.easeInOutSine));
  }
}
