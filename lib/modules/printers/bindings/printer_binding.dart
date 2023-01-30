import 'package:get/get.dart';
import 'package:itsm_mobile/modules/printers/controllers/printer_controller.dart';

class PrinterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PrinterController());
  }
}
