import 'package:get/get.dart';
import 'package:itsm_mobile/controller/network_controller.dart';
import 'package:itsm_mobile/controller/software_controller.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkController());
  }
}
