import 'package:get/get.dart';
import 'package:itsm_mobile/modules/computers/bindings/computer_binding.dart';
import 'package:itsm_mobile/modules/computers/views/computer_page.dart';
import 'package:itsm_mobile/modules/computers/views/detail_computer.dart';
import 'package:itsm_mobile/modules/computers/views/detail_computer.dart';
import 'package:itsm_mobile/modules/home/bindings/home_binding.dart';
import 'package:itsm_mobile/modules/home/views/home_page.dart';
import 'package:itsm_mobile/modules/login/bindings/login_binding.dart';
import 'package:itsm_mobile/modules/monitors/bindings/monitor_binding.dart';
import 'package:itsm_mobile/modules/monitors/views/monitor_detail.dart';
import 'package:itsm_mobile/modules/monitors/views/monitor_page.dart';
import 'package:itsm_mobile/modules/network_devices/bindings/network_binding.dart';
import 'package:itsm_mobile/modules/network_devices/views/network_detail.dart';
import 'package:itsm_mobile/modules/network_devices/views/network_page.dart';
import 'package:itsm_mobile/modules/phones/bindings/phone_binding.dart';
import 'package:itsm_mobile/modules/phones/views/phone_detail.dart';
import 'package:itsm_mobile/modules/phones/views/phone_view.dart';
import 'package:itsm_mobile/modules/software/bindings/software_binding.dart';
import 'package:itsm_mobile/modules/software/views/software_detail.dart';
import 'package:itsm_mobile/modules/software/views/software_page.dart';
import 'package:itsm_mobile/modules/splash/splash.dart';
import '../modules/login/views/login.dart';

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
      name: RouteName.phone_detail,
      page: () => PhoneDetail(),
      binding: PhoneBinding(),
    ),
  ];
}
