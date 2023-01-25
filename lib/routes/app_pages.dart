import 'package:get/get.dart';
import 'package:itsm_mobile/modules/computers/bindings/computer_binding.dart';
import 'package:itsm_mobile/modules/computers/views/computer_page.dart';
import 'package:itsm_mobile/modules/computers/views/detail_computer.dart';
import 'package:itsm_mobile/modules/computers/views/detail_computer.dart';
import 'package:itsm_mobile/modules/home_page/views/home_page.dart';
import 'package:itsm_mobile/modules/login/bindings/login_binding.dart';
import 'package:itsm_mobile/modules/monitors/bindings/monitor_binding.dart';
import 'package:itsm_mobile/modules/monitors/views/monitor_page.dart';
import 'package:itsm_mobile/modules/software/bindings/software_binding.dart';
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
      // binding: RegisterBinding(),
    ),
    GetPage(
      name: RouteName.computer,
      page: () => Computer(),
      binding: ComputerBinding(),
    ),
    GetPage(
      name: RouteName.detail_computer,
      page: () => DetailComputer(),
      binding: ComputerBinding(),
    ),
    GetPage(
      name: RouteName.monitor,
      page: () => Monitor(),
      binding: MonitorBinding(),
    ),
    GetPage(
      name: RouteName.software,
      page: () => Software(),
      binding: SoftwareBinding(),
    ),
  ];
}
