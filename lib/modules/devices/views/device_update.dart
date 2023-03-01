import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/controller/location_controller.dart';
import 'package:itsm_mobile/model/device_model.dart';
import 'package:itsm_mobile/controller/device_controller.dart';
import 'package:itsm_mobile/modules/devices/views/device_view.dart';
import 'package:itsm_mobile/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UpdateDevice extends StatelessWidget {
//   @override
//   State<UpdateDevice> createState() => _HomepageState();
// }

// class _HomepageState extends State<UpdateDevice> {
  // var name = TextEditingController();
  Color colorPrimary = Color(0xFF79DAE8);
  Color colorBlack = Color(0xFF4F4F4F);
// Font
  TextStyle fontNunito = TextStyle(fontFamily: 'Nunito');
// Font Weight
  FontWeight semiBold = FontWeight.w600;
  FontWeight bold = FontWeight.w700;
// Padding
  double defaultPadding = 20.0;
  final controller = Get.find<DeviceController>();
  final controllerLocation = Get.find<LocationController>();
  DeviceModel device = Get.arguments;

  Widget build(BuildContext context) {
    controller.name.text = device.name;
    controller.selectedLocation = device.locationsId.toString();
    controller.comment.text = device.comment!;
    return Scaffold(
      appBar: AppBar(
        //
        backgroundColor: Color(0xFF79DAE8),
        title: Text(
          'Update Device',
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
      body:
          // SingleChildScrollView(
          //   child: Padding(
          //     padding: EdgeInsets.only(
          //       right: defaultPadding,
          //       left: defaultPadding,
          //       top: 6,
          //     ),
          //     child:
          Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     IconButton(
            //       onPressed: () {
            //         // controller.clearInput();
            //         // Get.back();
            //       },
            //       icon: Icon(
            //         Icons.arrow_back_ios_rounded,
            //         color: colorBlack,
            //       ),
            //     ),
            //     Text(
            //       "Update Device",
            //       style: fontNunito.copyWith(
            //         color: colorBlack,
            //         fontWeight: semiBold,
            //         fontSize: 20,
            //       ),
            //     ),
            //     SizedBox(
            //       width: 4,
            //     )
            //   ],
            // ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 95.w,
              child: Text(
                "Name",
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
            Container(
              width: 95.w,
              child: TextField(
                // obscureText: true,
                enabled: false,
                decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock)),
                controller: controller.name,
              ),
            ),
            Container(
              width: 95.w,
              child: Text(
                "Location",
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
            // TextField(
            //   // obscureText: true,
            //   decoration: InputDecoration(
            //     hintText: "Location",
            //     border: OutlineInputBorder(),
            //   ),
            //   controller: controller.locationId,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            Container(
              width: 90.w,
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                  hint: Text(
                    controllerLocation.dataLocation!.name,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: controllerLocation.list,
                  value: controller.selectedLocation,
                  onChanged: (value) {
                    // (() {

                    controller.selectedLocation = value as String;
                    print(controller.selectedLocation);
                    // });
                  },
                ),
              ),
            ),
            Container(
              width: 95.w,
              child: Text(
                "Comment",
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
            Container(
              width: 95.w,
              child: TextField(
                // obscureText: true,
                decoration: InputDecoration(
                  hintText: "Comment",
                  border: OutlineInputBorder(),
                ),
                controller: controller.comment,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Text(
            //   "Group in charge of the hardware",
            //   style: TextStyle(fontSize: 15, color: Colors.black54),
            // ),
            // TextField(
            //   // obscureText: true,
            //   decoration: InputDecoration(
            //     hintText: "Group in charge of the hardware",
            //     border: OutlineInputBorder(),
            //   ),
            //   controller: name,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   "Alternate Username",
            //   style: TextStyle(fontSize: 15, color: Colors.black54),
            // ),
            // TextField(
            //   // obscureText: true,
            //   decoration: InputDecoration(
            //     hintText: "Alternate Username",
            //     border: OutlineInputBorder(),
            //   ),
            //   controller: name,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   "User",
            //   style: TextStyle(fontSize: 15, color: Colors.black54),
            // ),
            // TextField(
            //   // obscureText: true,
            //   decoration: InputDecoration(
            //     hintText: "User",
            //     border: OutlineInputBorder(),
            //   ),
            //   controller: name,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   "Group",
            //   style: TextStyle(fontSize: 15, color: Colors.black54),
            // ),
            // TextField(
            //   // obscureText: true,
            //   decoration: InputDecoration(
            //     hintText: "Group",
            //     border: OutlineInputBorder(),
            //   ),
            //   controller: name,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   "Comments",
            //   style: TextStyle(fontSize: 15, color: Colors.black54),
            // ),
            // TextField(
            //   // obscureText: true,
            //   decoration: InputDecoration(
            //     hintText: "Comments",
            //     border: OutlineInputBorder(),
            //   ),
            //   controller: name,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   "Status",
            //   style: TextStyle(fontSize: 15, color: Colors.black54),
            // ),
            // TextField(
            //   // obscureText: true,
            //   decoration: InputDecoration(
            //     hintText: "Status",
            //     border: OutlineInputBorder(),
            //   ),
            //   controller: name,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   "Type",
            //   style: TextStyle(fontSize: 15, color: Colors.black54),
            // ),
            // TextField(
            //   // obscureText: true,
            //   decoration: InputDecoration(
            //     hintText: "Type",
            //     border: OutlineInputBorder(),
            //   ),
            //   controller: name,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   "Manufacturer",
            //   style: TextStyle(fontSize: 15, color: Colors.black54),
            // ),
            // TextField(
            //   // obscureText: true,
            //   decoration: InputDecoration(
            //     hintText: "Manufacturer",
            //     border: OutlineInputBorder(),
            //   ),
            //   controller: name,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   "Model",
            //   style: TextStyle(fontSize: 15, color: Colors.black54),
            // ),
            // TextField(
            //   // obscureText: true,
            //   decoration: InputDecoration(
            //     hintText: "Model",
            //     border: OutlineInputBorder(),
            //   ),
            //   controller: name,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   "Serrial number",
            //   style: TextStyle(fontSize: 15, color: Colors.black54),
            // ),
            // TextField(
            //   // obscureText: true,
            //   decoration: InputDecoration(
            //     hintText: "Serrial number",
            //     border: OutlineInputBorder(),
            //   ),
            //   controller: name,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   "Inventory number",
            //   style: TextStyle(fontSize: 15, color: Colors.black54),
            // ),
            // TextField(
            //   // obscureText: true,
            //   decoration: InputDecoration(
            //     hintText: "Inventory number",
            //     border: OutlineInputBorder(),
            //   ),
            //   controller: name,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   "Network",
            //   style: TextStyle(fontSize: 15, color: Colors.black54),
            // ),
            // TextField(
            //   // obscureText: true,
            //   decoration: InputDecoration(
            //     hintText: "Network",
            //     border: OutlineInputBorder(),
            //   ),
            //   controller: name,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   "UUID",
            //   style: TextStyle(fontSize: 15, color: Colors.black54),
            // ),
            // TextField(
            //   // obscureText: true,
            //   decoration: InputDecoration(
            //     hintText: "UUID",
            //     border: OutlineInputBorder(),
            //   ),
            //   controller: name,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   "Update Source",
            //   style: TextStyle(fontSize: 15, color: Colors.black54),
            // ),
            // TextField(
            //   // obscureText: true,
            //   decoration: InputDecoration(
            //     hintText: "Update Source",
            //     border: OutlineInputBorder(),
            //   ),
            //   controller: name,
            // ),
            // SizedBox(
            // height: 10,
            // ),
            GestureDetector(
              onTap: () => controller.updateDevice(device.id!),
              child: Container(
                margin: EdgeInsets.only(left: 255),
                decoration: BoxDecoration(
                  color: colorPrimary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    "Save",
                    overflow: TextOverflow.ellipsis,
                    style: fontNunito.copyWith(
                      color: Colors.white,
                      fontWeight: bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      //   ),
      // ),
    );
  }
}
