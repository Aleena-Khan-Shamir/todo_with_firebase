import 'package:get/get.dart';
import 'package:todo_with_firebase/pages/edit_task/controller.dart';

class EditBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditController());
  }
}
