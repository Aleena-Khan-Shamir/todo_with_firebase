import 'dart:developer';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_with_firebase/components/custome_text.dart';
import 'package:todo_with_firebase/components/selected_time.dart';
import 'package:todo_with_firebase/pages/add_task/controller.dart';
import 'package:todo_with_firebase/pages/add_task/widgets/textformfiled.dart';
import 'package:todo_with_firebase/pages/onboarding/widget/animated_button_widget.dart';

import '../../utils/colors.dart';

class AddPage extends GetView<AddController> {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: Form(
        key: controller.key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Create new Tasks',
                  style: Theme.of(context).textTheme.headlineSmall),
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
                        initialDate: DateTime.now(),
                        onDateChange: (selectedDate) {
                          controller.selectedDate = selectedDate;
                          log('${controller.selectedDate}');
                        },
                        activeColor: AppColor.primaryColor,
                        dayProps: EasyDayProps(
                          height: size.height * 0.12,
                          todayHighlightStyle:
                              TodayHighlightStyle.withBackground,
                          todayHighlightColor:
                              AppColor.primaryColor.withOpacity(0.3),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const CustomTextWidget(title: 'Task Name'),
                      const SizedBox(height: 20),
                      MyTextformfield(controller: controller),
                      const SizedBox(height: 30),
                      const CustomTextWidget(title: 'Time'),
                      const SizedBox(height: 15),
                      SelectedTimeWidget(
                        text: controller.selectedTime.value!.format(context),
                        onTap: () => controller.selectTime(context),
                      ),
                      const SizedBox(height: 25),
                      const CustomTextWidget(title: 'Alarm'),
                      Obx(
                        () => Switch(
                            activeColor: Colors.white,
                            activeTrackColor: AppColor.primaryColor,
                            inactiveThumbColor: AppColor.primaryColor,
                            inactiveTrackColor:
                                AppColor.primaryColor.withOpacity(0.2),
                            splashRadius: 50.0,
                            value: controller.isAlarm.value,
                            onChanged: (value) => Get.defaultDialog(
                                  title: 'Are you want to recieve notification',
                                  titleStyle:
                                      TextStyle(color: AppColor.primaryColor),
                                  middleText: '',
                                  onCancel: () {
                                    controller.isAlarm.value = false;
                                  },
                                  onConfirm: () {
                                    controller.isAlarm.value = true;
                                    log(controller.isAlarm.value.toString());
                                    Get.back();
                                  },
                                )),
                      ),
                      Obx(() => Align(
                          alignment: Alignment.centerRight,
                          child: controller.isLoading.value
                              ? Lottie.asset('assets/loader.json',
                                  height: 50, width: 100, fit: BoxFit.cover)
                              : AnimatedButtonWidget(
                                  text: 'Save',
                                  buttonDelayDuration: 400.ms,
                                  buttonPlayDuration: 1000.ms,
                                  onTap: () {
                                    if (controller.key.currentState!
                                        .validate()) {
                                      controller.addTasks(context);
                                    }
                                  })))
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
