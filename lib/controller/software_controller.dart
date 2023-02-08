import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/model/software_model.dart';
import 'package:itsm_mobile/service/software_service.dart';
import '../routes/app_pages.dart';

class SoftwareController extends GetxController {
  var softwares = <SoftwareModel>[].obs;
  var software = SoftwareService();
  final isLoading = false.obs;

  @override
  void onInit() {
    getAllSoftware();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getAllSoftware() async {
    isLoading.value = true;
    try {
      final dataSoftware = await software.getAllSoftware();
      if (dataSoftware != null) {
        softwares.assignAll(dataSoftware);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      e.toString();
    }
  }
}
