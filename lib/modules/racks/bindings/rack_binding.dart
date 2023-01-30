import 'package:get/get.dart';
import 'package:itsm_mobile/modules/racks/controllers/rack_controller.dart';

class RackBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RackController());
  }
}
