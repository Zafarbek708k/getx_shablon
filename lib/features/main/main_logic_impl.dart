

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_shablon/features/main/main_state.dart';

import 'main_logic.dart';

class MainLogicImpl extends GetxController implements MainLogic {
  @override
  MainState  state = MainState();

  @override
  PageController bottomNavController = PageController(initialPage: 0);

}