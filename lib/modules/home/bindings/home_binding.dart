import 'package:get/get.dart';
import 'package:itsm_mobile/modules/home/controllers/home_controllers.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
