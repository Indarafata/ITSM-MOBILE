import 'package:get/get.dart';
import 'package:itsm_mobile/controller/pdu_controller.dart';
import 'package:itsm_mobile/controller/searchbar_controller.dart';

class PduBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PduController());
    Get.put(SearchbarController());
  }
}
