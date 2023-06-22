import 'package:bima_g/app/modules/policies/model/purchased_policy_model.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../agent_homepage/model/insurer_item_model.dart';

class AgentInsurerController extends GetxController {
  RxList<InsurerItemModel> insurerList = <InsurerItemModel>[].obs;
  RxList<PurchasedPolicyModel> insurePolicyList = <PurchasedPolicyModel>[].obs;
  RxList<String> heightlight_text = <String>[].obs;
  RxList<Color> heightlight_color = <Color>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getInsurerList();
    getInsurePolicyList();
    getHeightlisghtText();
    getHeightlisghtColor();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  getInsurerList() {
    insurerList.add(InsurerItemModel(
      username: 'Rajendra Yadav',
      email: 'rsyadav@gmail.com',
      pending: 1,
      total: 2,
      date: '31/05/2023',
      location: 'Ahmedabad',
    ));
    insurerList.add(InsurerItemModel(
      username: 'Rajendra Yadav',
      email: 'rsyadav@gmail.com',
      pending: 1,
      total: 2,
      date: '31/05/2023',
      location: 'Ahmedabad',
    ));
    insurerList.add(InsurerItemModel(
      username: 'Rajendra Yadav',
      email: 'rsyadav@gmail.com',
      pending: 1,
      total: 2,
      date: '31/05/2023',
      location: 'Ahmedabad',
    ));
    insurerList.add(InsurerItemModel(
      username: 'Rajendra Yadav',
      email: 'rsyadav@gmail.com',
      pending: 1,
      total: 2,
      date: '31/05/2023',
      location: 'Ahmedabad',
    ));
    insurerList.add(InsurerItemModel(
      username: 'Rajendra Yadav',
      email: 'rsyadav@gmail.com',
      pending: 1,
      total: 2,
      date: '31/05/2023',
      location: 'Ahmedabad',
    ));
    insurerList.add(InsurerItemModel(
      username: 'Rajendra Yadav',
      email: 'rsyadav@gmail.com',
      pending: 1,
      total: 2,
      date: '31/05/2023',
      location: 'Ahmedabad',
    ));
  }

  getInsurePolicyList() {
    insurePolicyList.add(
      PurchasedPolicyModel(
          planName: 'Compulsory Personal Accident (Owner-Driver)',
          planCompanyName: 'United india insurance',
          companyImage: 'https://picsum.photos/200/300',
          productName: '₹ 15,00,000',
          sumInjured: 'Policy Issued',
          expired: true,
          date: '₹ 389 (Yearly)'),
    );
    insurePolicyList.add(
      PurchasedPolicyModel(
          planName: 'Compulsory Personal Accident (Owner-Driver)',
          planCompanyName: 'United india insurance',
          companyImage: 'https://picsum.photos/200/300',
          productName: '₹ 15,00,000',
          sumInjured: 'Policy Issued',
          expired: true,
          date: '₹ 389 (Yearly)'),
    );
  }

  getHeightlisghtText() {
    heightlight_text.add('Successfully Processed');
    heightlight_text.add('Payment Pending');
  }

  getHeightlisghtColor() {
    heightlight_color.add(AppColors.green);
    heightlight_color.add(AppColors.warningColor);
  }
}
