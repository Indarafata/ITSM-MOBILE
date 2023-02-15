import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/model/location_model.dart';
import 'package:itsm_mobile/model/rack_model.dart';
import 'package:itsm_mobile/service/rack_service.dart';
import '../routes/app_pages.dart';

class RackController extends GetxController {
  var racks = <RackModel>[].obs;
  var rack = RackService();
  var name = TextEditingController();
  var comment = TextEditingController();
  var locations = <LocationModel>[].obs;
  List<DropdownMenuItem<String>>? list;
  String? selectedLocation;
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

  Future<void> updateRack(int id) async {
    try {
      var input = <String, dynamic>{
        'id': id,
        'locations_id': selectedLocation,
        'comment': comment.text,
      };

      await RackService.updateRack(id, input);

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
