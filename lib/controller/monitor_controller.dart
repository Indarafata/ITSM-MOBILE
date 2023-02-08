import 'package:get/get.dart';
import 'package:itsm_mobile/model/monitor_model.dart';
import 'package:itsm_mobile/service/monitor_service.dart';

class MonitorController extends GetxController {
  var monitors = <MonitorModel>[].obs;
  var monitor = MonitorService();
  final isChekTime = false.obs;
  DateTime tanggal = DateTime.now();
  final isLoading = false.obs;

  @override
  void onInit() {
    getMonitor();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getMonitor() async {
    isLoading.value = true;
    try {
      var dataMonitor = await monitor.getAllMonitor();
      monitors.assignAll(dataMonitor);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      e.toString();
    }
  }
}
