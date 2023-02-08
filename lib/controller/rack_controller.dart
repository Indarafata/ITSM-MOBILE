import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/model/rack_model.dart';
import 'package:itsm_mobile/service/rack_service.dart';
import '../routes/app_pages.dart';

class RackController extends GetxController {
  var racks = <RackModel>[].obs;
  var rack = RackService();
  final isLoading = false.obs;

  @override
  void onInit() {
    getAllRack();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getAllRack() async {
    isLoading.value = true;
    try {
      final dataRack = await rack.getAllRack();
      if (dataRack != null) {
        racks.assignAll(dataRack);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      e.toString();
    }
  }
}
