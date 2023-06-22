import 'dart:io';

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/policies/views/offline_policies_view.dart';
import 'package:bima_g/app/routes/app_pages.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/globals.dart';
import 'package:bima_g/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../../utility/encrypt_shared_pref.dart';

class SplashController extends GetxController {
  Rx<String> logo = AssetPath.splash_image.obs;

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    //await sharedPrefs.setString(DEBUG_MODE + '1', 'false');
    bool internetAvailable = await Utils.isInternetAvailable();
    if (!internetAvailable) {
      Get.offAll(OfflinePoliciesView(
        fromNoInternetConnection: true,
      ));
      return;
    }

    print('current language : ${await prefController.getCurrentLanguage()}');
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    userName = await sharedPrefs.getString(SharedPrefs.firstName) +
        ' ' +
        await sharedPrefs.getString(SharedPrefs.lastName);

    apiClientProvider
        .getAppVersion(Platform.isAndroid ? 'android' : 'ios')
        .then((value) async {
      bool success = await apiClientProvider.checkStatus(value);
      if (success) {
        //play store : https://play.google.com/store/apps/details?id=com.bimag.app
        //app store : Coming soon

        //use package info for build no ios & android
        PackageInfo packageInfo = await PackageInfo.fromPlatform();

        String version = packageInfo.version;
        String buildNumber = packageInfo.buildNumber;

        print('version : $version');
        print('buildNumber : $buildNumber');
        String finalVersion = '';
        if (Platform.isAndroid) {
          finalVersion = buildNumber;
        } else {
          finalVersion = version.replaceAll('.', '') + buildNumber;
        }

        print(finalVersion);

        /*Dialogs.showAlertDialog(
            'BimaG',
            subTitle:'New version is available for this App click on update button to download',
            rightButtonText: 'Update',
            onRightButtonClick: (){
              launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=com.bimag.app'));
            },
            onLeftButtonClick: (){
              proceedScreen();
            }
        );*/

        proceedScreen();
      }
    });
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future<void> proceedScreen() async {
    print(
        'getCurrentLanguage.91 : ${await prefController.getCurrentLanguage()}');
    String langCcde = await prefController.getCurrentLanguage();
    if (prefController.getCurrentLanguage() != 'def_en') {
      languagesController.fetchLanguageAndUpdate(langCcde);
    } else {
      languagesController.onReady();
    }
    sharedPrefs
        .getString(SharedPrefs.DEBUG_MODE)
        .then((value) => print('DEBUG_MODE : $value'));

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));

    print(
        'isLoggedIn : ${await sharedPrefs.getString(SharedPrefs.IS_LOGGED_IN)}');
    if (await sharedPrefs.getString(SharedPrefs.IS_LOGGED_IN) == 'true') {
      Get.offAndToNamed(Routes.DASHBOARD);
    } else {
      if (prefController.getCurrentLanguage() != 'def_en') {
        Get.offAndToNamed(Routes.AUTHENTICATION);
      } else {
        Get.offAndToNamed(Routes.LANGUAGES);
      }
    }
  }
}
