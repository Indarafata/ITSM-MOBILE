import 'package:get/get.dart';
import 'package:itsm_mobile/controller/home_controller.dart';
import 'package:itsm_mobile/controller/location_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(LocationController());
  }
}
