import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raj_s_application9/app/data/repository/MovieProvider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dashboard_logic.dart';

class DashboardPage extends StatelessWidget {
  var startmargin = const EdgeInsets.only(left: 10);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(DashboardLogic());
    return SafeArea(
      child: Container(
        color: Colors.black54,
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Top Treanding Movies",
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 300,
                      child: Obx(() {
                        return logic.topRatedMovies.value.results!=null?ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: InkWell(
                                  child: InkWell(
                                    onTap: () async {
                                      var _url = (Uri.parse("https://www.google.com/search?q="+logic.topRatedMovies.value.results!.elementAt(index).title));
                                      if (!await launchUrl(_url, mode: LaunchMode.inAppWebView)) { // <--
                                        throw Exception('Could not launch $_url');
                                      }
                                    },
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          Consts.getImageUrl +
                                              logic.topRatedMovies.value.results!
                                                  .elementAt(index)
                                                  .posterPath!,
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: logic.topRatedMovies.value.results!.length,
                        ):CupertinoActivityIndicator();
                      }),
                    )
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Top Populer Movies",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 300,
                  child: Obx(() {
                    return logic.populerMovies.value.results!=null?ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () async {
                                var _url = (Uri.parse("https://www.google.com/search?q="+logic.populerMovies.value.results!.elementAt(index).name));
                                if (!await launchUrl(_url, mode: LaunchMode.inAppWebView)) { // <--
                                throw Exception('Could not launch $_url');
                                }
                              },
                              child: Image.network(
                                Consts.getImageUrl +
                                    logic.populerMovies.value.results!
                                        .elementAt(index)
                                        .posterPath!,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: logic.populerMovies.value.results!.length,
                    ):CupertinoActivityIndicator();
                  }),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Top Upcoming Movies",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 300,
                  child: Obx(() {
                    return logic.upcoming.value.results!=null?ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () async {
                                var _url = (Uri.parse("https://www.google.com/search?q="+logic.upcoming.value.results!.elementAt(index).title));
                                if (!await launchUrl(_url, mode: LaunchMode.inAppWebView)) { // <--
                                throw Exception('Could not launch $_url');
                                }
                              },
                              child: Image.network(
                                Consts.getImageUrl +
                                    logic.upcoming.value.results!
                                        .elementAt(index)
                                        .posterPath!,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: logic.upcoming.value.results!.length,
                    ):CupertinoActivityIndicator();
                  }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
