import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/model/monitor_model.dart';
import 'package:itsm_mobile/service/monitor_service.dart';
import '../../../routes/app_pages.dart';

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
      var dataMonitor = await monitor?.getAllMonitor();
      if (dataMonitor!.length != null) {
        monitors.assignAll(dataMonitor);
      }
      isLoading.value = false;
    } catch (e) {
      print(e);
      isLoading.value = false;
      e.toString();
    }
  }
}
