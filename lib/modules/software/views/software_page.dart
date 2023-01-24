// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:itsm_mobile/model/software_model.dart';
import 'package:itsm_mobile/modules/software/controllers/software_controller.dart';
// import 'package:itsm_mobile/modules/software/views/detail.dart';
import 'package:itsm_mobile/modules/home_page/views/home_page.dart';
import 'package:itsm_mobile/service/software_service.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:itsm_mobile/routes/app_pages.dart';

class Software extends StatelessWidget {
  Software({Key? key}) : super(key: key);

  final controller = Get.find<SoftwareController>();

  Color colorPrimary = Color(0xFF79DAE8);
  FontWeight medium = FontWeight.w500;
  FontWeight semiBold = FontWeight.w600;
  FontWeight bold = FontWeight.w700;
// Border Radius
  double defaultBorderRadius = 15.0;
  // Font
  TextStyle fontNunito = const TextStyle(fontFamily: 'Nunito');

  int angka = 0;
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.toNamed(RouteName.home);
            },
            icon: Icon(
              IconlyLight.arrow_left,
              color: Colors.black,
            )),
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        // bottomOpacity: 0.0,
        elevation: 0.0,
        title: const Text(
          "Software",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: LoadingAnimationWidget.waveDots(
                  color: Colors.red,
                  size: 7.h,
                ),
              )
            :
            // Column(
            //     children: <Widget>[
            ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  var software = controller.softwares[index];

                  return GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, DetailPage.url,
                      //     arguments: computer!);
                    },
                    child: ListSoftware(software!),
                  );
                },
                itemCount: controller.softwares.length,
              ),
        //   ],
        // ),
      ),
    );
  }

  Widget ListSoftware(SoftwareModel view) {
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
                      view.name!,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: fontNunito.copyWith(
                        color: colorPrimary,
                        fontWeight: semiBold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      view.dateMod.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: fontNunito.copyWith(
                        color: colorPrimary,
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              // Flexible(
              // child:
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

              // )
            ],
          ),
        ),
      ),
    );
  }
}
