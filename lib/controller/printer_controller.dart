import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/model/printer_model.dart';
import 'package:itsm_mobile/service/printer_service.dart';
import '../routes/app_pages.dart';

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
      print(111);
      List<PrinterModel>? dataprinter;
      dataprinter = await printer.getAllPrinter();
      print(2);
      if (dataprinter != null) {
        print(3);
        printers.assignAll(dataprinter);
      }
      isLoading.value = false;
    } catch (e) {
      print(e);
      // log("hoo");
      // log(e.toString());
      e.toString();

      isLoading.value = false;
      e.toString();
    }
  }
}
