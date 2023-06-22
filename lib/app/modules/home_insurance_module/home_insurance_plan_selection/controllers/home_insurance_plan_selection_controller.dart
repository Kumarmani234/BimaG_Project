import 'package:bima_g/app/modules/home_insurance_module/home_insurance_plan_selection/models/home_proposal_form_tab_model.dart';
import 'package:bima_g/app/modules/home_insurance_module/home_insurance_plan_selection/models/premium_breakup_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/extra_coverage_model.dart';
import '../models/insure_plan_model.dart';
import '../models/pilicy_duration_model.dart';

class HomeInsurancePlanSelectionController extends GetxController {
  Rx<int> insuredValue = 60.obs;
  final count = 0.obs;
  RxInt currentTabIndex = 0.obs;

  RxBool isCommAddressVisible = RxBool(false);
  RxBool isNominneeInfoVisible = RxBool(true);
  RxBool isLoanInfoVisible = RxBool(false);

  //for toggle premium back up bottomsheet
  RxBool isShowBottomSheet = false.obs;

  RxBool isToggleIcon = false.obs;

  String selectedNomeeniRelation = '';

  void toggleShowBottomSheet() {
    print('------- bottom sheet toggled --------');
    isShowBottomSheet.toggle();
  }

  void toggleBottomIcon() {
    isToggleIcon.toggle();
  }

  RxList<InsurePlanModel> insurePlanList = <InsurePlanModel>[].obs;
  RxList<PolicyDuration> policydurationList = <PolicyDuration>[].obs;
  RxList<ExtraCoverageModel> extraCoverageList = <ExtraCoverageModel>[].obs;
  RxList<PreminumBreakupModel> premiumBreakupList =
      <PreminumBreakupModel>[].obs;
  RxList<HomeProposalTabs> HomeProposalTabList = <HomeProposalTabs>[].obs;

  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> nomNameController = TextEditingController().obs;
  Rx<TextEditingController> ageController = TextEditingController().obs;
  Rx<TextEditingController> nomAgeController = TextEditingController().obs;
  Rx<TextEditingController> bankController = TextEditingController().obs;
  Rx<TextEditingController> branchController = TextEditingController().obs;
  Rx<TextEditingController> accountnoController = TextEditingController().obs;
  Rx<TextEditingController> fullNameController = TextEditingController().obs;
  Rx<TextEditingController> birhtDateController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> mobileController = TextEditingController().obs;

  //selection date

  //form keys
  GlobalKey<FormState> PersionalDetailFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> AddressDetailFormKey = GlobalKey<FormState>();

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  Rx<InsurePlanModel>? InsurePlanType = InsurePlanModel(
          title: 'My Health Suraksha',
          subtitle: 'cover hospitalization, surgical, pre and post medication',
          priceTime: '₹699/ 1 Year',
          isSelected: true,
          tabId: 0)
      .obs;

  Rx<PolicyDuration>? PolicyDuraiton = PolicyDuration(
          time: '1 Year', premium: 'Premium', price: '₹699', tabId: 0)
      .obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    addInsurePlan();
    addPolicyDuration();
    addExtraCoverage();
    addPremiumBreakup();
    addHomeProposalFormTabs();
  }

  void onInsurePlanSelectionChange(index) {
    for (int j = 0; j < insurePlanList.length; j++) {
      insurePlanList[j].isSelected = false;
    }
    insurePlanList[index].isSelected = true;
    InsurePlanType!.value = insurePlanList[index];
    insurePlanList.refresh();
  }

  void onPolicyDurationChange(index) {
    for (int j = 0; j < policydurationList.length; j++) {
      policydurationList[j].isSelected = false;
    }
    policydurationList[index].isSelected = true;
    PolicyDuraiton!.value = policydurationList[index];
    policydurationList.refresh();
  }

  void onDatePickerTap(context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.value ?? DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2000, 1, 1), // set first date to 1 Jan 2000
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      String formattedDate =
          '${picked.day.toString().padLeft(2, '0')} ${getMonthName(picked.month)} ${picked.year}';
      birhtDateController.value.text = formattedDate;
    }
  }

  void addInsurePlan() {
    insurePlanList.add(InsurePlanModel(
        title: 'My Health Suraksha',
        subtitle: 'cover hospitalization, surgical, pre and post medication',
        priceTime: '₹699/ 1 Year',
        isSelected: true,
        tabId: 0));
    insurePlanList.add(InsurePlanModel(
        title: 'Critical Illness Insurance',
        subtitle: 'cover hospitalization, surgical, pre and post medication',
        priceTime: '₹699/ 1 Year',
        tabId: 1));
    insurePlanList.add(InsurePlanModel(
        title: 'Individual Health Insurance',
        subtitle: 'cover hospitalization, surgical, pre and post medication',
        priceTime: '₹699/ 1 Year',
        tabId: 2));
  }

  void addPolicyDuration() {
    policydurationList.add(PolicyDuration(
        time: '1 Year',
        premium: 'Premium',
        price: '₹699',
        tabId: 0,
        isSelected: true));
    policydurationList.add(PolicyDuration(
        time: '2 Year', premium: 'Premium', price: '₹699', tabId: 1));
    policydurationList.add(PolicyDuration(
        time: '3 Year', premium: 'Premium', price: '₹699', tabId: 2));
  }

  void addExtraCoverage() {
    extraCoverageList.add(ExtraCoverageModel(
        title: 'Personal Accident Cover of Rs. 10 Lakh',
        price: '₹180',
        time: '1 Year',
        mandatoryText: 'PA cover is mandatory ',
        isChecked: true,
        id: 0));
    extraCoverageList.add(ExtraCoverageModel(
        title: 'Engine and Gear-Box Protect Cover',
        price: '₹100',
        time: '1 Year',
        mandatoryText: 'PA cover is mandatory ',
        isChecked: false,
        id: 1));
  }

  void addPremiumBreakup() {
    premiumBreakupList.add(PreminumBreakupModel(
        keyText: 'Basic Own Damage', valueText: '₹1,000', id: 0));
    premiumBreakupList.add(PreminumBreakupModel(
        keyText: 'Net Premium', valueText: '₹1,000', id: 1));
    premiumBreakupList.add(PreminumBreakupModel(
        keyText: 'Add GST(18%)', valueText: '₹180', id: 2));
    premiumBreakupList.add(PreminumBreakupModel(
        keyText: 'Final Premium', valueText: '₹1,180', id: 3));
  }

  void addHomeProposalFormTabs() {
    HomeProposalTabList.add(HomeProposalTabs(
        tabName: 'Personal Details', tabId: 0, isActive: true));
    HomeProposalTabList.add(
        HomeProposalTabs(tabName: 'Address Details', tabId: 1));
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}
