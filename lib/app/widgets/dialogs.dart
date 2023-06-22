import 'dart:io';
import 'package:bima_g/utility/encrypt_shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Dialogs {
  static void showInfoDialog(title,
      {subTitle = '', buttonText = 'OK', onCloseDialog}) {
    if (Platform.isAndroid) {
      showDialog<String>(
        context: Get.context!,
        builder: (BuildContext context) => AlertDialog(
          content: subTitle.toString().isEmpty ? null : Text(subTitle),
          title: Text(title),
          contentPadding: EdgeInsets.only(left: 25.w, right: 20.w, top: 8.h),
          actions: [
            TextButton(onPressed: () => Get.back(), child: Text(buttonText))
          ],
        ),
      ).then(onCloseDialog);
    } else {
      showCupertinoDialog(
        context: Get.context!,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(title),
          content: subTitle.toString().isEmpty ? null : Text(subTitle),
          actions: [
            TextButton(onPressed: () => Get.back(), child: Text(buttonText))
          ],
        ),
      ).then(onCloseDialog);
    }
  }

  static void showAlertDialog(title,
      {subTitle = '',
      leftButtonText = 'Cancel',
      rightButtonText = 'Delete',
      final onRightButtonClick,
      final onLeftButtonClick}) {
    if (Platform.isAndroid) {
      showDialog<String>(
        context: Get.context!,
        builder: (BuildContext context) => AlertDialog(
          content: subTitle.toString().isEmpty ? null : Text(subTitle),
          title: Text(title),
          contentPadding: EdgeInsets.only(left: 25.w, right: 20.w, top: 8.h),
          actions: [
            TextButton(
                onPressed: () => Get.back(), child: Text(leftButtonText)),
            TextButton(
                onPressed: onRightButtonClick,
                child: Text(
                  rightButtonText,
                  style: TextStyle(color: Colors.red),
                )),
          ],
        ),
      );
    } else {
      showCupertinoDialog(
        context: Get.context!,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(title),
          content: subTitle.toString().isEmpty ? null : Text(subTitle),
          actions: [
            TextButton(
                onPressed: () {
                  if (onLeftButtonClick != null) {
                    onLeftButtonClick();
                  }
                  Get.back();
                },
                child: Text(leftButtonText)),
            TextButton(
                onPressed: onRightButtonClick,
                child: Text(
                  rightButtonText,
                  style: TextStyle(color: Colors.red),
                )),
          ],
        ),
      );
    }
  }

  static void showLogoutDialog() {
    if (Platform.isAndroid) {
      showDialog<String>(
        context: Get.context!,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Unauthorized'),
          contentPadding: EdgeInsets.only(left: 25.w, right: 20.w, top: 8.h),
          actions: [
            TextButton(
                onPressed: () async {
                  await sharedPrefs.onLogout();
                },
                child: Text('Logout'))
          ],
        ),
      );
    } else {
      showCupertinoDialog(
        context: Get.context!,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text('UnAuthorized'),
          actions: [
            TextButton(
                onPressed: () {
                  sharedPrefs.onLogout();
                },
                child: Text('Logout'))
          ],
        ),
      );
    }
  }
}
