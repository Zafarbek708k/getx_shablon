

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shablon/features/home/home_state.dart';

import 'home_logic.dart';

class HomeLogicImpl extends GetxController implements HomeLogic {
  @override
  HomeState state = HomeState();

  Rx<ThemeMode> currentTheme = ThemeMode.system.obs;

  @override
  void switchTheme() {
    currentTheme.value = currentTheme.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    Get.changeThemeMode(currentTheme.value); // Apply the theme change
  }

  @override
  Future<void> getCars(String email, String password) async{

  }
}
