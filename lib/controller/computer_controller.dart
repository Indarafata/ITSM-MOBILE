import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/controller/location_controller.dart';
import 'package:itsm_mobile/model/computer_model.dart';
import 'package:itsm_mobile/model/location_model.dart';
import 'package:itsm_mobile/service/computer_service.dart';
import 'package:itsm_mobile/service/location_service.dart';
import '../routes/app_pages.dart';

class ComputerController extends GetxController {
  var computers = <ComputerModel>[].obs;
  var locations = <LocationModel>[].obs;
  var name = TextEditingController();
  var locationId = TextEditingController();
  var comment = TextEditingController();
  String? selectedLocation;
  final isLoading = false.obs;
  final GetDataisLoading = false.obs;
  List<String>? suggestions;
  


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
      addItemComputer();
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      e.toString();
    }
  }

  Future<void> updateComputer(int id) async {
    try {
      var input = <String, dynamic>{
        'locations_id': selectedLocation,
        'comment': comment.text,
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

   Future<void> addItemComputer() async {
    GetDataisLoading.value = true;
    suggestions = [];
    for (int i = 0; i < computers!.length; i++) {
      suggestions!.add(computers![i].name);
    }
    for (int i = 0; i < 5; i++) {
      print("huhu");
      print(suggestions![i]);
    }
    GetDataisLoading.value = false;
  }

  // DropdownMenuItem<String> getItemComputer(int i) {
  //   return DropdownMenuItem<String>(
  //       value: computers![i].id.toString(),
  //       child: Text(computers![i].name));
  // }
}
