import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/model/computer_model.dart';
import 'package:itsm_mobile/service/computer_service.dart';
import '../../../routes/app_pages.dart';

class EventController extends GetxController {
  var computers = <ComputerModel>[].obs;
  // final computer = Get.put(ComputerService());
  var computer = ComputerService();
  final isChekTime = false.obs;
  int? idEvent;
  DateTime tanggal = DateTime.now();
  final isLoading = false.obs;

  @override
  void onInit() {
    getAllEvent();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getAllEvent() async {
    isLoading.value = true;
    try {
      final dataComputer = await computer.getAllComputer();
      if (dataComputer != null) {
        computers.assignAll(dataComputer);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      e.toString();
    }
  }
}
