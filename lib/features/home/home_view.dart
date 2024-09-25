import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_logic.dart';

class HomePage extends StatelessWidget {
  static const String route = "/home";

  HomePage({super.key});

  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('welcome'.tr, style: const TextStyle(fontSize: 18)),


          ],
        ),
      ),
    );
  }
}
