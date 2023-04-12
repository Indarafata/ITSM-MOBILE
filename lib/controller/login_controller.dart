import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:itsm_mobile/routes/app_pages.dart';
import 'package:itsm_mobile/service/auth_service.dart';
import 'dart:convert';

class LoginController extends GetxController {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final isObsecured = true.obs;

  var isLoading = false;

  @override
  void onClose() {
    nameTextController.dispose();
    passwordTextController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    try {
      // String name = nameTextController.text;
      // String password = passwordTextController.text;
      String name = "nur.muhsinin";
      String password = "duabelas";

      final str = "$name:$password";
      final bytes = utf8.encode(str);
      final authorization = base64.encode(bytes);
      var data = <String, dynamic>{
        'authorization': authorization,
      };

      var loginResponse = await AuthService.authLogin(data);

      // await Storage.saveValue(storageToken, loginResponse!.payload.token);

      Get.snackbar(
        'Berhasil Masuk !',
        'Selamat Datang',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
      Get.offAllNamed(RouteName.home);
    } catch (e) {
      Get.snackbar(
        'Gagal Masuk !',
        'Email atau Password Salah.',
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    }
  }
}
