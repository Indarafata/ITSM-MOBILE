import 'package:get/get.dart';
import 'package:itsm_mobile/modules/network_devices/controllers/network_controllers.dart';
import 'package:itsm_mobile/modules/software/controllers/software_controller.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkController());
  }
}
