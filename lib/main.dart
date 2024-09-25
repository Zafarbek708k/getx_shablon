import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'core/config/initial_binding.dart';
import 'core/config/routes.dart';
import 'core/language/app_const.dart';
import 'core/language/locale.dart';
import 'core/language/messeges.dart';
import 'core/manager/app_pref_storage.dart';
import 'core/style/app_theme.dart';
import 'features/splash/splash_view.dart';
import 'package:getx_shablon/core/language/di.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // await Firebase.initializeApp(
  // options: DefaultFirebaseOptions.currentPlatform,
  // );
  Map<String, Map<String, String>> _languages = await dep.init();
  Get.put(StorageManager(), permanent: true);

  runApp(MyApp(languages: _languages));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.languages});

  final Map<String, Map<String, String>> languages;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(builder: (localizationController) {
      return StyledToast(
        locale: const Locale('en', 'US'),
        alignment: Alignment.center,
        reverseAnimation: StyledToastAnimation.slideToBottomFade,
        toastAnimation: StyledToastAnimation.slideFromTopFade,
        toastPositions: const StyledToastPosition(align: Alignment.center),
        curve: Curves.fastOutSlowIn,
        child: KeyboardDismisser(
          gestures: const [GestureType.onTap],
          child: DevicePreview(
            enabled: true,
            builder: (context) {
              SystemChrome.setSystemUIOverlayStyle(
                const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarBrightness: Brightness.light,
                ),
              );
              return GetMaterialApp(
                theme: AppThemes.light(),
                darkTheme: AppThemes.dark(),
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.light,
                locale: localizationController.locale,
                translations: Messages(languages: languages),
                fallbackLocale: Locale(AppConstants.languages[0].languageCode, AppConstants.languages[0].countryCode),

                enableLog: true,
                getPages: routes,
                initialBinding: InitialBinding(),
                // initialRoute: HomePage.route,
                initialRoute: SplashPage.route,
                builder: (context, child) => GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: child,
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
