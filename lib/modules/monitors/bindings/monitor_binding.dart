import 'package:get/get.dart';
import 'package:itsm_mobile/modules/monitors/controllers/monitor_controllers.dart';

class MonitorBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MonitorController());
  }
}
