import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:todo_with_firebase/pages/onboarding/controller.dart';
import 'package:todo_with_firebase/pages/onboarding/widget/animated_button_widget.dart';
import 'package:todo_with_firebase/pages/onboarding/widget/animated_title_widget.dart';

class OnBoardingPage extends GetView<OnBoardingController> {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mainPlayDuration = 1000.ms;
    final titleDelayDuration = mainPlayDuration + 50.ms;
    final descriptionDelayDuration = titleDelayDuration + 300.ms;
    final buttonDelayDuration = descriptionDelayDuration + 100.ms;
    final buttonPlayDuration = mainPlayDuration - 200.ms;
    return Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(builder: (_, BoxConstraints constraints) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Lottie.asset('assets/todo.json'),
                SizedBox(height: constraints.maxHeight * 0.2),
                AnimatedTitleWidget(
                    titleDelayDuration: titleDelayDuration,
                    mainPlayDuration: mainPlayDuration),
                SizedBox(height: constraints.maxHeight * 0.05),
                AnimatedButtonWidget(
                    text: 'Get Started',
                    height: constraints.maxHeight * 0.065,
                    width: double.infinity,
                    buttonDelayDuration: buttonDelayDuration,
                    buttonPlayDuration: buttonPlayDuration,
                    onTap: () => controller.nextScreen()),
              ],
            )
                .animate(
                    autoPlay: false, controller: controller.animationController)
                .blurXY(
                    begin: 0,
                    end: 25,
                    duration: 600.ms,
                    curve: Curves.easeInOut)
                .scaleXY(begin: 1, end: 0.6)
                .fadeOut(begin: 1),
          );
        }));
  }
}
