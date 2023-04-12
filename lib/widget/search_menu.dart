// import 'package:easy_search_bar/easy_search_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:itsm_mobile/controller/computer_controller.dart';
// import 'package:itsm_mobile/controller/searchbar_controller.dart';

// class SearchMenu extends StatefulWidget {
//   const SearchMenu({super.key});

//   @override
//   State<SearchMenu> createState() => _SearchMenuState();
// }

// class _SearchMenuState extends State<SearchMenu> {
//   TextEditingController editingController = TextEditingController();

//   final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
//   List<String> items = [];
//   final computerController = Get.find<ComputerController>();
// // class SearchMenu extends StatelessWidget {
// //   SearchMenu({
// //     super.key,
// //     required this.label,
// //   });
//   // final String label;

//   // void filterSearchResults(String query) {
//   //   List<String> dummySearchList = [];
//   //   dummySearchList.addAll(duplicateItems);
//   //   if (query.isNotEmpty) {
//   //     List<String> dummyListData = [];
//   //     dummySearchList.forEach((item) {
//   //       if (item.contains(query)) {
//   //         dummyListData.add(item);
//   //       }
//   //     });
//   //     setState(() {
//   //       items.clear();
//   //       items.addAll(dummyListData);
//   //     });
//   //     return;
//   //   } else {
//   //     setState(() {
//   //       items.clear();
//   //       items.addAll(duplicateItems);
//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<SearchbarController>();
//     final controllerComputer = Get.find<ComputerController>();
//     String searchValue;
//     // return EasySearchBar(
//     //   backgroundColor: Color(0xFF79DAE8),
//     //   title: const Center(
//     //     child: Text("Computer"),
//     //   ),
//     //   onSearch: (value) => (searchValue = value),
//     //   suggestions: controller.suggestions,
//     // );
//     return
//         // Obx(
//         //   () =>
//         //  controllerComputer.GetDataisLoading.value
//         //  ?
//         //  EasySearchBar(
//         //       title: Center(
//         //       child: Text(label),),
//         //       onSearch: (value) => (searchValue = value),
//         //       suggestions: controllerComputer.suggestions,
//         //     ),
//         // :
//         // EasySearchBar(
//         //   title: Center(
//         //   child: Text(label),),
//         //   onSearch: (value) => (searchValue = value),
//         //   suggestions: controllerComputer.suggestions,
//         // )

//         //batasss
//         Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextField(
//         onChanged: (value) {
//           computerController.filterSearchResults(value);
//         },
//         controller: editingController,
//         decoration: InputDecoration(
//             hintText: "Search",
//             prefixIcon: Icon(Icons.search),
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(25.0)))),
//       ),
//       // ),
//     );
//   }
// }

import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/controller/computer_controller.dart';
import 'package:itsm_mobile/controller/searchbar_controller.dart';

class SearchMenu extends StatefulWidget {
  SearchMenu(
      {super.key, required this.controller, required this.dataDuplicate3});

  var controller;
  var dataDuplicate3;

  @override
  State<SearchMenu> createState() =>
      _SearchMenuState(controller: controller, dataDuplicate3: dataDuplicate3);
}

class _SearchMenuState extends State<SearchMenu> {
  _SearchMenuState({required this.controller, required this.dataDuplicate3});
  var controller;
  var dataDuplicate3;
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controllerSearch = Get.find<SearchbarController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          controllerSearch.filterSearchResults(
              value, controller, dataDuplicate3);
        },
        controller: editingController,
        decoration: InputDecoration(
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
      ),
    );
  }
}
