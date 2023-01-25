import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:itsm_mobile/modules/computers/views/computer_page.dart';
import 'package:itsm_mobile/modules/home_page/controllers/home_controllers.dart';
import 'package:itsm_mobile/modules/login/views/login.dart';
import 'package:itsm_mobile/routes/app_pages.dart';
import 'package:itsm_mobile/widget/menu_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF79DAE8),
        title: Text(
          'ITSM Mobile',
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: [
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.logout_sharp),
            onPressed: (() async {
              final prefs = await SharedPreferences.getInstance();
              prefs.remove("token");
              Get.offAllNamed(RouteName.login);
            }),
          )
        ],
      ),
      body: ListView(
        padding:
            const EdgeInsets.only(top: 20, bottom: 52, right: 52, left: 52),
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          MenuCard(
            onTap: () => Get.toNamed(RouteName.computer),
            label: "Computers",
            icon: Icons.monitor_sharp,
          ),
          SizedBox(
            height: 20,
          ),
          MenuCard(
            onTap: () => Get.toNamed(RouteName.monitor),
            label: "Monitors",
            icon: Icons.monitor_sharp,
          ),
          SizedBox(
            height: 20,
          ),
          MenuCard(
            onTap: () => Get.toNamed(RouteName.software),
            label: "Software",
            icon: Icons.apps_sharp,
          ),
          SizedBox(
            height: 20,
          ),
          MenuCard(
            onTap: () => controller.alertMessege(context),
            label: "Network devices",
            icon: Icons.network_check_sharp,
          ),
          SizedBox(
            height: 20,
          ),
          MenuCard(
            onTap: () => controller.alertMessege(context),
            label: "Devices",
            icon: Icons.usb_sharp,
          ),
          SizedBox(
            height: 20,
          ),
          MenuCard(
            onTap: () => controller.alertMessege(context),
            label: "Printers",
            icon: Icons.network_check_sharp,
          ),
          SizedBox(
            height: 20,
          ),
          MenuCard(
            onTap: () => controller.alertMessege(context),
            label: "Cartridges",
            icon: Icons.network_check_sharp,
          ),
          SizedBox(
            height: 20,
          ),
          MenuCard(
            onTap: () => controller.alertMessege(context),
            label: "Consumables",
            icon: Icons.square_sharp,
          ),
          SizedBox(
            height: 20,
          ),
          MenuCard(
            onTap: () => Get.toNamed(RouteName.phone),
            label: "Phones",
            icon: Icons.phone,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
