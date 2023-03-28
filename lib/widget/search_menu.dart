import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itsm_mobile/controller/searchbar_controller.dart';

class SearchMenu extends StatelessWidget {
  const SearchMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchbarController>();
    String searchValue;
    return EasySearchBar(
      backgroundColor: Color(0xFF79DAE8),
      title: const Center(
        child: Text("Computer"),
      ),
      onSearch: (value) => (searchValue = value),
      suggestions: controller.suggestions,
    );
  }
}
