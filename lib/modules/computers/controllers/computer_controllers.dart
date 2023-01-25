import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/model/computer_model.dart';
import 'package:itsm_mobile/service/computer_service.dart';
import '../../../routes/app_pages.dart';

class ComputerController extends GetxController {
  var computers = <ComputerModel>[].obs;
  // final computer = Get.put(ComputerService());
  var computer = ComputerService();
  final isChekTime = false.obs;
  DateTime tanggal = DateTime.now();
  final isLoading = false.obs;

  @override
  void onInit() {
    getAllComputer();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getAllComputer() async {
    isLoading.value = true;
    try {
      print("satu");
      final dataComputer = await computer.getAllComputer();
      print("dua");
      if (dataComputer != null) {
        print("tiga");
        computers.assignAll(dataComputer);
        print("empat");
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      e.toString();
    }
  }
}
