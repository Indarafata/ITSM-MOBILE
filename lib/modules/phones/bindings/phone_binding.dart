import 'package:get/get.dart';
import 'package:itsm_mobile/controller/phone_controller.dart';
import 'package:itsm_mobile/controller/searchbar_controller.dart';

class PhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PhoneController());
    Get.put(SearchbarController());
  }
}
