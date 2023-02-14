import 'package:get/get.dart';
import 'package:itsm_mobile/model/monitor_model.dart';
import 'package:itsm_mobile/modules/monitors/views/monitor_update.dart';
import 'package:itsm_mobile/routes/app_pages.dart';
import 'package:itsm_mobile/service/monitor_service.dart';
import 'package:itsm_mobile/service/location_service.dart';
import 'package:itsm_mobile/model/location_model.dart';
import 'package:flutter/material.dart';

class MonitorController extends GetxController {
  var monitors = <MonitorModel>[].obs;
  var locations = <LocationModel>[].obs;
  var name = TextEditingController();
  var locationId = TextEditingController();
  var monitor = MonitorService();
  final isLoading = false.obs;
  List<DropdownMenuItem<String>>? list;
  String? selectedLocation;

  LocationModel? dataLocation;

  @override
  void onInit() {
    getAllMonitor();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getAllMonitor() async {
    isLoading.value = true;
    try {
      var dataMonitor = await monitor.getAllMonitor();
      if (dataMonitor != null) {
        monitors.assignAll(dataMonitor);
      }
      isLoading.value = false;
    } catch (e) {
      print(e);
      isLoading.value = false;
      e.toString();
    }
  }

  Future<void> updateMonitor(int id) async {
    try {
      var input = <String, dynamic>{
        'locations_id': selectedLocation,
      };

      await MonitorService.updateMonitor(id, input);

      Get.snackbar(
        'Sukses !!',
        'Berhasil Mengubah Data',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
      Get.offAllNamed(RouteName.home);
    } catch (e) {
      Get.snackbar(
        'Gagal Mengubah Data!',
        '$e',
        backgroundColor: Color.fromARGB(255, 34, 28, 28),
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    }
  }
}
