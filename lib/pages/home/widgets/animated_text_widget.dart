import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedTextWidget extends StatelessWidget {
  const AnimatedTextWidget({
    super.key,
    required this.text,
    required this.namePlayDuration,
    required this.nameDelayDuration,
  });
  final String text;
  final Duration namePlayDuration;
  final Duration nameDelayDuration;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.titleLarge)
        .animate()
        .slideX(
            begin: 0.2,
            end: 0,
            duration: namePlayDuration,
            delay: nameDelayDuration,
            curve: Curves.fastOutSlowIn)
        .fadeIn();
  }
}
