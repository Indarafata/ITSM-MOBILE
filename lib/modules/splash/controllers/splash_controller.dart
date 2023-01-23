import 'dart:developer';

import 'package:get/get.dart';
import 'package:itsm_mobile/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    checkToken();
    super.onInit();
  }

  Future<void> checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    await Future.delayed(
      const Duration(seconds: 3),
      () {},
    );
    print(token);
    token == null
        ? Get.offAllNamed(RouteName.login)
        : Get.offAllNamed(RouteName.home);
  }
}
