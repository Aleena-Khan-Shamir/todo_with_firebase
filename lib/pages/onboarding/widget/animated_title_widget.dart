import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../utils/colors.dart';

class AnimatedTitleWidget extends StatelessWidget {
  const AnimatedTitleWidget({
    super.key,
    required this.titleDelayDuration,
    required this.mainPlayDuration,
  });
  final Duration titleDelayDuration;
  final Duration mainPlayDuration;
  @override
  Widget build(BuildContext context) {
    return Text(
            "Today's tasks are tomorrow's triumphs. Embrace the journey of productivity and turn your to-dos into victories.",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: AppColor.primaryColor))
        .animate()
        .slideY(
            begin: -0.2,
            end: 0,
            delay: titleDelayDuration,
            duration: mainPlayDuration,
            curve: Curves.easeInOutCubic)
        .scaleXY(
            begin: 0,
            end: 1,
            delay: titleDelayDuration,
            duration: mainPlayDuration,
            curve: Curves.easeInOutCubic);
  }
}
