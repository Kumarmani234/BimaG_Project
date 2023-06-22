import 'package:bima_g/utility/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/modules/languages/locale/language_labels.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> pumpTestWidget(WidgetTester tester, Widget widget) async {
  await tester.pumpWidget(MaterialApp(
    home: widget,
  ));
}

void ComingSoon() {
  HapticFeedback.mediumImpact();
  Get.snackbar('Coming soon', "You can see update in next build.");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812),
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: "Application",
          translations: LanguageLabels(),
          locale: Locale('def_en', ''),
          fallbackLocale: Locale('def_en', ''),
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: AppTheme.appTheme,
        );
      },
    ),
  );
}


//sudo gem install cocoapods
// pod install

