import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/model/location_model.dart';
import 'package:itsm_mobile/model/pdu_model.dart';
import 'package:itsm_mobile/service/pdu_service.dart';
import '../routes/app_pages.dart';

class PduController extends GetxController {
  var data = <PduModel>[].obs;
  var duplicateData = <PduModel>[].obs;
  var searchResult = <PduModel>[].obs;
  var pdu = PduService();
  var name = TextEditingController();
  var comment = TextEditingController();
  var locations = <LocationModel>[].obs;
  List<DropdownMenuItem<String>>? list;
  String? selectedLocation;

  final isLoading = false.obs;

  @override
  void onInit() {
    getAllpdu();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getAllpdu() async {
    isLoading.value = true;
    try {
      final datapdu = await pdu.getAllPdu();
      if (datapdu != null) {
        data.assignAll(datapdu);
        duplicateData.assignAll(datapdu);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      e.toString();
    }
  }

  Future<void> updatePdu(int id) async {
    try {
      var input = <String, dynamic>{
        'id': id,
        'locations_id': selectedLocation,
        'comment': comment.text,
      };

      await PduService.updatePdu(id, input);

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
