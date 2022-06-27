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
  runApp(
    GetMaterialApp(
      title: "DetakApp",
      initialRoute: AppPages.OB,
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
          secondary: CustomColors.grey.withOpacity(0.5),
        ),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
    ),
  );
}
