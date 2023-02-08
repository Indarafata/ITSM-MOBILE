import 'package:get/get.dart';
import 'package:itsm_mobile/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
