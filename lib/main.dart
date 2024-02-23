import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:todo_with_firebase/config/config.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import './service/notiifcation/firebase_notification.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(NotificationServices());
  tz.initializeTimeZones();
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'To Do App',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.themeData,
      initialRoute: Routes.onboarding,
      getPages: AppPages.routes,
    );
  }
}
