import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/controller/location_controller.dart';
import 'package:itsm_mobile/model/computer_model.dart';
import 'package:itsm_mobile/controller/computer_controller.dart';
import 'package:itsm_mobile/routes/app_pages.dart';

class UpdateComputer extends StatefulWidget {
  @override
  State<UpdateComputer> createState() => _HomepageState();
}

class _HomepageState extends State<UpdateComputer> {
  final controller = Get.find<ComputerController>();
  final controllerLocation = Get.find<LocationController>();
  // AddTaskView({super.key});
// Colors
  Color colorPrimary = Color(0xFF79DAE8);
  Color colorBlack = Color(0xFF4F4F4F);
// Font
  TextStyle fontNunito = TextStyle(fontFamily: 'Nunito');
// Font Weight
  FontWeight semiBold = FontWeight.w600;
  FontWeight bold = FontWeight.w700;

  ComputerModel computer = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.name.text = computer.name;
    controller.selectedLocation = computer.locationsId.toString();
    controller.comment.text = computer.comment!;
    // controller.locationId.text = controller.dataLocation!.name;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF79DAE8),
        title: Text(
          'Update Computer',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: 20.0,
            left: 20.0,
            top: 6,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Text(
                "Location",
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
              // TextField(
              //   // obscureText: true,
              //   decoration: InputDecoration(
              //     hintText: "Location id",
              //     border: OutlineInputBorder(),
              //   ),
              //   controller: controller.locationId,
              // ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                    iconSize: 30,
                    borderRadius: BorderRadius.circular(20)
                        .copyWith(topLeft: Radius.circular(0)),
                    isExpanded: true,
                    hint: Text(controllerLocation.dataLocation!.name,
                        style: TextStyle(fontSize: 15)),
                    value: controller.selectedLocation,
                    items: controllerLocation.list,
                    onChanged: (val) {
                      // print("hj");
                      // print(computer.comment!);
                      setState(() {
                        controller.selectedLocation = val.toString();
                      });
                    }),
              ),
              // SizedBox(
              //   height: 10,
              // ),
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
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () => controller.updateComputer(computer.id!),
                child: Container(
                  margin: EdgeInsets.only(left: 255),
                  decoration: BoxDecoration(
                    color: colorPrimary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
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
      ),
    );
  }
}
