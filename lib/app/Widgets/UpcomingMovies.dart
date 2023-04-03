import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../modules/dashboard/dashboard_logic.dart';
import '../utils/Consts.dart';

class GetUpcomingMovies extends GetView<DashboardLogic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 300,
      child: Obx(() {
        return controller.upcoming.value.results != null
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () async {
                          var _url = (Uri.parse(
                              "https://www.google.com/search?q=" +
                                  controller.upcoming.value.results!
                                      .elementAt(index)
                                      .title));
                          if (!await launchUrl(_url,
                              mode: LaunchMode.inAppWebView)) {
                            // <--
                            throw Exception('Could not launch $_url');
                          }
                        },
                        child: controller.upcoming.value.results!
                                    .elementAt(index)
                                    .posterPath !=
                                null
                            ? Image.network(
                                Consts.getImageUrl +
                                    controller.upcoming.value.results!
                                        .elementAt(index)
                                        .posterPath!,
                              )
                            : CupertinoActivityIndicator(),
                      ),
                    ),
                  );
                },
                itemCount: controller.upcoming.value.results!.length,
              )
            : CupertinoActivityIndicator();
      }),
    );
  }
}
