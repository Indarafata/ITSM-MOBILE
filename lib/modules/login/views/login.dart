import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/modules/home/views/home_page.dart';
import 'package:itsm_mobile/controller/login_controller.dart';
import 'package:itsm_mobile/service/auth_service.dart';

import 'dart:convert';
// import 'package:crypto/crypto.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: const Text(
                  'User Login',
                  style: TextStyle(fontSize: 35),
                ),
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.contain)),
              ),
              // Container(
              //   padding: const EdgeInsets.all(10),
              //   child: TextField(
              //     controller: controller.nameTextController,
              //     decoration: const InputDecoration(
              //       border: OutlineInputBorder(),
              //       labelText: 'User Name',
              //     ),
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              //   child: TextField(
              //     obscureText: true,
              //     controller: controller.passwordTextController,
              //     decoration: const InputDecoration(
              //       border: OutlineInputBorder(),
              //       labelText: 'Password',
              //     ),
              //   ),
              // ),
              Text("LANGSUNG KLIK LOGIN GAUSAH NGISI FORM"),
              Container(
                child: SizedBox(
                  height: 60,
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      controller.login();
                    },
                  )),
            ],
          )),
    );
  }
}
