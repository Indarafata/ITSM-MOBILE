import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/model/pdu_model.dart';
import 'package:itsm_mobile/service/pdu_service.dart';
import '../routes/app_pages.dart';

class PduController extends GetxController {
  var pdus = <PduModel>[].obs;
  var pdu = PduService();
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
        pdus.assignAll(datapdu);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      e.toString();
    }
  }
}
