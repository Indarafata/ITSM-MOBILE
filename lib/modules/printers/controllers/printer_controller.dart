import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/model/printer_model.dart';
import 'package:itsm_mobile/service/printer_service.dart';
import '../../../routes/app_pages.dart';

class PrinterController extends GetxController {
  var printers = <PrinterModel>[].obs;
  var printer = PrinterService();
  final isLoading = false.obs;

  @override
  void onInit() {
    getAllprinter();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getAllprinter() async {
    isLoading.value = true;
    try {
      final dataprinter = await printer.getAllPrinter();
      if (dataprinter != null) {
        printers.assignAll(dataprinter);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      e.toString();
    }
  }
}
