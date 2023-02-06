import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:itsm_mobile/model/computer_model.dart';
import 'package:itsm_mobile/modules/computers/controllers/computer_controllers.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:itsm_mobile/routes/app_pages.dart';
import 'package:intl/intl.dart';

class Computer extends StatelessWidget {
  Computer({Key? key}) : super(key: key);

  final controller = Get.find<ComputerController>();

  Color colorPrimary = Color(0xFF79DAE8);
  FontWeight medium = FontWeight.w500;
  FontWeight semiBold = FontWeight.w600;
  FontWeight bold = FontWeight.w700;
// Border Radius
  double defaultBorderRadius = 15.0;
  // Font
  TextStyle fontNunito = const TextStyle(fontFamily: 'Nunito');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF79DAE8),
        title: Text(
          'Computer',
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
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: LoadingAnimationWidget.waveDots(
                  color: Color(0xFF79DAE8),
                  size: 7.h,
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  var computer = controller.computers[index];

                  return GestureDetector(
                    onTap: () {
                      controller.getLocation(computer.links[2].href.toString());
                      Get.toNamed(RouteName.computer_detail,
                          arguments: computer);
                    },
                    child: ListComputer(computer),
                  );
                },
                itemCount: controller.computers.length,
              ),
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
