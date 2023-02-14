import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/model/location_model.dart';
import 'package:itsm_mobile/model/network_model.dart';
import 'package:itsm_mobile/service/network_service.dart';
import '../routes/app_pages.dart';

class NetworkController extends GetxController {
  var networks = <NetworkModel>[].obs;
  var network = NetworkService();
  var locationId = TextEditingController();
  var locations = <LocationModel>[].obs;
  var name = TextEditingController();
  final isLoading = false.obs;
  List<DropdownMenuItem<String>>? list;
  String? selectedLocation;

  @override
  void onInit() {
    getAllNetwork();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getAllNetwork() async {
    isLoading.value = true;
    try {
      final dataNetwork = await network.getAllNetwork();
      if (dataNetwork != null) {
        networks.assignAll(dataNetwork);
      }
      isLoading.value = false;
    } catch (e) {
      print(e);
      isLoading.value = false;
      e.toString();
    }
  }

  Future<void> updateNetwork(int id) async {
    try {
      var input = <String, dynamic>{
        'locations_id': selectedLocation,
      };

      await NetworkService.updateNetwork(id, input);

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
