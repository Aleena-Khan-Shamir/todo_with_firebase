import 'package:get/get.dart';
import 'package:todo_with_firebase/config/routes/app_routes.dart';
import 'package:todo_with_firebase/pages/add_task/index.dart';
import 'package:todo_with_firebase/pages/edit_task/index.dart';
import 'package:todo_with_firebase/pages/home/index.dart';
import 'package:todo_with_firebase/pages/onboarding/index.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(name: Routes.home, page: () => HomePage(), binding: HomeBindings()),
    GetPage(
        name: Routes.onboarding,
        page: () => const OnBoardingPage(),
        binding: OnBoardingBindings()),
    GetPage(
        name: Routes.addTask,
        page: () => const AddPage(),
        binding: AddBindings()),
    GetPage(
        name: Routes.editTask,
        page: () => const EditPage(),
        binding: EditBindings()),
  ];
}
