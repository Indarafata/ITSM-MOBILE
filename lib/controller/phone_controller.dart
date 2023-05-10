import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/model/location_model.dart';
import 'package:itsm_mobile/model/phone_model.dart';
import 'package:itsm_mobile/service/phone_service.dart';
import '../routes/app_pages.dart';

class PhoneController extends GetxController {
  // var phones = <PhoneModel>[].obs;
  var data = <PhoneModel>[].obs;
  var duplicateData = <PhoneModel>[].obs;
  var searchResult = <PhoneModel>[].obs;
  var phone = PhoneService();
  var locations = <LocationModel>[].obs;
  var comment = TextEditingController();
  var name = TextEditingController();
  List<DropdownMenuItem<String>>? list;
  String? selectedLocation;
  final isLoading = false.obs;

  @override
  void onInit() {
    getAllPhone();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getAllPhone() async {
    isLoading.value = true;
    try {
      final dataphone = await phone.getAllPhone();
      if (dataphone != null) {
        data.assignAll(dataphone);
        duplicateData.assignAll(dataphone);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      e.toString();
    }
  }

  Future<void> updatePhone(int id) async {
    try {
      var input = <String, dynamic>{
        'id': id,
        'locations_id': selectedLocation,
        'comment': comment.text,
      };

      await PhoneService.updatePhone(id, input);

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

  void addSearchResult(data) {
    // searchResult.assign(data);
    searchResult.add(data);
  }

  void addAllSearchResult(temp) {
    data.clear();
    data.assignAll(temp);
  }
}
