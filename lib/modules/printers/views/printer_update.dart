import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/controller/location_controller.dart';
import 'package:itsm_mobile/controller/printer_controller.dart';
import 'package:itsm_mobile/model/printer_model.dart';
import 'package:itsm_mobile/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UpdatePrinter extends StatelessWidget {
//   @override
//   State<UpdatePrinter> createState() => _HomepageState();
// }

// class _HomepageState extends State<UpdatePrinter> {
  var name = TextEditingController();
  final controller = Get.find<PrinterController>();
  final controllerLocation = Get.find<LocationController>();
  PrinterModel printer = Get.arguments;
  // AddTaskView({super.key});
// Colors
  Color colorPrimary = Color(0xFF79DAE8);
  Color colorBlack = Color(0xFF4F4F4F);
// Font
  TextStyle fontNunito = TextStyle(fontFamily: 'Nunito');
// Font Weight
  FontWeight semiBold = FontWeight.w600;
  FontWeight bold = FontWeight.w700;
// Padding
  double defaultPadding = 20.0;

  bool inisialisasi = false;

  @override
  Widget build(BuildContext context) {
    controller.name.text = printer.name!;
    controller.selectedLocation = printer.locationsId.toString();
    if (printer.comment == null) {
      controller.comment.text = "";
    } else {
      controller.comment.text = printer.comment!;
    }
    return Scaffold(
      appBar: AppBar(
        //
        backgroundColor: Color(0xFF79DAE8),
        title: Text(
          'Update Printer',
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
          Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            //       "Update Printer",
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
            Text(
              "Name",
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            TextField(
              // obscureText: true,
              enabled: false,
              decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock)),
              controller: controller.name,
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
            //   controller: name,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            DropdownButtonHideUnderline(
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
            Text(
              "Comment",
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            TextField(
              // obscureText: true,
              decoration: InputDecoration(
                hintText: "Comment",
                border: OutlineInputBorder(),
              ),
              controller: controller.comment,
            ),
            SizedBox(
              height: 10,
            ),
            // Text(
            //   "Technician in charger of the hardware",
            //   style: TextStyle(fontSize: 15, color: Colors.black54),
            // ),
            // TextField(
            //   // obscureText: true,
            //   decoration: InputDecoration(
            //     hintText: "Technician in charger of the hardware",
            //     border: OutlineInputBorder(),
            //   ),
            //   controller: name,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
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
            //   height: 10,
            // ),
            GestureDetector(
              onTap: () => controller.updatePrinter(printer.id!),
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
    );
  }
}
