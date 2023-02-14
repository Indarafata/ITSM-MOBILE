import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/model/device_model.dart';
import 'package:itsm_mobile/model/location_model.dart';
import 'package:itsm_mobile/service/device_service.dart';
import '../routes/app_pages.dart';

class DeviceController extends GetxController {
  var devices = <DeviceModel>[].obs;
  var device = DeviceService();
  final isLoading = false.obs;
  var name = TextEditingController();
  var locationId = TextEditingController();
  var locations = <LocationModel>[].obs;
  List<DropdownMenuItem<String>>? list;
  String? selectedLocation;

  LocationModel? dataLocation;

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

  Future<void> updateDevice(int id) async {
    try {
      var input = <String, dynamic>{
        'locations_id': selectedLocation,
      };

      await DeviceService.updateDevice(id, input);

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
