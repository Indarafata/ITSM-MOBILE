// import '//';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:itsm_mobile/controller/location_controller.dart';
import 'package:itsm_mobile/controller/pdu_controller.dart';
import 'package:itsm_mobile/model/pdu_model.dart';
import 'package:itsm_mobile/controller/home_controller.dart';
import 'package:itsm_mobile/modules/home/views/home_page.dart';
import 'package:itsm_mobile/routes/app_pages.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PduDetail extends StatelessWidget {
  PduDetail({super.key});
  final homeController = Get.find<HomeController>();
  final controllerLocation = Get.find<LocationController>();
  final controller = Get.find<PduController>();
  final PduModel pdu = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFF79DAE8),
        title: Text(
          'Pdu Detail',
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              onPressed: () => Get.offAllNamed(RouteName.home),
              icon: Icon(Icons.home),
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Obx(
        () => controllerLocation.isLoading.value
            ? Center(
                child: LoadingAnimationWidget.waveDots(
                  color: Color(0xFF79DAE8),
                  size: 7.h,
                ),
              )
            : ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    width: 310,
                    height: 333,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFE0F3F7),
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
                                'Name                             ', pdu.name),
                            FieldDetail(
                                'Status                            ', pdu.name),
                            FieldDetail('Location                            ',
                                controllerLocation.dataLocation!.name),
                            FieldDetail('comment              ', pdu.comment!),
                            FieldDetail(
                                'Networking - IP            ', pdu.name!),
                            FieldDetail(
                                'Serial Number              ', pdu.name!),
                            FieldDetail('Alternative Username! ', pdu.name!),
                            FieldDetail('Type                               ',
                                pdu.name!),
                            FieldDetail(
                                'OS - name!                      ', pdu.name!),
                            FieldDetail(
                                'OS - version                   ', pdu.name!),
                          ]),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.width * 0.1,
                          margin: EdgeInsets.fromLTRB(250, 0, 0, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(RouteName.pdus_update,
                                  arguments: pdu);
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
                  // Container(
                  //   // color: Colors.green,
                  //   height: MediaQuery.of(context).size.height,
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Container(
                  //         // padding: const EdgeInsets.only(left: 20, top: 10),
                  //         alignment: Alignment.topCenter,
                  //         child: GestureDetector(
                  //             onHorizontalDragDown: (DragDownDetails) {
                  //               showModalBottomSheet<void>(
                  //                 isScrollControlled: true,
                  //                 context: context,
                  //                 builder: (BuildContext context) {
                  //                   return SizedBox(
                  //                     height:
                  //                         MediaQuery.of(context).size.width * 3,
                  //                     child: Column(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.start,
                  //                       children: <Widget>[
                  //                         Container(
                  //                           alignment: Alignment.bottomCenter,
                  //                           height: MediaQuery.of(context)
                  //                                   .size
                  //                                   .width *
                  //                               0.25,
                  //                           width: MediaQuery.of(context)
                  //                                   .size
                  //                                   .width *
                  //                               1,
                  //                           decoration: BoxDecoration(
                  //                               color: Color(0xFF79DAE8),
                  //                               borderRadius: BorderRadius.only(
                  //                                   bottomLeft:
                  //                                       Radius.circular(30),
                  //                                   bottomRight:
                  //                                       Radius.circular(30))),
                  //                           child: Text(
                  //                             'History',
                  //                             style: TextStyle(
                  //                                 fontFamily: 'Poppins',
                  //                                 fontWeight: FontWeight.w500,
                  //                                 fontSize: 20),
                  //                           ),
                  //                         ),
                  //                         GestureDetector(
                  //                             onHorizontalDragDown:
                  //                                 (DragDownDetails) {
                  //                               Navigator.pop(context);
                  //                             },
                  //                             child: Container(
                  //                                 color: Colors.white,
                  //                                 width: MediaQuery.of(context)
                  //                                         .size
                  //                                         .width *
                  //                                     1,
                  //                                 child: Icon(IconlyLight
                  //                                     .arrow_down_2))),
                  //                         Container(
                  //                           height: 50,
                  //                           child: ListView(
                  //                             scrollDirection: Axis.horizontal,
                  //                             physics:
                  //                                 NeverScrollableScrollPhysics(),
                  //                             children: <Widget>[
                  //                               Container(
                  //                                 width: 55,
                  //                                 child: const Center(
                  //                                     child: Text(
                  //                                   'ID',
                  //                                   style: TextStyle(
                  //                                       fontFamily: 'Poppins',
                  //                                       fontSize: 15,
                  //                                       color: Colors.blue),
                  //                                 )),
                  //                               ),
                  //                               Container(
                  //                                 width: 75,
                  //                                 child: const Center(
                  //                                     child: Text(
                  //                                   'Date',
                  //                                   style: TextStyle(
                  //                                       fontFamily: 'Poppins',
                  //                                       fontSize: 15,
                  //                                       color: Colors.blue),
                  //                                 )),
                  //                               ),
                  //                               Container(
                  //                                 width: 75,
                  //                                 child: const Center(
                  //                                     child: Text(
                  //                                   'User',
                  //                                   style: TextStyle(
                  //                                       fontFamily: 'Poppins',
                  //                                       fontSize: 15,
                  //                                       color: Colors.blue),
                  //                                 )),
                  //                               ),
                  //                               Container(
                  //                                 width: 75,
                  //                                 child: const Center(
                  //                                     child: Text(
                  //                                   'Field',
                  //                                   style: TextStyle(
                  //                                       fontFamily: 'Poppins',
                  //                                       fontSize: 15,
                  //                                       color: Colors.blue),
                  //                                 )),
                  //                               ),
                  //                               Container(
                  //                                 width: 75,
                  //                                 child: const Center(
                  //                                     child: Text(
                  //                                   'Update',
                  //                                   style: TextStyle(
                  //                                       fontFamily: 'Poppins',
                  //                                       fontSize: 15,
                  //                                       color: Colors.blue),
                  //                                 )),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ),
                  //                         // Expanded(
                  //                         //     child: ListView.builder(
                  //                         //   physics: const BouncingScrollPhysics(),
                  //                         //   shrinkWrap: true,
                  //                         //   scrollDirection: Axis.vertical,
                  //                         //   itemBuilder: (context, index) {
                  //                         //     // return Table(
                  //                         //     //     border: TableBorder.all(
                  //                         //     //         width:
                  //                         //     //             0.5), // Allows to add a border decoration around your table
                  //                         //     //     children: [
                  //                         //     //       TableRow(children: [
                  //                         //     //         Text(pdu.links[index].href),
                  //                         //     //         Text(pdu.links[index].href),
                  //                         //     //         Text(pdu.links[index].href),
                  //                         //     //         Text(pdu.links[index].href),
                  //                         //     //         Text(pdu.links[index].href),
                  //                         //     //       ]),
                  //                         //     //     ]);
                  //                         //   },
                  //                         //   // itemCount: pdu.links.length,
                  //                         // )
                  //                         //     // ),
                  //                         //     ),
                  //                       ],
                  //                     ),
                  //                     // ),
                  //                   );
                  //                 },
                  //               );
                  //             },
                  //             child: Container(
                  //                 color: Colors.white,
                  //                 width: MediaQuery.of(context).size.width * 1,
                  //                 child: Icon(IconlyLight.arrow_up_2))),
                  //       ),
                  //       Container(
                  //         // alignment: Alignment.centerLeft,
                  //         padding: const EdgeInsets.only(left: 20, top: 10),
                  //         child: Row(
                  //           children: [
                  //             Text(
                  //               'History',
                  //               style: TextStyle(
                  //                   fontFamily: 'Poppins',
                  //                   fontWeight: FontWeight.w500,
                  //                   fontSize: 20),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Container(
                  //         height: 50,
                  //         child: ListView(
                  //           scrollDirection: Axis.horizontal,
                  //           physics: NeverScrollableScrollPhysics(),
                  //           children: <Widget>[
                  //             Container(
                  //               width: 55,
                  //               child: const Center(
                  //                   child: Text(
                  //                 'ID',
                  //                 style: TextStyle(
                  //                     fontFamily: 'Poppins',
                  //                     fontSize: 15,
                  //                     color: Colors.blue),
                  //               )),
                  //             ),
                  //             Container(
                  //               width: 75,
                  //               child: const Center(
                  //                   child: Text(
                  //                 'Date',
                  //                 style: TextStyle(
                  //                     fontFamily: 'Poppins',
                  //                     fontSize: 15,
                  //                     color: Colors.blue),
                  //               )),
                  //             ),
                  //             Container(
                  //               width: 75,
                  //               child: const Center(
                  //                   child: Text(
                  //                 'User',
                  //                 style: TextStyle(
                  //                     fontFamily: 'Poppins',
                  //                     fontSize: 15,
                  //                     color: Colors.blue),
                  //               )),
                  //             ),
                  //             Container(
                  //               width: 75,
                  //               child: const Center(
                  //                   child: Text(
                  //                 'Field',
                  //                 style: TextStyle(
                  //                     fontFamily: 'Poppins',
                  //                     fontSize: 15,
                  //                     color: Colors.blue),
                  //               )),
                  //             ),
                  //             Container(
                  //               width: 75,
                  //               child: const Center(
                  //                   child: Text(
                  //                 'Update',
                  //                 style: TextStyle(
                  //                     fontFamily: 'Poppins',
                  //                     fontSize: 15,
                  //                     color: Colors.blue),
                  //               )),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       // Expanded(
                  //       //   child: ListView.builder(
                  //       //     physics: const BouncingScrollPhysics(),
                  //       //     shrinkWrap: true,
                  //       //     scrollDirection: Axis.vertical,
                  //       //     itemBuilder: (context, index) {
                  //       //       // return Table(
                  //       //       //     border: TableBorder.all(
                  //       //       //         width:
                  //       //       //             0.5), // Allows to add a border decoration around your table
                  //       //       //     children: [
                  //       //       //       TableRow(children: [
                  //       //       //         Text(pdu.links[index].href),
                  //       //       //         Text(pdu.links[index].href),
                  //       //       //         Text(pdu.links[index].href),
                  //       //       //         Text(pdu.links[index].href),
                  //       //       //         Text(pdu.links[index].href),
                  //       //       //       ]),
                  //       //       //     ]);
                  //       //     },
                  //       //     // itemCount: pdu.links.length,
                  //       //   ),
                  //       // )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
      ),
    );
  }

  Container FieldDetail(String label, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(label),
          ),
          Text(":\t\t"),
          Expanded(
            flex: 5, // 20%
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
