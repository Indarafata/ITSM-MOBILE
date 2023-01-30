import 'package:get/get.dart';
import 'package:itsm_mobile/modules/computers/controllers/computer_controllers.dart';

class DeviceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ComputerController());
  }
}
