import 'package:get/get.dart';
import 'package:itsm_mobile/model/monitor_model.dart';
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
  final isChekTime = false.obs;
  DateTime tanggal = DateTime.now();
  final isLoading = false.obs;

  LocationModel? dataLocation;

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

  Future<void> getLocation(String location) async {
    isLoading.value = true;
    try {
      dataLocation = await LocationService.getLocation(location);
      print(dataLocation!.name);
      isLoading.value = false;
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }
}
