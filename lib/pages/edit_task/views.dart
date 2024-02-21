import 'dart:developer';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_with_firebase/components/custome_text.dart';
import 'package:todo_with_firebase/components/selected_time.dart';
import 'package:todo_with_firebase/pages/edit_task/controller.dart';
import 'package:todo_with_firebase/pages/onboarding/widget/animated_button_widget.dart';

import '../../utils/colors.dart';

class EditPage extends GetView<EditController> {
  const EditPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Edit Tasks',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          SizedBox(height: size.height * 0.04),
          Expanded(
              child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EasyDateTimeLine(
                      initialDate: controller.taskDate,
                      onDateChange: (selectedDate) {
                        controller.taskDate = selectedDate;
                        log('${controller.taskDate}');
                      },
                      activeColor: AppColor.primaryColor,
                      dayProps: EasyDayProps(
                        height: size.height * 0.12,
                        todayHighlightStyle: TodayHighlightStyle.withBackground,
                        todayHighlightColor:
                            AppColor.primaryColor.withOpacity(0.3),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const CustomTextWidget(title: 'Edit Task Name'),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: controller.taskController,
                        onChanged: (value) {
                          if (controller.taskController.text.isNotEmpty) {
                            controller.taskController.text = value;
                          }
                        },
                        decoration: const InputDecoration(
                            filled: true,
                            hintText: 'Enter edit task',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)))),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const CustomTextWidget(title: 'Edit Time'),
                    const SizedBox(height: 15),
                    SelectedTimeWidget(
                        onTap: () => controller.editTime(context),
                        text: controller.taskTime.value),
                    const SizedBox(height: 30),
                    const CustomTextWidget(title: 'Edit Alarm'),
                    const SizedBox(height: 10),
                    Obx(
                      () => Switch(
                        activeColor: Colors.white,
                        activeTrackColor: AppColor.primaryColor,
                        inactiveThumbColor: AppColor.primaryColor,
                        inactiveTrackColor:
                            AppColor.primaryColor.withOpacity(0.2),
                        splashRadius: 50.0,
                        value: controller.isAlarm.value,
                        onChanged: (value) {
                          Get.defaultDialog(
                            title: 'Are you want to edit recieve notification',
                            titleStyle: TextStyle(color: AppColor.primaryColor),
                            middleText: '',
                            onCancel: () {
                              controller.isAlarm.value = false;
                            },
                            onConfirm: () {
                              controller.isAlarm.value = true;
                              log(controller.isAlarm.value.toString());
                              Get.back();
                            },
                          );
                        },
                      ),
                    ),
                    Obx(() => Align(
                          alignment: Alignment.centerRight,
                          child: controller.isLoading.value
                              ? Lottie.asset('assets/loader.json',
                                  height: 50, width: 100, fit: BoxFit.cover)
                              : AnimatedButtonWidget(
                                  text: 'Edit',
                                  buttonDelayDuration: 400.ms,
                                  buttonPlayDuration: 1000.ms,
                                  onTap: () {
                                    if (controller.taskController.text
                                        .trim()
                                        .isNotEmpty) {
                                      controller.updateTasks(context);
                                    } else {
                                      Get.snackbar(
                                          'Task is empty', 'Enter some text',
                                          snackPosition: SnackPosition.BOTTOM);
                                    }
                                  }),
                        ))
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
