import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raj_s_application9/app/models/SearchRequest.dart';

import '../../data/repository/MovieProvider.dart';
import 'search_state.dart';

class SearchLogic extends GetxController {
  final SearchState state = SearchState();
  var searchresults = SearchRequest().obs;
  @override
  void onInit() {
    super.onInit();
    setControllerRequest();
  }
  var controller = TextEditingController();
  var query = "";

  void setControllerRequest() {
    controller.addListener(() async {
        print("Listning request");
          searchresults.value = await MovieProvider().getSearchResults(controller.text);
          update();
      });
  }

}
