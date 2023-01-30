import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/model/device_model.dart';
import 'package:itsm_mobile/service/device_service.dart';
import '../../../routes/app_pages.dart';

class DeviceController extends GetxController {
  var devices = <DeviceModel>[].obs;
  var device = DeviceService();
  final isChekTime = false.obs;
  DateTime tanggal = DateTime.now();
  final isLoading = false.obs;

  @override
  void onInit() {
    getAllDevice();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getAllDevice() async {
    isLoading.value = true;
    try {
      final dataDevice = await device.getAllDevice();
      if (dataDevice != null) {
        devices.assignAll(dataDevice);
      }
      isLoading.value = false;
    } catch (e) {
      print(e);
      isLoading.value = false;
      e.toString();
    }
  }
}
