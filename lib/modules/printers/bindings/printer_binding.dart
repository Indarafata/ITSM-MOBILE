import 'package:get/get.dart';
import 'package:itsm_mobile/controller/printer_controller.dart';
import 'package:itsm_mobile/controller/searchbar_controller.dart';

class PrinterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PrinterController());
    Get.put(SearchbarController());
  }
}
