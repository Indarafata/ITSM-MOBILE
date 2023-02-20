import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../controller/splash_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: const BoxDecoration(
        // gradient: LinearGradient(
        //   begin: Alignment.topRight,
        //   end: Alignment.bottomLeft,
        //   colors: [colorPrimary, colorSecondary],
        // ),
        color: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                height: 22.h,
              ),
            )
          ],
        ),
      ),
    );
  }
}
