import 'package:get/get.dart';
import 'package:itsm_mobile/controller/phone_controller.dart';

class PhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PhoneController());
  }
}
