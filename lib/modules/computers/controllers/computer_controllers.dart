import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/model/computer_model.dart';
import 'package:itsm_mobile/model/location_model.dart';
import 'package:itsm_mobile/service/computer_service.dart';
import 'package:itsm_mobile/service/location_service.dart';
import '../../../routes/app_pages.dart';

class ComputerController extends GetxController {
  var computers = <ComputerModel>[].obs;
  var locations = <LocationModel>[].obs;
  var name = TextEditingController();
  var locationId = TextEditingController();
  final isLoading = false.obs;

  LocationModel? dataLocation;

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
      final dataComputer = await ComputerService.getAllComputer();
      computers.assignAll(dataComputer);
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

  Future<void> updateComputer(int id) async {
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
