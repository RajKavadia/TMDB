import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'singlemovie_logic.dart';

class SinglemoviePage extends StatelessWidget {
  final logic = Get.find<SinglemovieLogic>();

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(SinglemovieLogic());
    return Container(
      color: Colors.black87,
    );
  }
}
