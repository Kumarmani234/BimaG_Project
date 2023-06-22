import 'dart:convert';

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/widgets/dialogs.dart';
import 'package:bima_g/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../enums.dart';

class ForgotPasswordController extends GetxController {
  Rx<TextEditingController> passwordCon = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordCon = TextEditingController().obs;
  RxBool isPasswordVisible = true.obs, isConPasswordVisible = true.obs;

  GlobalKey<FormState> newPassFormKey = GlobalKey<FormState>();
  Rx<ButtonStatus> newPasswordBtnStatus = ButtonStatus.InActive.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  onForgotPassClick(phone) {
    String encryptedPass;
    if (newPassFormKey.currentState!.validate()) {
      encryptedPass = Utils.encodeBase64(passwordCon.value.text);
      print('phone : $phone =======' + encryptedPass);
      apiClientProvider.forgotPassword(phone, encryptedPass).then((value) {
        // newPasswordBtnStatus.value = ButtonStatus.Active;
        print('forgotPassword : ${jsonEncode(value.body)}');
        Dialogs.showInfoDialog(value.body['message'].toString(),
            onCloseDialog: (val) {
          Get.back();
        });
      });
    }
  }

  onChange() {
    if (passwordCon.value.text.isNotEmpty &&
        confirmPasswordCon.value.text.isNotEmpty) {
      newPasswordBtnStatus.value = ButtonStatus.Active;
    } else {
      newPasswordBtnStatus.value = ButtonStatus.InActive;
    }
  }
}
