import 'package:get/get.dart';
import 'package:getx_shablon/features/sign_in/sing_in_logic_impl.dart';
import 'sign_in_logic.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInLogic>(() => SignInLogicImpl());
  }
}
