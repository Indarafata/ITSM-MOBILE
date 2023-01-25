import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/model/network_model.dart';
import 'package:itsm_mobile/service/network_service.dart';
import '../../../routes/app_pages.dart';

class NetworkController extends GetxController {
  var networks = <NetworkModel>[].obs;
  var network = NetworkService();
  final isLoading = false.obs;

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
      print("1");
      final dataNetwork = await network.getAllNetwork();
      print("2");
      if (dataNetwork != null) {
        print("3");
        networks.assignAll(dataNetwork);
      }
      isLoading.value = false;
    } catch (e) {
      print(e);
      isLoading.value = false;
      e.toString();
    }
  }
}
