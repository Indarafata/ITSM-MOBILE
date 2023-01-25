import 'package:get/get.dart';
import 'package:itsm_mobile/modules/phones/controllers/phone_controllers.dart';

class PhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PhoneController());
  }
}
