import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../modules/dashboard/dashboard_logic.dart';
import '../utils/Consts.dart';

class GetTopRatedMovies extends GetView<DashboardLogic> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 300,
      child: Obx(() {
        return controller.topRatedMovies.value.results != null
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        child: InkWell(
                          onTap: () async {
                            var _url = (Uri.parse(
                                "https://www.google.com/search?q=" +
                                    controller.topRatedMovies.value.results!
                                        .elementAt(index)
                                        .title));
                            if (!await launchUrl(_url,
                                mode: LaunchMode.inAppWebView)) {
                              // <--
                              throw Exception('Could not launch $_url');
                            }
                          },
                          child: Stack(
                            children: [
                              controller.topRatedMovies.value.results!
                                          .elementAt(index)
                                          .posterPath !=
                                      null
                                  ? CachedNetworkImage(
                                      imageUrl: Consts.getImageUrl +
                                          controller
                                              .topRatedMovies.value.results!
                                              .elementAt(index)
                                              .posterPath!,
                                    )
                                  : CupertinoActivityIndicator(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: controller.topRatedMovies.value.results!.length,
              )
            : CupertinoActivityIndicator();
      }),
    );
  }
}
