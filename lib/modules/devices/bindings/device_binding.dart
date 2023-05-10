import 'package:get/get.dart';
import 'package:itsm_mobile/controller/device_controller.dart';
import 'package:itsm_mobile/controller/searchbar_controller.dart';

class DeviceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DeviceController());
    Get.put(SearchbarController());
  }
}
