// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:itsm_mobile/model/network_model.dart';
import 'package:itsm_mobile/modules/home/controllers/home_controllers.dart';
import 'package:itsm_mobile/modules/home/views/home_page.dart';
import 'package:itsm_mobile/routes/app_pages.dart';

class NetworkDetail extends StatelessWidget {
  NetworkDetail({super.key});
  final homeController = Get.find<HomeController>();
  final NetworkModel network = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF79DAE8),
        title: Text(
          'Network Detail',
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
                onPressed: () => Get.offAllNamed(RouteName.home),
                icon: Icon(Icons.home)),
          ),
        ],
      ),
      backgroundColor: Color(0xFF79DAE8),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            width: 310,
            height: 333,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightBlueAccent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: ListView(children: [
                    FieldDetail(
                        'Name                             :', network.comment!),
                    FieldDetail(
                        'Status                            :', network.name!),
                    FieldDetail(
                        'Model                            :', network.name!),
                    FieldDetail('Last inventory              :', network.name!),
                    FieldDetail('Networking - IP            :', network.name!),
                    FieldDetail('Serial Number              :', network.name!),
                    FieldDetail('Alternative Username :', network.name!),
                    FieldDetail(
                        'Type                               :', network.name!),
                    FieldDetail(
                        'OS - name                      :', network.name!),
                    FieldDetail(
                        'OS - version                   :', network.name!),
                  ]),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.width * 0.1,
                  margin: EdgeInsets.fromLTRB(250, 0, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(RouteName.network_update);
                    },
                    child: Text(
                      'Update',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.green,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // padding: const EdgeInsets.only(left: 20, top: 10),
                  alignment: Alignment.topCenter,
                  child: GestureDetector(
                      onHorizontalDragDown: (DragDownDetails) {
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.width * 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    height: MediaQuery.of(context).size.width *
                                        0.25,
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF79DAE8),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30))),
                                    child: Text(
                                      'History',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),
                                  ),
                                  GestureDetector(
                                      onHorizontalDragDown: (DragDownDetails) {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                          color: Colors.white,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1,
                                          child:
                                              Icon(IconlyLight.arrow_down_2))),
                                  Container(
                                    height: 50,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      physics: NeverScrollableScrollPhysics(),
                                      children: <Widget>[
                                        Container(
                                          width: 55,
                                          child: const Center(
                                              child: Text(
                                            'ID',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 15,
                                                color: Colors.blue),
                                          )),
                                        ),
                                        Container(
                                          width: 75,
                                          child: const Center(
                                              child: Text(
                                            'Date',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 15,
                                                color: Colors.blue),
                                          )),
                                        ),
                                        Container(
                                          width: 75,
                                          child: const Center(
                                              child: Text(
                                            'User',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 15,
                                                color: Colors.blue),
                                          )),
                                        ),
                                        Container(
                                          width: 75,
                                          child: const Center(
                                              child: Text(
                                            'Field',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 15,
                                                color: Colors.blue),
                                          )),
                                        ),
                                        Container(
                                          width: 75,
                                          child: const Center(
                                              child: Text(
                                            'Update',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 15,
                                                color: Colors.blue),
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return Table(
                                          border: TableBorder.all(
                                              width:
                                                  0.5), // Allows to add a border decoration around your table
                                          children: [
                                            TableRow(children: [
                                              Text(network.name!),
                                              Text(network.name!),
                                              Text(network.name!),
                                              Text(network.name!),
                                              Text(network.name!),
                                            ]),
                                          ]);
                                    },
                                    itemCount: 10,
                                  )
                                      // ),
                                      ),
                                ],
                              ),
                              // ),
                            );
                          },
                        );
                      },
                      child: Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width * 1,
                          child: Icon(IconlyLight.arrow_up_2))),
                ),
                Container(
                  // alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    children: [
                      Text(
                        'History',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Container(
                        width: 55,
                        child: const Center(
                            child: Text(
                          'ID',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: Colors.blue),
                        )),
                      ),
                      Container(
                        width: 75,
                        child: const Center(
                            child: Text(
                          'Date',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: Colors.blue),
                        )),
                      ),
                      Container(
                        width: 75,
                        child: const Center(
                            child: Text(
                          'User',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: Colors.blue),
                        )),
                      ),
                      Container(
                        width: 75,
                        child: const Center(
                            child: Text(
                          'Field',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: Colors.blue),
                        )),
                      ),
                      Container(
                        width: 75,
                        child: const Center(
                            child: Text(
                          'Update',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: Colors.blue),
                        )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Table(
                          border: TableBorder.all(
                              width:
                                  0.5), // Allows to add a border decoration around your table
                          children: [
                            TableRow(children: [
                              Text(network.name!),
                              Text(network.name!),
                              Text(network.name!),
                              Text(network.name!),
                              Text(network.name!),
                            ]),
                          ]);
                    },
                    itemCount: 10,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container FieldDetail(String label, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(label),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            child: Flexible(
              child: Text(
                value,
                softWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
