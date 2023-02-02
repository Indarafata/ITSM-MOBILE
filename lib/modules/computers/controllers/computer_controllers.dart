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
  var name = TextEditingController();
  var locationId = TextEditingController();
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
      final dataComputer = await computer.getAllComputer();
      computers.assignAll(dataComputer);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      e.toString();
    }
  }

  Future<void> updateTask(int id) async {
    try {
      var input = <String, dynamic>{
        'locations_id': locationId.text,
      };

      await ComputerService.updateComputer(id, input);

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
