import 'package:raj_s_application9/app/modules/home/home_binding.dart';

import 'package:get/get.dart';

import '../modules/home/home_view.dart';
part './app_routes.dart';
/**
 * GetX Generator - fb.com/htngu.99
 * */

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}