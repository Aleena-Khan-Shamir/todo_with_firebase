import 'package:get/get.dart';
import 'package:todo_with_firebase/service/deviceInfo/device_info.dart';

import '../../data/data.dart';

class HomeController extends GetxController {
  TaskRepository taskRepository = TaskRepositoryImp(TaskFirebaseDataeSource());

  TaskFirebaseDataeSource taskFirebaseDataSource = TaskFirebaseDataeSource();

  // #####################################################
  // Greetings
  String greetingMessage() {
    var timeNow = DateTime.now().hour;

    if (timeNow <= 12) {
      return 'Good Morning';
    } else if ((timeNow >= 12) && (timeNow <= 16)) {
      return 'Good Afternoon';
    } else if ((timeNow >= 16) && (timeNow <= 20)) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

// ###########################################
// Device info
  final DeviceInfo deviceInfo = DeviceInfo();
  String? deviceID = 'Loading';
  Future<String> getId() async {
    deviceID = await deviceInfo.getDeviceId();
    update();
    return deviceID!;
  }

  // ###########################################
  // Delete task
  Future<void> deleteTask(String documentId) {
    return taskRepository.deleteTask(documentId);
  }

  @override
  void onInit() {
    getId();
    super.onInit();
  }
}
