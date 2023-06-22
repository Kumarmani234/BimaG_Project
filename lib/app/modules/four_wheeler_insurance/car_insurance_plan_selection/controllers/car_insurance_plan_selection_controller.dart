import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../home_insurance_module/home_insurance_plan_selection/models/extra_coverage_model.dart';
import '../../../home_insurance_module/home_insurance_plan_selection/models/insure_plan_model.dart';
import '../../../home_insurance_module/home_insurance_plan_selection/models/pilicy_duration_model.dart';
import '../../../home_insurance_module/home_insurance_plan_selection/models/premium_breakup_model.dart';
import '../../../profile/model/radio_selection_model.dart';
import '../../../two_wheeler_insurance/two_wheeler_plan_selection/model/proposal_form_tab_model.dart';
import '../../../two_wheeler_insurance/two_wheeler_plan_selection/model/summary_PA_model.dart';

class CarInsurancePlanSelectionController extends GetxController {
  String selectedEnquiryID = '';
  int selectedInsuranceCompany = 0;
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

  // Controllers for owner tab
  Rx<TextEditingController> NameController = TextEditingController().obs;
  Rx<TextEditingController> EmailController = TextEditingController().obs;
  Rx<TextEditingController> MobilenoController = TextEditingController().obs;
  Rx<TextEditingController> PancardController = TextEditingController().obs;
  Rx<TextEditingController> AddressController = TextEditingController().obs;

  //controller for nominee tab
  Rx<TextEditingController> nominee_nameController =
      TextEditingController().obs;
  Rx<TextEditingController> nominee_ageController = TextEditingController().obs;

  //controllers for vechicle tab in proposal from
  Rx<TextEditingController> regNoController = TextEditingController().obs;
  Rx<TextEditingController> EnginenoController = TextEditingController().obs;
  Rx<TextEditingController> ChassisController = TextEditingController().obs;
  Rx<TextEditingController> RegnoController = TextEditingController().obs;
  Rx<DateTime?> selectedRegsDate = Rx<DateTime?>(null);

  RxList<ProposalFormTab> tabsForProposal = <ProposalFormTab>[].obs;
  RxList<InsurePlanModel> insurePlanList = <InsurePlanModel>[].obs;
  RxList<PolicyDuration> policydurationList = <PolicyDuration>[].obs;
  RxList<ExtraCoverageModel> extraCoverageList = <ExtraCoverageModel>[].obs;
  RxList<PreminumBreakupModel> premiumBreakupList =
      <PreminumBreakupModel>[].obs;
  RxList<RadioSelectionModel> GenderRadioList = <RadioSelectionModel>[].obs;

  //form key for owener tab proposal tab
  GlobalKey<FormState> ownerTabFormkey = GlobalKey<FormState>();
  GlobalKey<FormState> nomineeTabFormkey = GlobalKey<FormState>();
  GlobalKey<FormState> vehicleTabFormkey = GlobalKey<FormState>();

  Rx<RadioSelectionModel>? nomineeGenderValue =
      RadioSelectionModel(text: 'Male', key: 'Male', isChecked: true, id: 0)
          .obs;

  Rx<InsurePlanModel>? InsurePlanType = InsurePlanModel(
          title: 'Own Damage Only',
          subtitle: 'Covers damages to your vehicle only and not third-party',
          priceTime: '₹699/ 1 Year',
          isSelected: true,
          tabId: 0)
      .obs;
  Rx<PolicyDuration>? DurationOfPolicy = PolicyDuration(
          time: '1 Year', premium: 'Premium', price: '₹699', tabId: 0)
      .obs;

  // for summary page
  RxList<SummaryPAModel> SummaryPAList = <SummaryPAModel>[].obs;

  Rx<SummaryPAModel>? SummaryPA =
      SummaryPAModel(title: 'Digit', price: '₹699', id: 0, isChecked: true).obs;

