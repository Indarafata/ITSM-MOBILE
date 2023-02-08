import 'package:get/get.dart';
import 'package:itsm_mobile/controller/computer_controller.dart';

class ComputerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ComputerController());
  }
}
