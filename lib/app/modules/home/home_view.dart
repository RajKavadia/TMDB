import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raj_s_application9/app/modules/bookmarked/bookmarked_view.dart';
import 'package:raj_s_application9/app/modules/dashboard/dashboard_view.dart';
import 'package:raj_s_application9/app/modules/search/search_view.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeLogic());
    return Scaffold(
      backgroundColor: Colors.black54,

      body: Container(
        child: Stack(
          children: [
            PageView(
              children: [
                DashboardPage(),
                SearchPage(),
                BookmarkedPage(),
              ],
              controller: c.controller.value,
              pageSnapping: false,
              physics: NeverScrollableScrollPhysics(),

            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() {
        return CustomNavigationBar(
          scaleFactor: 0.4,
          elevation: 10,
          backgroundColor: Colors.deepPurpleAccent,
          bubbleCurve: Curves.linear,
          borderRadius: Radius.circular(20),
          isFloating: true,
          onTap: (index) {
            c.changePage(index);
            c.index.value = index;
          },
          selectedColor: Colors.white,
          unSelectedColor: Colors.black54,
          currentIndex: c.index.value,
          items: [
            CustomNavigationBarItem(
              icon: Icon(Icons.home),
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.search),
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.bookmark),
            ),
          ],
        );
      }),
    );
  }
}
