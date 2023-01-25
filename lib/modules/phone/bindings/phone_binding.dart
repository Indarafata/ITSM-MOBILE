import 'package:get/get.dart';
import 'package:itsm_mobile/modules/phone/controllers/phone_controllers.dart';

class PhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PhoneController());
  }
}
