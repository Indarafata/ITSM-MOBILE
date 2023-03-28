import 'package:get/get.dart';
import 'package:itsm_mobile/modules/computers/bindings/computer_binding.dart';
import 'package:itsm_mobile/modules/computers/views/computer_page.dart';
import 'package:itsm_mobile/modules/computers/views/detail_computer.dart';
import 'package:itsm_mobile/modules/computers/views/detail_computer.dart';
import 'package:itsm_mobile/modules/computers/views/update_page.dart';
import 'package:itsm_mobile/modules/devices/bindings/device_binding.dart';
import 'package:itsm_mobile/modules/devices/views/device_detail.dart';
import 'package:itsm_mobile/modules/devices/views/device_update.dart';
import 'package:itsm_mobile/modules/devices/views/device_view.dart';
import 'package:itsm_mobile/modules/home/bindings/home_binding.dart';
import 'package:itsm_mobile/modules/home/views/home_page.dart';
import 'package:itsm_mobile/modules/login/bindings/login_binding.dart';
import 'package:itsm_mobile/modules/monitors/bindings/monitor_binding.dart';
import 'package:itsm_mobile/modules/monitors/views/monitor_detail.dart';
import 'package:itsm_mobile/modules/monitors/views/monitor_page.dart';
import 'package:itsm_mobile/modules/monitors/views/monitor_update.dart';
import 'package:itsm_mobile/modules/network_devices/bindings/network_binding.dart';
import 'package:itsm_mobile/modules/network_devices/views/network_detail.dart';
import 'package:itsm_mobile/modules/network_devices/views/network_page.dart';
import 'package:itsm_mobile/modules/network_devices/views/network_update.dart';
import 'package:itsm_mobile/modules/pdus/bindings/pdu_binding.dart';
import 'package:itsm_mobile/modules/pdus/views/pdu_detail.dart';
import 'package:itsm_mobile/modules/pdus/views/pdu_page.dart';
import 'package:itsm_mobile/modules/pdus/views/pdu_update.dart';
import 'package:itsm_mobile/modules/phones/bindings/phone_binding.dart';
import 'package:itsm_mobile/modules/phones/views/phone_detail.dart';
import 'package:itsm_mobile/modules/phones/views/phone_update.dart';
import 'package:itsm_mobile/modules/phones/views/phone_view.dart';
import 'package:itsm_mobile/modules/printers/bindings/printer_binding.dart';
import 'package:itsm_mobile/modules/printers/views/printer_detail.dart';
import 'package:itsm_mobile/modules/printers/views/printer_page.dart';
import 'package:itsm_mobile/modules/printers/views/printer_update.dart';
import 'package:itsm_mobile/modules/racks/bindings/rack_binding.dart';
import 'package:itsm_mobile/modules/racks/views/rack_detail.dart';
import 'package:itsm_mobile/modules/racks/views/rack_page.dart';
import 'package:itsm_mobile/modules/racks/views/racks_update.dart';
import 'package:itsm_mobile/modules/searcbar/views/searchbar.dart';
import 'package:itsm_mobile/modules/software/bindings/software_binding.dart';
import 'package:itsm_mobile/modules/software/views/software_detail.dart';
import 'package:itsm_mobile/modules/software/views/software_page.dart';
import 'package:itsm_mobile/modules/software/views/software_update.dart';
import 'package:itsm_mobile/modules/splash/splash.dart';
import '../modules/login/views/login.dart';
import '../modules/searcbar/bindings/searcbar_binding.dart';

part './app_routes.dart';

class AppPages {
  static const initial = RouteName.splash;

  static final pages = [
    //Welcome Page
    GetPage(
      name: RouteName.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RouteName.login,
      page: () => Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteName.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RouteName.computer,
      page: () => Computer(),
      binding: ComputerBinding(),
    ),
    GetPage(
      name: RouteName.computer_detail,
      page: () => DetailComputer(),
      binding: ComputerBinding(),
    ),
    GetPage(
      name: RouteName.monitor,
      page: () => Monitor(),
      binding: MonitorBinding(),
    ),
    GetPage(
      name: RouteName.monitor_detail,
      page: () => MonitorDetail(),
      binding: MonitorBinding(),
    ),
    GetPage(
      name: RouteName.software,
      page: () => Software(),
      binding: SoftwareBinding(),
    ),
    GetPage(
      name: RouteName.sofware_detail,
      page: () => SoftwareDetail(),
      binding: SoftwareBinding(),
    ),
    GetPage(
      name: RouteName.network,
      page: () => Network(),
      binding: NetworkBinding(),
    ),
    GetPage(
      name: RouteName.network_detail,
      page: () => NetworkDetail(),
      binding: NetworkBinding(),
    ),
    GetPage(
      name: RouteName.phone,
      page: () => Phone(),
      binding: PhoneBinding(),
    ),
    GetPage(
      name: RouteName.pdu,
      page: () => Pdu(),
      binding: PduBinding(),
    ),
    GetPage(
      name: RouteName.pdu_detail,
      page: () => PduDetail(),
      binding: PduBinding(),
    ),
    GetPage(
      name: RouteName.phone_detail,
      page: () => PhoneDetail(),
      binding: PhoneBinding(),
    ),
    GetPage(
      name: RouteName.device,
      page: () => Device(),
      binding: DeviceBinding(),
    ),
    GetPage(
      name: RouteName.device_detail,
      page: () => DeviceDetail(),
      binding: DeviceBinding(),
    ),
    GetPage(
      name: RouteName.printer,
      page: () => Printer(),
      binding: PrinterBinding(),
    ),
    GetPage(
      name: RouteName.printer_detail,
      page: () => PrinterDetail(),
      binding: PrinterBinding(),
    ),
    GetPage(
      name: RouteName.rack,
      page: () => Rack(),
      binding: RackBinding(),
    ),
    GetPage(
      name: RouteName.rack_detail,
      page: () => RackDetail(),
      binding: RackBinding(),
    ),
    GetPage(
      name: RouteName.computer_update,
      page: () => UpdateComputer(),
    ),
    GetPage(
      name: RouteName.monitor_update,
      page: () => UpdateMonitor(),
    ),
    GetPage(
      name: RouteName.network_update,
      page: () => UpdateNetwork(),
      //binding: PduBinding(),
    ),
    GetPage(
      name: RouteName.pdus_update,
      page: () => UpdatePdu(),
      binding: PduBinding(),
    ),
    GetPage(
      name: RouteName.phone_update,
      page: () => UpdatePhone(),
      //binding: PduBinding(),
    ),
    GetPage(
      name: RouteName.printer_update,
      page: () => UpdatePrinter(),
      //binding: PduBinding(),
    ),
    GetPage(
      name: RouteName.software_update,
      page: () => UpdateSoftware(),
      //binding: PduBinding(),
    ),
    GetPage(
      name: RouteName.device_update,
      page: () => UpdateDevice(),
      //binding: PduBinding(),
    ),
    GetPage(
      name: RouteName.racks_update,
      page: () => UpdateRack(),
      //binding: PduBinding(),
    ),
  ];
}
