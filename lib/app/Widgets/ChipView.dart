import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raj_s_application9/app/utils/Consts.dart';

import '../modules/dashboard/dashboard_logic.dart';

class GetChipView extends GetView<DashboardLogic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Obx(() {
        return Wrap(
          spacing: 8,
          children: List.generate(controller.choicesList.length, (index) {
            return ChoiceChip(
              labelPadding: EdgeInsets.all(2.0),
              label: Text(
                controller.choicesList[index],
                style: (index != controller.defaultChoiceIndex.value)
                    ? GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        foreground: Paint()..shader = Consts.linearGradient)
                    : GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
              ),
              selected: controller.defaultChoiceIndex.value == index,
              selectedColor: Colors.deepPurple,
              onSelected: (value) {
                controller.updateChipIndex(index);
              },
              padding: EdgeInsets.all(10),
              backgroundColor: Colors.primaries.last,
              elevation: 1,
            );
          }),
        );
      }),
    );
  }
}
