import 'dart:async';

import 'package:bima_g/app/modules/payment/model/banks_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final acceptedTerms = false.obs;
  String payAmount = '1180';

  RxList<BankModel> banksList = <BankModel>[].obs;
  RxList<BankModel> upiList = <BankModel>[].obs;
  RxList<BankModel> walletList = <BankModel>[].obs;

  //15 minutes but converted it to seconds
  Rx<int> remainingSeconds = 900.obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    banksList.add(BankModel(bankName: 'Axis', isSelected: true));
    banksList.add(BankModel(bankName: 'ICICI'));
    banksList.add(BankModel(bankName: 'IDBI'));
    banksList.add(BankModel(bankName: 'Kotak Mahindra'));
    banksList.add(BankModel(bankName: 'Standard Chartered'));

    upiList.add(BankModel(bankName: 'Axis', isSelected: true));
    upiList.add(BankModel(bankName: 'ICICI'));
    upiList.add(BankModel(bankName: 'IDBI'));
    upiList.add(BankModel(bankName: 'Kotak Mahindra'));
    upiList.add(BankModel(bankName: 'Standard Chartered'));

    walletList.add(BankModel(bankName: 'Paytm', isSelected: true));
    walletList.add(BankModel(bankName: 'Amazon Pay'));
    walletList.add(BankModel(bankName: 'PhonePay'));
    walletList.add(BankModel(bankName: 'Airtel'));
    walletList.add(BankModel(bankName: 'Jio Money'));
  }

  @override
  void onClose() {}

  startTimer() {
    remainingSeconds.value = kDebugMode ? 90 : 900;
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (remainingSeconds.value == 0) {
        timer!.cancel();
      } else {
        remainingSeconds.value--;
      }
    });
  }

  stopTimer() {
    timer!.cancel();
    //Get.snackbar('Timer', 'Timer Stopped');
  }
}
