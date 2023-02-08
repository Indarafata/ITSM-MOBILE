import 'package:get/get.dart';
import 'package:itsm_mobile/controller/pdu_controller.dart';

class PduBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PduController());
  }
}
