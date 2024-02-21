import 'package:flutter/material.dart';
import 'package:todo_with_firebase/pages/add_task/controller.dart';

class MyTextformfield extends StatelessWidget {
  const MyTextformfield({
    super.key,
    required this.controller,
  });

  final AddController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 2))
          ]),
      child: TextFormField(
        controller: controller.taskName,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        decoration: const InputDecoration(
            hintText: 'Enter task name',
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(15)))),
      ),
    );
  }
}
