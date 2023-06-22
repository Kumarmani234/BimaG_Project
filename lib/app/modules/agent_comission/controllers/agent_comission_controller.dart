import 'package:bima_g/app/modules/agent_comission/model/commision_detail.dart';
import 'package:bima_g/app/modules/agent_comission/model/withdrawel_detail_model.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home_insurance_module/home_insurance/model/list_tile_model.dart';
import '../../home_insurance_module/home_insurance_plan_selection/models/premium_breakup_model.dart';

class AgentComissionController extends GetxController {
  Rx<int> currentCommissionTabIndex = 0.obs;
  RxList<CommissionDetailModel> commissionDetailList =
      <CommissionDetailModel>[].obs;

  //withdrawel
  Rx<TextEditingController> amountController = TextEditingController().obs;
  RxList<ListTileModel> bankList = <ListTileModel>[].obs;
  RxList<PreminumBreakupModel> withdrawelBreakupList =
      <PreminumBreakupModel>[].obs;
  RxBool isShowBottomSheet = false.obs;
  RxBool isToggleIcon = false.obs;

  //withdrawel detail
  RxList<WithdrawelDetailModel> withdrawelDetailLinkList =
      <WithdrawelDetailModel>[].obs;

  void toggleShowBottomSheet() {
    isShowBottomSheet.toggle();
  }

  void toggleBottomIcon() {
    isToggleIcon.toggle();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getCommisionList();
    getBankList();
    getWithdrawelBreakupList();
    getwithdrawelLinkList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  getCommisionList() {
    commissionDetailList.add(CommissionDetailModel(
        id: 0,
        title: '13 April, 02:14 PM',
        subtitle: 'Insurer register with link',
        suffixText: '+₹10',
        imgPath: AssetPath.user_circle_plus));
    commissionDetailList.add(CommissionDetailModel(
        id: 1,
        title: '12 April, 01:12 PM',
        subtitle: 'Insurer buy policy with link',
        suffixText: '+₹384',
        imgPath: AssetPath.file_plus));
    commissionDetailList.add(CommissionDetailModel(
        id: 2,
        title: '11 April, 02:14 PM',
        subtitle: 'User register pending',
        suffixText: '₹10',
        imgPath: AssetPath.user_circle_plus,
        status: 2));
    commissionDetailList.add(CommissionDetailModel(
        id: 3,
        title: '13 April, 02:14 PM',
        subtitle: 'Insurer buy policy pending payment',
        suffixText: '₹265',
        imgPath: AssetPath.file_plus,
        status: 2));
    commissionDetailList.add(CommissionDetailModel(
        id: 4,
        title: '13 April, 02:14 PM',
        subtitle: 'Withdrawal to SBI Bank',
        suffixText: '-₹3500',
        status: 0,
        imgPath: AssetPath.bank));
    commissionDetailList.add(CommissionDetailModel(
        id: 5,
        title: '13 April, 02:14 PM',
        subtitle: 'Insurer register with link',
        suffixText: '+₹10',
        imgPath: AssetPath.user_circle_plus));
    commissionDetailList.add(CommissionDetailModel(
        id: 6,
        title: '12 April, 01:12 PM',
        subtitle: 'Insurer buy policy with link',
        suffixText: '+₹384',
        imgPath: AssetPath.file_plus));
    commissionDetailList.add(CommissionDetailModel(
        id: 7,
        title: '11 April, 02:14 PM',
        subtitle: 'User register pending',
        suffixText: '₹10',
        imgPath: AssetPath.user_circle_plus,
        status: 2));
    commissionDetailList.add(CommissionDetailModel(
        id: 8,
        title: '13 April, 02:14 PM',
        subtitle: 'Insurer buy policy pending payment',
        suffixText: '₹265',
        imgPath: AssetPath.file_plus,
        status: 2));
  }

  getBankList() {
    bankList.add(ListTileModel(
        title: 'Standard Chartered',
        subtitle: 'XXXXXXXXX4637',
        id: 0,
        imageUrl: AssetPath.standard_chartered));
    bankList.add(ListTileModel(
        title: 'Kotak Mahindra',
        subtitle: 'XXXXXXXXX4637',
        id: 1,
        isSelected: true,
        imageUrl: AssetPath.kotak));
    bankList.add(ListTileModel(
        title: 'State Bank of India',
        subtitle: 'XXXXXXXXX4637',
        id: 2,
        imageUrl: AssetPath.state_bank));
  }

  getWithdrawelBreakupList() {
    withdrawelBreakupList.add(
        PreminumBreakupModel(keyText: 'Amount', valueText: '₹8,000', id: 0));
    withdrawelBreakupList
        .add(PreminumBreakupModel(keyText: 'TDS', valueText: '18%', id: 1));
    withdrawelBreakupList.add(
        PreminumBreakupModel(keyText: 'TDS Amount', valueText: '₹1440', id: 2));
    withdrawelBreakupList.add(PreminumBreakupModel(
        keyText: 'Final Withdrawal', valueText: '₹6,560', id: 3));
  }

  getwithdrawelLinkList() {
    withdrawelDetailLinkList.add(WithdrawelDetailModel(
        statusName: 'Link Clicked',
        date_n_time: '13 April, 02:14 PM',
        status: 1));
    withdrawelDetailLinkList.add(WithdrawelDetailModel(
        statusName: 'User Registered', date_n_time: '13 April, 02:14 PM'));
    withdrawelDetailLinkList.add(WithdrawelDetailModel(
        statusName: 'User Verifying', date_n_time: '13 April, 02:14 PM'));
    withdrawelDetailLinkList.add(WithdrawelDetailModel(
        statusName: 'Payment Added', date_n_time: '13 April, 02:14 PM'));
  }
}
