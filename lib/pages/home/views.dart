import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_with_firebase/config/routes/app_routes.dart';
import 'package:todo_with_firebase/data/model/task_model.dart';
import 'package:todo_with_firebase/pages/add_task/controller.dart';
import 'package:todo_with_firebase/pages/home/controller.dart';
import 'package:todo_with_firebase/pages/home/widgets/animated_text_widget.dart';
import 'package:todo_with_firebase/pages/home/widgets/task_card.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});
  final AddController addController = AddController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final avatarPlayDuration = 500.ms;
    final avatarWaitingDuration = 400.ms;
    final nameDelayDuration = 1000.ms;
    final namePlayDuration = 800.ms;
    final namePlayDuration1 = 750.ms;
    final nameDelayDuration1 = nameDelayDuration + namePlayDuration - 400.ms;
    final listPlayDuration = 400.ms;
    final listDleyDuration = nameDelayDuration1 + namePlayDuration1;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.addTask),
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
                child: Text(controller.greetingMessage(),
                        style: const TextStyle(color: Colors.white))
                    .animate()
                    .scaleXY(
                        begin: 0,
                        end: 2,
                        duration: avatarPlayDuration,
                        curve: Curves.easeInOutSine)
                    .then(delay: avatarWaitingDuration)
                    .scaleXY(begin: 2, end: 1)
                    .slide(begin: const Offset(2, 4), end: Offset.zero),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AnimatedTextWidget(
                    text: DateFormat('MMM d, yyyy').format(DateTime.now()),
                    namePlayDuration: namePlayDuration1,
                    nameDelayDuration: nameDelayDuration1),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('My Tasks',
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    child: GetBuilder<HomeController>(
                        init: HomeController(),
                        builder: (controller) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 40, left: 20, right: 20),
                            child: StreamBuilder(
                              stream: controller.taskFirebaseDataSource.tasks
                                  .where('deviceID',
                                      isEqualTo: controller.deviceID)
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return const Center(
                                      child: Text('Something went wrong'));
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(child: Text("Loading"));
                                }
                                if (snapshot.data!.docs.isEmpty) {
                                  return Center(
                                      child: Text('No tasks available',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium));
                                }

                                return ListView(
                                  children: snapshot.data!.docs
                                      .map((DocumentSnapshot document) {
                                    TaskModel task = TaskModel.fromJson(document
                                        .data()! as Map<String, dynamic>);

                                    return TaskCard(
                                      task: task,
                                      listPlayDuration: listPlayDuration,
                                      listDelayDuration: listDleyDuration,
                                    );
                                  }).toList(),
                                );
                              },
                            ),
                          );
                        })),
              ),
            ],
          ),
        ));
  }
}
