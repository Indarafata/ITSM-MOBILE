import 'package:get/get.dart';
import 'package:itsm_mobile/modules/pdus/controllers/pdu_controller.dart';

class PduBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PduController());
  }
}
