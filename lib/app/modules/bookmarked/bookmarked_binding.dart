import 'package:get/get.dart';

import 'bookmarked_logic.dart';

class BookmarkedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookmarkedLogic());
  }
}
