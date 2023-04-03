import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:raj_s_application9/app/modules/home/home_binding.dart';
import 'package:raj_s_application9/app/modules/home/home_view.dart';
import 'package:raj_s_application9/app/routes/app_pages.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        secondaryHeaderColor: Colors.purple
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
    ));
  });
  DependencyInjection.init();
}

class DependencyInjection {
  static void init() async {
    Get.put<GetConnect>(GetConnect()); //initializing GetConnect
  }
}