import 'package:get/get.dart';
import 'package:todo_with_firebase/pages/onboarding/controller.dart';

class OnBoardingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingController());
  }
}
