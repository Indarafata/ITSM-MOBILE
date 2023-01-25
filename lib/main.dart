import 'dart:io';
import 'package:flutter/material.dart';
import 'package:itsm_mobile/modules/computers/views/update_page.dart';
import 'package:itsm_mobile/routes/app_pages.dart';
import 'package:itsm_mobile/security/http_overrides.dart';
import 'package:itsm_mobile/model/computer_model.dart';
import 'package:itsm_mobile/service/home_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'modules/login/views/login.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

// void main() => runApp(const MyApp());
void main() async {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'ITMS Mobile';

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: _title,
    //   routes: {
    //     '/detail-computer': (context) => DetailPage(),
    //     '/update-computer': (context) => UpdateComputer(),
    //   },
    //   // home: List(),
    //   home: Scaffold(
    //     appBar: AppBar(title: const Text(_title)),
    //     body: Login(),
    //   ),
    // );
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          // title: '',
          theme: ThemeData(
            fontFamily: 'Nunito',
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          // initialRoute: AppPages.initial,
          getPages: AppPages.pages,
          initialRoute: AppPages.initial,
        );
      },
    );
  }
}
