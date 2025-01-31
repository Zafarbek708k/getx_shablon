import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shablon/features/main/main_view.dart';
import 'package:getx_shablon/features/sign_in/sign_in_view.dart';

import '../../core/manager/app_pref_storage.dart';
import '../../core/data/entity/user_sign_in_model.dart';
import 'splash_logic.dart';

class SplashPage extends StatelessWidget {
  static const String route = "/";
  SplashPage({super.key});

  final logic = Get.find<SplashLogic>();
  final state = Get.find<SplashLogic>().state;



  @override
  Widget build(BuildContext context) {
    final StorageManager storageManager =  Get.find();
    Future.delayed(const Duration(seconds: 4)).then((v)async{

      String? email = storageManager.getUserEmail;
      log('message:  $email');
      if(email != null){
       await Get.offNamed(MainPage.route);
      }else{
        await Get.offNamed(SignInPage.route);
      }
    });
    return const Scaffold(
      body: Center(
        child: Text('Splash', style: TextStyle(fontSize: 40),),
      ),
    );
  }
}
