import 'package:get/get.dart';
import 'package:itsm_mobile/modules/devices/controllers/device_controller.dart';

class DeviceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DeviceController());
  }
}
