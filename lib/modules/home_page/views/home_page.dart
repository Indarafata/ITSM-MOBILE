import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:itsm_mobile/modules/computers/views/computer_page.dart';
import 'package:itsm_mobile/modules/login/views/login.dart';
import 'package:itsm_mobile/routes/app_pages.dart';
import 'package:itsm_mobile/widget/menu_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'ITSM Mobile',
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.logout_sharp),
            onPressed: (() async {
              final prefs = await SharedPreferences.getInstance();
              prefs.remove("token");
              Get.offAllNamed(RouteName.login);
            }),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(52),
        children: <Widget>[
          GestureDetector(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => (Computer())));
              Get.offAllNamed(RouteName.computer);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.blue),
              height: 52,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Icon(Icons.computer_sharp),
                  SizedBox(
                    width: 50,
                  ),
                  Text("Computers"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MenuCard(
            onTap: () => Get.offAllNamed(RouteName.monitor),
            label: "Monitors",
            icon: Icons.monitor_sharp,
          ),
          SizedBox(
            height: 20,
          ),
          MenuCard(
            onTap: () => Get.offAllNamed(RouteName.software),
            label: "Software",
            icon: Icons.apps_sharp,
          ),
          SizedBox(
            height: 20,
          ),
          MenuCard(
            onTap: () => alertMessege(context),
            label: "Network devices",
            icon: Icons.network_check_sharp,
          ),
          SizedBox(
            height: 20,
          ),
          MenuCard(
            onTap: () => alertMessege(context),
            label: "Devices",
            icon: Icons.usb_sharp,
          ),
          SizedBox(
            height: 20,
          ),
          MenuCard(
            onTap: () => alertMessege(context),
            label: "Printers",
            icon: Icons.network_check_sharp,
          ),
          SizedBox(
            height: 20,
          ),
          MenuCard(
            onTap: () => alertMessege(context),
            label: "Cartridges",
            icon: Icons.network_check_sharp,
          ),
          SizedBox(
            height: 20,
          ),
          MenuCard(
            onTap: () => alertMessege(context),
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

  void alertMessege(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Coming Soon'),
        // content: const Text('AlertDialog description'),
        actions: <Widget>[
          // TextButton(
          //   onPressed: () => Navigator.pop(context, 'Cancel'),
          //   child: const Text('Cancel'),
          // ),
          Center(
            child: TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
