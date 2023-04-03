import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/repository/MovieProvider.dart';
import 'search_logic.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(SearchLogic());
    return Container(
      child: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: logic.controller,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () {
                      logic.controller.clear();
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.primaries[3],
                    ),
                  ),
                  hintText: '[Some hint text...]',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.primaries[3],
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.primaries[3],
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                ),
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Colors.primaries[3]),
                textAlign: TextAlign.center,
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 110,left: 10,right: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height - 200,
                  child: Obx(() {
                    return logic.searchresults.value.results!.isNotEmpty?ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                var _url = (Uri.parse("https://www.google.com/search?q="+logic.searchresults.value.results!.elementAt(index).name));
                                if (!await launchUrl(_url, mode: LaunchMode.inAppWebView)) { // <--
                                throw Exception('Could not launch $_url');
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 220.0,
                                      width: 140.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        image: DecorationImage(
                                          image:NetworkImage(Consts.getImageUrl +
                                              logic.searchresults.value.results!
                                                  .elementAt(index)
                                                  .posterPath!,
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 30),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(logic.searchresults.value.results!.elementAt(index).name,
                                          style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: Colors.white70),),
                                          Text("Aired on " +logic.searchresults.value.results!.elementAt(index).firstAirDate.toString(),
                                            style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: Colors.white70),),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(width: double.maxFinite -50,color: Colors.grey, height: 0.5,)
                          ],
                        );
                      },
                      itemCount: logic.searchresults.value.totalResults,
                    ):Container();
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
