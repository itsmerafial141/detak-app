import 'package:detakapp/app/modules/login/controllers/auth_controller.dart';
import 'package:detakapp/app/modules/login/views/login_view.dart';
import 'package:detakapp/app/modules/navigasi/views/navigasi_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'core/theme/colors.dart';
import 'core/theme/fonts.dart';
import 'core/theme/themes.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  var authController = Get.put(AuthController());
  runApp(
    FutureBuilder(
      future: authController.autoLoginUser(),
      builder: (_, snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? Obx(
                () {
                  return GetMaterialApp(
                    title: "Application",
                    home: authController.isAuth.value
                        ? const NavigasiView()
                        : const LoginView(),
                    getPages: AppPages.routes,
                    theme: ThemeData(
                      appBarTheme: AppBarTheme(
                        color: CustomColors.secondaryColor,
                      ),
                      textSelectionTheme: TextSelectionThemeData(
                        cursorColor: CustomColors.subTittle,
                      ),
                      inputDecorationTheme: CustomTheme.inputDecorationTheme,
                      elevatedButtonTheme: CustomTheme.elevatedButtonThemeData,
                      scaffoldBackgroundColor: CustomColors.white,
                      textTheme: TextTheme(
                        subtitle1: CustomFonts.montserratSemibold12,
                      ),
                      colorScheme: ColorScheme.fromSwatch().copyWith(
                        secondary: CustomColors.secondaryColor.withOpacity(0.5),
                      ),
                    ),
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: const [
                      GlobalMaterialLocalizations.delegate,
                    ],
                    supportedLocales: const [Locale('id')],
                  );
                },
              )
            : MaterialApp(
                home: Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(
                      color: CustomColors.primaryColor,
                    ),
                  ),
                ),
              );
      },
    ),
  );
}
