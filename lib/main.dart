import 'package:detakapp/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'core/theme/colors.dart';
import 'core/theme/fonts.dart';
import 'core/theme/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  initialConfig();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.DF,
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
    ),
  );
}

Future<void> initialConfig() async {
  await Get.putAsync(() => StorageService().init());
}
