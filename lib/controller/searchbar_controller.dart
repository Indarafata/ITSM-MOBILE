import 'package:get/get.dart';

class SearchbarController extends GetxController {
  void filterSearchResults(String searchVal, var controller, var temp) {
    if (searchVal.isNotEmpty) {
      controller.searchResult.clear();
      temp.forEach((item) {
        if (item.name.toLowerCase().contains(searchVal.toLowerCase())) {
          controller.addSearchResult(item);
        }
      });
      controller.addAllSearchResult(controller.searchResult);
    } else {
      // controller.data.clear();
      controller.addAllSearchResult(controller.duplicateData);
      // controller.data.addAllSearchResult(temp);
    }
  }
}
