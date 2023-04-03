import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'home_state.dart';

class HomeLogic extends GetxController {
  var index = 0.obs;

  var controller = PageController().obs;

  changePage(input) {
    print("object");
    controller.value.jumpToPage(input);
  }


}
