import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/model/location_model.dart';
import 'package:itsm_mobile/model/software_model.dart';
import 'package:itsm_mobile/service/software_service.dart';
import '../routes/app_pages.dart';

class SoftwareController extends GetxController {
  var softwares = <SoftwareModel>[].obs;
  var software = SoftwareService();
  var name = TextEditingController();
  var locationId = TextEditingController();
  var locations = <LocationModel>[].obs;
  List<DropdownMenuItem<String>>? list;
  String? selectedLocation;
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

  Future<void> updateSoftware(int id) async {
    try {
      var input = <String, dynamic>{
        'locations_id': locationId.text,
      };

      await SoftwareService.updateSoftware(id, input);

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
