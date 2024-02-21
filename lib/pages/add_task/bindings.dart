import 'package:get/get.dart';
import 'package:todo_with_firebase/pages/add_task/controller.dart';

class AddBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddController());
  }
}
