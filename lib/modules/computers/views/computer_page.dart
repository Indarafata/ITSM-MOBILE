import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:itsm_mobile/controller/location_controller.dart';
import 'package:itsm_mobile/controller/searchbar_controller.dart';
import 'package:itsm_mobile/model/computer_model.dart';
import 'package:itsm_mobile/controller/computer_controller.dart';
import 'package:itsm_mobile/modules/searcbar/views/searchbar.dart';
import 'package:itsm_mobile/widget/search_menu.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:itsm_mobile/routes/app_pages.dart';
import 'package:intl/intl.dart';

class Computer extends StatelessWidget {
  Computer({Key? key}) : super(key: key);

  final controller = Get.find<ComputerController>();
  final controllerLocation = Get.find<LocationController>();
    final controllerSearch = Get.find<SearchbarController>();
    

  Color colorPrimary = Color(0xFF79DAE8);
  FontWeight medium = FontWeight.w500;
  FontWeight semiBold = FontWeight.w600;
  FontWeight bold = FontWeight.w700;
// Border Radius
  double defaultBorderRadius = 15.0;
  // Font
  TextStyle fontNunito = const TextStyle(fontFamily: 'Nunito');
// final String searchValue;
  @override
  Widget build(BuildContext context) {
    String searchValue;
    return Scaffold(
      appBar: PreferredSize(
    preferredSize: const Size.fromHeight(100),
    child: SearchMenu(label: "Computer",),
  ),
      
      
      // EasySearchBar(
      //     title: Text('Computer'),
      //     onSearch: (value) => (searchValue = value),
      //     suggestions: controllerSearch.suggestions,
      //   ),
      // AppBar(
      //   iconTheme: IconThemeData(color: Colors.black),
      //   backgroundColor: Color(0xFF79DAE8),
      //   title: Text(
      //     'Computer',
      //     style: TextStyle(
      //         fontFamily: "Poppins",
      //         fontWeight: FontWeight.w500,
      //         color: Colors.black),
      //   ),
      //   elevation: 0.0,
      //   centerTitle: true,
      //   actions: [
      //     Container(
      //       padding: EdgeInsets.symmetric(horizontal: 16),
      //       child: IconButton(
      //         onPressed: () => Get.offAllNamed(RouteName.home),
      //         icon: Icon(Icons.home),
      //         color: Colors.black,
      //       ),
      //     ),
      //   ],
      // ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: LoadingAnimationWidget.waveDots(
                  color: Color(0xFF79DAE8),
                  size: 7.h,
                ),
              )
            :
            // Searchbar()
            // Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
                  // Flexible(
                  //   child: SearchMenu(label: "haha",),
                  // ),
                  // Expanded(
                  //   child: Container(
                  //     color: Colors.white,
                  //     width: 0,
                  //   ),
                  // ),
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      var computer = controller.computers[index];

                      return GestureDetector(
                        onTap: () {
                          // LocationController.getLocation(
                          //     computer.links[2].href.toString());
                          // LocationController.getLocation(
                          //     computer.locationsId.toString());
                          controllerLocation
                              .getLocation(computer.locationsId.toString());
                          Get.toNamed(RouteName.computer_detail,
                              arguments: computer);
                        },
                        child: ListComputer(computer),
                      );
                    },
                    itemCount: controller.computers.length,
                  ),
              //   ],
              // ),
        // DropdownButton(
        //     dropdownColor: Colors.amber,
        //     items: controllerLocation.list,
        //     onChanged: (value) {
        //       print(value);
        //     })
      ),
    );
  }

  Widget ListComputer(ComputerModel view) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: 316,
        decoration: BoxDecoration(
          color: colorPrimary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                // flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      view.name,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: fontNunito.copyWith(
                        color: Colors.black38,
                        fontWeight: semiBold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      DateFormat('dd MMM yyyy - HH:mm').format(view.dateMod!),
                      overflow: TextOverflow.ellipsis,
                      style: fontNunito.copyWith(
                        // color: colorPrimary,
                        color: Colors.black38,
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF79DAE8),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    "Detail",
                    overflow: TextOverflow.ellipsis,
                    style: fontNunito.copyWith(
                      color: Colors.white,
                      fontWeight: bold,
                      fontSize: 16,
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
