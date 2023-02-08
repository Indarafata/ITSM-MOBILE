import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/model/phone_model.dart';
import 'package:itsm_mobile/service/phone_service.dart';
import '../routes/app_pages.dart';

class PhoneController extends GetxController {
  var phones = <PhoneModel>[].obs;
  var phone = PhoneService();
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
        phones.assignAll(dataphone);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      e.toString();
    }
  }
}
