import 'package:get/get.dart';
import 'package:itsm_mobile/controller/searchbar_controller.dart';
import 'package:itsm_mobile/controller/software_controller.dart';

class SoftwareBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SoftwareController());
    Get.put(SearchbarController());
  }
}
