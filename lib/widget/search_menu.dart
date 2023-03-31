import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/controller/computer_controller.dart';
import 'package:itsm_mobile/controller/searchbar_controller.dart';

class SearchMenu extends StatelessWidget {
     SearchMenu(
      {super.key,
      required this.label,});
        final String label;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchbarController>();
    final controllerComputer = Get.find<ComputerController>();
    String searchValue;
    // return EasySearchBar(
    //   backgroundColor: Color(0xFF79DAE8),
    //   title: const Center(
    //     child: Text("Computer"),
    //   ),
    //   onSearch: (value) => (searchValue = value),
    //   suggestions: controller.suggestions,
    // );
    return Obx(() =>
     controllerComputer.GetDataisLoading.value ? EasySearchBar(
          title: Center(
          child: Text(label),),
          onSearch: (value) => (searchValue = value),
          suggestions: controllerComputer.suggestions,
        ) : 
        EasySearchBar(
          title: Center(
          child: Text(label),),
          onSearch: (value) => (searchValue = value),
          suggestions: controllerComputer.suggestions,
        ));
  }
}