  final count = 0.obs;
  RxInt currentTabIndex = 0.obs;
  Rx<int> insuredValue = 10000.obs;
  RxList<String> years = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    for (int i = 1; i <= 110; i++) {
      years.add('$i yr');
    }
  }

  @override
  void onReady() {
    super.onReady();
    tabsForProposal
        .add(ProposalFormTab(tabName: 'Owner', tabId: 0, isActive: true));
    tabsForProposal
        .add(ProposalFormTab(tabName: 'Nominee', tabId: 1, isActive: false));
    tabsForProposal
        .add(ProposalFormTab(tabName: 'Vehicle', tabId: 2, isActive: false));

    addInsurePlan();
    addPolicyDuration();
    addExtraCoverage();
    addPremiumBreakup();
    addGenderRadios();
    addSummaryPA();
  }

  void onNominneGenderSelectionChange(index) {
    for (int j = 0; j < GenderRadioList.length; j++) {
      GenderRadioList[j].isChecked = false;
    }
    GenderRadioList[index].isChecked = true;
    nomineeGenderValue!.value = GenderRadioList[index];
    GenderRadioList.refresh();
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
    DurationOfPolicy!.value = policydurationList[index];
    policydurationList.refresh();
  }

  void OnSummaryPAChange(index) {
    for (int j = 0; j < SummaryPAList.length; j++) {
      SummaryPAList[j].isChecked = false;
    }
    SummaryPAList[index].isChecked = true;
    SummaryPA!.value = SummaryPAList[index];
    SummaryPAList.refresh();
  }

  onRegDatePickerTap(context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedRegsDate.value ?? DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2000, 1, 1), // set first date to 1 Jan 2000
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedRegsDate.value) {
      selectedRegsDate.value = picked;
      String formattedDate =
          '${picked.day.toString().padLeft(2, '0')} ${getMonthName(picked.month)} ${picked.year}';
      RegnoController.value.text = formattedDate;
    }
  }

  void addInsurePlan() {
    insurePlanList.add(InsurePlanModel(
        title: 'Own Damage Only',
        subtitle: 'Covers damages to your vehicle only and not third-party',
        priceTime: '₹699/ 1 Year',
        isSelected: true,
        tabId: 0));
    insurePlanList.add(InsurePlanModel(
        title: 'Comprehensive Cover',
        subtitle: 'Covers damages to your vehicle only and not third-party',
        priceTime: '₹999/ 1 Year',
        tabId: 1));
    insurePlanList.add(InsurePlanModel(
        title: 'Third-Party Cover',
        subtitle: 'Covers damages to your vehicle only and not third-party',
        priceTime: '₹499/ 1 Year',
        tabId: 2));
  }

  void addPolicyDuration() {
    policydurationList.add(PolicyDuration(
      time: '1 Year',
      premium: 'Premium',
      price: '₹699',
      tabId: 0,
      isSelected: true,
    ));
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
        mandatoryText: 'PA cover is mandatory',
        isChecked: true,
        id: 0));
    extraCoverageList.add(ExtraCoverageModel(
        title: 'Engine and Gear-Box Protect Cover',
        price: '₹100',
        isChecked: false,
        id: 1));
    extraCoverageList.add(ExtraCoverageModel(
        title: 'Consumable Cover', price: '₹320', isChecked: false, id: 2));
    extraCoverageList.add(ExtraCoverageModel(
        title: 'Return to Invoice (RTI) Cover',
        price: '₹50',
        isChecked: false,
        id: 3));
    extraCoverageList.add(ExtraCoverageModel(
        title: 'Passenger Cover', price: '₹57', isChecked: false, id: 4));
    extraCoverageList.add(ExtraCoverageModel(
        title: 'PA Cover for paid Driver - IMT 17',
        price: '₹150',
        isChecked: false,
        id: 5));
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

  //add radio fr gender selection in nominee tab inproposal from
  addGenderRadios() {
    GenderRadioList.add(
        RadioSelectionModel(text: 'Male', key: 'Male', isChecked: true, id: 0));
    GenderRadioList.add(RadioSelectionModel(
        text: 'Female', key: 'Female', isChecked: false, id: 1));
    GenderRadioList.add(RadioSelectionModel(
        text: 'Other', key: 'Other', isChecked: false, id: 1));
  }

  void addSummaryPA() {
    SummaryPAList.add(
        SummaryPAModel(title: 'Digit', price: '₹699', id: 0, isChecked: true));
    SummaryPAList.add(SummaryPAModel(title: 'Digit', price: '₹699', id: 1));
    SummaryPAList.add(SummaryPAModel(title: 'Digit', price: '₹699', id: 1));
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  // get the month

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

  RxList<double> AgeInYearList = <double>[].obs;
}
