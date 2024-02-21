import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedButtonWidget extends StatelessWidget {
  const AnimatedButtonWidget({
    super.key,
    this.height,
    this.width,
    required this.text,
    required this.buttonDelayDuration,
    required this.buttonPlayDuration,
    required this.onTap,
  });
  final double? height;
  final double? width;
  final String text;
  final Duration buttonDelayDuration;
  final Duration buttonPlayDuration;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: height,
            width: width,
            child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                child: AnimatedText(
                    text: text,
                    buttonDelayDuration: buttonDelayDuration,
                    buttonPlayDuration: buttonPlayDuration)))
        .animate()
        .slideY(
            begin: 2,
            end: 0,
            delay: buttonDelayDuration,
            duration: buttonPlayDuration,
            curve: Curves.easeInOutCubic);
  }
}

class AnimatedText extends StatelessWidget {
  final Duration buttonPlayDuration;
  final Duration buttonDelayDuration;

  final String text;
  const AnimatedText(
      {super.key,
      required this.text,
      required this.buttonPlayDuration,
      required this.buttonDelayDuration});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.titleLarge)
        .animate()
        .scaleXY(
            begin: 0,
            end: 1,
            delay: buttonDelayDuration + 300.ms,
            duration: buttonPlayDuration,
            curve: Curves.easeInOutCubic);
  }
}
