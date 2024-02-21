import 'package:flutter/material.dart';
import 'package:todo_with_firebase/utils/colors.dart';

class SelectedTimeWidget extends StatelessWidget {
  const SelectedTimeWidget({
    super.key,
    required this.onTap,
    required this.text,
  });

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width * 0.4,
      height: size.height * 0.04,
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(15)),
      child: GestureDetector(
          onTap: onTap,
          child: Center(
              child: Text(text,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white)))),
    );
  }
}
