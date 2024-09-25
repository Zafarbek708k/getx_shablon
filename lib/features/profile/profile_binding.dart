import 'package:get/get.dart';
import 'package:getx_shablon/features/profile/profile_logic_impl.dart';
import 'profile_logic.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileLogic>(() => ProfileLogicImpl());
  }
}
