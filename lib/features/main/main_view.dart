import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shablon/core/config/extension.dart';
import 'package:lottie/lottie.dart';
import 'package:getx_shablon/features/history/history_view.dart';
import 'package:getx_shablon/features/home/home_view.dart';
import '../../core/language/language_widget.dart';
import '../../core/language/locale.dart';
import '../../ui/utils/app_color.dart';
import '../../ui/utils/app_typography.dart';
import '../home/home_logic.dart';
import '../profile/profile_view.dart';
import 'main_logic.dart';

class MainPage extends StatelessWidget {
  static const String route = "/main";

  MainPage({super.key});

  final logic = Get.find<MainLogic>();
  final state = Get.find<MainLogic>().state;

  final pages = [
    HomePage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeLogic>();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Sez',
              style: TextStyle(fontSize: 40),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: SizedBox(
                height: 40,
                width: 100,
                child: Lottie.asset("assets/lotties/on_off_switch_2.json"),
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: context.appTheme.primary,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 50),
            MaterialButton(
              onPressed: () {
                controller.switchTheme(); // Correctly call the switchTheme method
              },
              shape: const StadiumBorder(
                side: BorderSide(
                  color: Colors.deepOrange
                )
              ),
              child: const Text("Switch Theme"), // Add a child to the button
            ),
            GetBuilder<LocalizationController>(
              builder: (localizationController) {
                return LanguageWidget(
                  languageModel: localizationController.languages[0],
                  localizationController: localizationController,
                  index: 0,
                );
              },
            ),
            GetBuilder<LocalizationController>(
              builder: (localizationController) {
                return LanguageWidget(
                  languageModel: localizationController.languages[1],
                  localizationController: localizationController,
                  index: 1,
                );
              },
            ),
            GetBuilder<LocalizationController>(
              builder: (localizationController) {
                return LanguageWidget(
                  languageModel: localizationController.languages[2],
                  localizationController: localizationController,
                  index: 2,
                );
              },
            ),
          ],
        ),
      ),
      body: PageView(
        pageSnapping: false,
        allowImplicitScrolling: false,
        physics: const NeverScrollableScrollPhysics(),
        controller: logic.bottomNavController,
        children: pages,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (value) {
            // AppHapticManager.heavyImpact();
            logic.bottomNavController.jumpToPage(value);
            state.selectedIndex(value);
          },
          currentIndex: state.selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          selectedItemColor: AppColor.primary60,
          unselectedIconTheme: const IconThemeData(color: AppColor.basic60),
          selectedIconTheme: const IconThemeData(color: AppColor.primary60),
          selectedLabelStyle: AppTypography.footnote2.copyWith(color: AppColor.error30),
          showSelectedLabels: true,
          enableFeedback: true,
          useLegacyColorScheme: true,
          backgroundColor: context.appTheme.onSecondary,
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.sunny),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.account_circle_outlined),
              label: 'profile'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
