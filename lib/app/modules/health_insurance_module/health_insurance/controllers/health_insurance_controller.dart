import 'package:bima_g/app/modules/health_insurance_module/health_insurance/model/deatils_tab_info_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../module_controllers.dart';
import '../../../policy_quote_list/model/quote_list_model.dart';
import '../model/health_insuarance_tab_model.dart';
import '../model/insured_members_model.dart';

class HealthInsuranceController extends GetxController {
  RxList<HealthTabsModel> tabsForComparePlan = <HealthTabsModel>[].obs;
  RxList<InsuredMembersModel> insuredMembersList = <InsuredMembersModel>[].obs;
  RxList<InsuredMembersModel> existingLillness = <InsuredMembersModel>[].obs;
  RxList<InsuredMembersModel> surgicalProcedure = <InsuredMembersModel>[].obs;
  RxList<DetailsTabInfoModel> DetailsTabInfoList = <DetailsTabInfoModel>[].obs;
  TextEditingController AgeTabController = TextEditingController();

  final count = 0.obs;
  RxInt currentTabIndex = 0.obs;
  var showViewPlans = false.obs;
  RxInt currentIndexOfTopCarousel = 0.obs;
  GlobalKey<FormState> ageTabFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> addressTabFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    tabsForComparePlan.add(HealthTabsModel(
        tabName: 'insured_members'.tr, tabId: 0, isActive: true));
    tabsForComparePlan
        .add(HealthTabsModel(tabName: 'age'.tr, tabId: 1, isActive: false));
    tabsForComparePlan
        .add(HealthTabsModel(tabName: 'address'.tr, tabId: 2, isActive: false));
    tabsForComparePlan
        .add(HealthTabsModel(tabName: 'details'.tr, tabId: 3, isActive: false));

    addInsuredMembers();
    addExistingLillness();
    addSurgicalProcedure();
    addDetailsTabInfo();

    //added temp data
    policyQuoteListController.listQuotesModel.add(QuoteListModel(
        quoteId: 'quoteId',
        planImage: 'planImage',
        planIDV: '123842y48',
        claimSettled: '98',
        planOriginalPrice: '1277',
        planDiscountedPrice: '1189',
        planDetailsList: [],
        insuranceCompany: 1,
        isPlanSaved: false));

    policyQuoteListController.listQuotesModel.add(QuoteListModel(
        quoteId: 'quoteId',
        planImage: 'planImage',
        planIDV: '123842y48',
        claimSettled: '96',
        planOriginalPrice: '3476',
        planDiscountedPrice: '3400',
        planDetailsList: [],
        insuranceCompany: 1,
        isPlanSaved: false));
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void addInsuredMembers() {
    insuredMembersList
        .add(InsuredMembersModel(id: 0, memberType: 'Self', isSelected: true));
    insuredMembersList.add(InsuredMembersModel(id: 1, memberType: 'Spouse'));
    insuredMembersList
        .add(InsuredMembersModel(id: 2, memberType: 'Son', isChild: true));
    insuredMembersList
        .add(InsuredMembersModel(id: 3, memberType: 'Daughter', isChild: true));
    insuredMembersList.add(InsuredMembersModel(id: 4, memberType: 'Father'));
    insuredMembersList.add(InsuredMembersModel(id: 5, memberType: 'Mother'));
    insuredMembersList.add(InsuredMembersModel(id: 6, memberType: 'Other'));

    insuredMembersList.forEach((member) {
      member.isSelected = member.id == 0; // Select 'Self' by default
    });
  }

  void addExistingLillness() {
    existingLillness.add(
        InsuredMembersModel(id: 0, memberType: 'Diabetes', isSelected: true));
    existingLillness.add(InsuredMembersModel(
        id: 1, memberType: 'BP / Hypertension', isSelected: true));
    existingLillness
        .add(InsuredMembersModel(id: 2, memberType: 'Heart Ailments'));
    existingLillness
        .add(InsuredMembersModel(id: 3, memberType: 'Heart Ailments'));
  }

  void addSurgicalProcedure() {
    surgicalProcedure.add(InsuredMembersModel(id: 0, memberType: 'Appendix'));
    surgicalProcedure
        .add(InsuredMembersModel(id: 1, memberType: 'Gall bladder,'));
    surgicalProcedure.add(
        InsuredMembersModel(id: 2, memberType: 'C-section ', isSelected: true));
    surgicalProcedure.add(InsuredMembersModel(
        id: 3, memberType: 'bypass surgery ', isSelected: true));
  }

  void addDetailsTabInfo() {
    DetailsTabInfoList.add(DetailsTabInfoModel(
        id: 0,
        title: 'Existing illness',
        subtitle:
            'Blood pressure, Diabetes, Heart condition, Asthma, Thyroid, Cancer etc.',
        isChecked: false));
    DetailsTabInfoList.add(DetailsTabInfoModel(
        isChecked: false,
        title: 'Surgical procedure',
        subtitle: 'Appendix, Gall bladder, C-section etc.',
        id: 1));
    DetailsTabInfoList.add(DetailsTabInfoModel(
        isChecked: false, title: 'None of these', subtitle: '', id: 2));
  }

  onDetailsCheckboxCheck(index) {
    // uncheck all other checkboxes if last checkbox is checked
    if (index == DetailsTabInfoList.length - 1) {
      for (int i = 0; i < DetailsTabInfoList.length - 1; i++) {
        DetailsTabInfoList[i].isChecked = false;
      }
    } else {
      // uncheck the last checkbox if any other checkbox is checked
      if (DetailsTabInfoList[DetailsTabInfoList.length - 1].isChecked) {
        DetailsTabInfoList[DetailsTabInfoList.length - 1].isChecked = false;
      }
    }
    DetailsTabInfoList[index].isChecked = !DetailsTabInfoList[index].isChecked;
    DetailsTabInfoList.refresh();
  }
}
