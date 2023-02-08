import 'package:get/get.dart';
import 'package:itsm_mobile/controller/monitor_controller.dart';

class MonitorBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MonitorController());
  }
}
