import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:todo_with_firebase/config/config.dart';

class OnBoardingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController animationController;
  void nextScreen() {
    animationController.forward();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(400.ms, () {
          Get.offAllNamed(Routes.home);
        });
      }
    });
  }

  @override
  void onInit() {
    animationController = AnimationController(vsync: this);
    super.onInit();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
