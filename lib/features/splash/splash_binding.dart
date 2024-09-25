import 'package:get/get.dart';
import 'package:getx_shablon/features/splash/splash_logic_impl.dart';
import 'splash_logic.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashLogic>(() => SplashLogicImpl());
  }
}
