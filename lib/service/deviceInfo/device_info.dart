import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

class DeviceInfo extends GetxService {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Future<String> getDeviceId() async {
    String? deviceID = '';
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceID = androidInfo.id;
      log('Android Id  $deviceID :${androidInfo.model}');
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceID = iosInfo.identifierForVendor;
      log('IOS Id $deviceID');
    }
    return deviceID!;
  }

  // @override
  // void onInit() {
  //   getDeviceId();
  //   super.onInit();
  // }
}
