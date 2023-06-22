import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../home_insurance_module/home_insurance_plan_selection/models/extra_coverage_model.dart';
import '../../../home_insurance_module/home_insurance_plan_selection/models/insure_plan_model.dart';
import '../../../home_insurance_module/home_insurance_plan_selection/models/pilicy_duration_model.dart';
import '../../../profile/model/radio_selection_model.dart';
import '../model/health_insurance_tab_model.dart';

class HealthInsurancePlanSelectionController extends GetxController {
  final count = 0.obs;
  Rx<int> insuredValue = 5.obs;
  RxInt currentTabIndex = 0.obs;

  RxBool isShowBottomSheet = false.obs;
  RxBool isToggleIcon = false.obs;
  String selectedNomeeniRelation = '';

  void toggleShowBottomSheet() {
    isShowBottomSheet.toggle();
  }

  void toggleBottomIcon() {
    isToggleIcon.toggle();
  }

  //tabs for proposal form
  RxList<HealthProppsalTab> healthTabs = <HealthProppsalTab>[].obs;

  //proposer tab
  RxList<RadioSelectionModel> SelectProposerList = <RadioSelectionModel>[].obs;
  Rx<TextEditingController> NameAsIDController = TextEditingController().obs;
  Rx<TextEditingController> PancardController = TextEditingController().obs;
  Rx<TextEditingController> EmailController = TextEditingController().obs;
  Rx<TextEditingController> EmergencyNoController = TextEditingController().obs;

  //members tab
  Rx<DateTime?> selectedMembersDate = Rx<DateTime?>(null);
  Rx<DateTime?> selectedSpouseDate = Rx<DateTime?>(null);

  Rx<TextEditingController> DateController = TextEditingController().obs;
  Rx<TextEditingController> OccupationController = TextEditingController().obs;
  Rx<TextEditingController> WeightController = TextEditingController().obs;
  Rx<TextEditingController> SpouseNameController = TextEditingController().obs;
  Rx<TextEditingController> SpouseDateController = TextEditingController().obs;
  Rx<TextEditingController> SpouseOccupationController =
      TextEditingController().obs;
  Rx<TextEditingController> SpouseWeightController =
      TextEditingController().obs;

  //nominee tab
  Rx<DateTime?> selectedNomineeDate = Rx<DateTime?>(null);

  Rx<TextEditingController> NominneDateController = TextEditingController().obs;
  Rx<TextEditingController> NomineeFullNameController =
      TextEditingController().obs;
  Rx<TextEditingController> ContactNoController = TextEditingController().obs;

  RxList<InsurePlanModel> insurePlanList = <InsurePlanModel>[].obs;
  RxList<PolicyDuration> policydurationList = <PolicyDuration>[].obs;
  RxList<ExtraCoverageModel> extraCoverageList = <ExtraCoverageModel>[].obs;

  RxList<RadioSelectionModel> selectNomineeList = <RadioSelectionModel>[].obs;

  //proposal form medical tab
  RxList<RadioSelectionModel> fieldList1 = <RadioSelectionModel>[].obs;
  RxList<RadioSelectionModel> fieldList2 = <RadioSelectionModel>[].obs;

  //form key for proposal form :

  GlobalKey<FormState> proposerTabFormkey = GlobalKey<FormState>();
  GlobalKey<FormState> membersTabFormkey = GlobalKey<FormState>();
  GlobalKey<FormState> medicalTabFormkey = GlobalKey<FormState>();
  GlobalKey<FormState> nomineeTabFormkey = GlobalKey<FormState>();

  Rx<InsurePlanModel>? InsurePlanType = InsurePlanModel(
          title: 'Insurance Plan',
          subtitle: 'Covers damages to your vehicle only and not third-party',
          priceTime: '₹699/ 1 Year',
          isSelected: true,
          tabId: 0)
      .obs;

  Rx<PolicyDuration>? DurationOfPolicy = PolicyDuration(
          time: '1 Year', premium: 'Premium', price: '₹699', tabId: 2)
      .obs;
//proposer tab
  Rx<RadioSelectionModel>? SelectProposer =
      RadioSelectionModel(text: 'Self', key: 'Self', isChecked: true, id: 0)
          .obs;

// medical tab
  Rx<RadioSelectionModel>? selectGridFirstMed = RadioSelectionModel(
          text: 'Not Applicable', key: 'Not Applicable', isChecked: true, id: 4)
      .obs;

  Rx<RadioSelectionModel>? selectGridSecondMed = RadioSelectionModel(
          text: 'Not Applicable', key: 'Not Applicable', isChecked: true, id: 4)
      .obs;

  // nominee tab
  Rx<RadioSelectionModel>? selectNomineeValue = RadioSelectionModel(
          text: 'Puran Kanwar', key: 'Puran Kanwar', isChecked: true, id: 0)
      .obs;

  RxList<String> feet = <String>[].obs;
  RxList<String> inch = <String>[].obs;

  //for the date selection
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<DateTime?> selectedNomDate = Rx<DateTime?>(null);

  @override
  void onInit() {
    super.onInit();
    for (int i = 1; i <= 10; i++) {
      feet.add('$i Feet');
    }
    for (int i = 1; i <= 12; i++) {
      inch.add('$i Inch');
    }
  }

  @override
  void onReady() {
    super.onReady();
    healthTabs
        .add(HealthProppsalTab(tabName: 'Proposer', tabId: 0, isActive: true));
    healthTabs
        .add(HealthProppsalTab(tabName: 'Members', tabId: 1, isActive: false));
    healthTabs
        .add(HealthProppsalTab(tabName: 'Medical', tabId: 2, isActive: false));
    healthTabs
        .add(HealthProppsalTab(tabName: 'Nominee', tabId: 3, isActive: false));

    addInsurePlan();
    addPolicyDuration();
    addExtraCoverage();

    selectProposer();
    selectFirstGridOfMedical();
    selectSecondGridOfMedical();
    selectNomineeGrid();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  onMemberDatePickerTap(context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedMembersDate.value ?? DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2000, 1, 1), // set first date to 1 Jan 2000
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedMembersDate.value) {
      selectedMembersDate.value = picked;
      String formattedDate =
          '${picked.day.toString().padLeft(2, '0')} ${getMonthName(picked.month)} ${picked.year}';

      DateController.value.text = formattedDate;
    }
  }

  onSpouseDatePickerTap(context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedSpouseDate.value ?? DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2000, 1, 1), // set first date to 1 Jan 2000
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedSpouseDate.value) {
      selectedSpouseDate.value = picked;
      String formattedDate =
          '${picked.day.toString().padLeft(2, '0')} ${getMonthName(picked.month)} ${picked.year}';

      SpouseDateController.value.text = formattedDate;
    }
  }

  onNomineeDatePickerTap(context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedNomineeDate.value ?? DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2000, 1, 1), // set first date to 1 Jan 2000
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedNomineeDate.value) {
      selectedNomineeDate.value = picked;
      String formattedDate =
          '${picked.day.toString().padLeft(2, '0')} ${getMonthName(picked.month)} ${picked.year}';

      NominneDateController.value.text = formattedDate;
    }
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

  void onNomineeChange(index) {
    for (int j = 0; j < selectNomineeList.length; j++) {
      selectNomineeList[j].isChecked = false;
    }
    selectNomineeList[index].isChecked = true;
    selectNomineeValue!.value = selectNomineeList[index];
    selectNomineeList.refresh();
  }

  void OnProposerChange(index) {
    for (int j = 0; j < SelectProposerList.length; j++) {
      SelectProposerList[j].isChecked = false;
    }
    SelectProposerList[index].isChecked = true;
    SelectProposer!.value = SelectProposerList[index];
    SelectProposerList.refresh();
  }

  void OnMedicalGrid1Change(index) {
    for (int j = 0; j < fieldList1.length; j++) {
      fieldList1[j].isChecked = false;
    }
    fieldList1[index].isChecked = true;
    selectGridFirstMed!.value = fieldList1[index];
    fieldList1.refresh();
  }

  void OnMedicalGrid2Change(index) {
    for (int j = 0; j < fieldList2.length; j++) {
      fieldList2[j].isChecked = false;
    }
    fieldList2[index].isChecked = true;
    selectGridSecondMed!.value = fieldList2[index];
    fieldList2.refresh();
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

  void selectProposer() {
    SelectProposerList.add(
        RadioSelectionModel(text: 'Self', key: 'Self', isChecked: true, id: 0));
    SelectProposerList.add(RadioSelectionModel(
        text: 'Spouse', key: 'Spouse', isChecked: false, id: 1));
  }

  void addExtraCoverage() {
    extraCoverageList.add(ExtraCoverageModel(
        title: 'Personal Accident Cover of Rs. 10 Lakh',
        price: '₹180',
        isChecked: true,
        id: 0));
    extraCoverageList.add(ExtraCoverageModel(
        title: 'Engine and Gear-Box Protect Cover',
        price: '₹100',
        isChecked: false,
        id: 1));
  }

  selectFirstGridOfMedical() {
    fieldList1.add(RadioSelectionModel(
        text: 'Pushpendra Singh',
        key: 'Pushpendra Singh',
        isChecked: false,
        id: 0));
    fieldList1.add(RadioSelectionModel(
        text: 'Harshvardhan Singh',
        key: 'Harshvardhan Singh',
        isChecked: false,
        id: 1));
    fieldList1.add(RadioSelectionModel(
        text: 'Puran Kawnar', key: 'Puran Kawnar', isChecked: false, id: 2));
    fieldList1.add(RadioSelectionModel(
        text: 'Bhanupriya Kanwar',
        key: 'Bhanupriya Kanwar',
        isChecked: false,
        id: 3));
    fieldList1.add(RadioSelectionModel(
        text: 'Not Applicable', key: 'Not Applicable', isChecked: true, id: 4));
  }

  selectSecondGridOfMedical() {
    fieldList2.add(RadioSelectionModel(
        text: 'Pushpendra Singh',
        key: 'Pushpendra Singh',
        isChecked: false,
        id: 0));
    fieldList2.add(RadioSelectionModel(
        text: 'Harshvardhan Singh',
        key: 'Harshvardhan Singh',
        isChecked: false,
        id: 1));
    fieldList2.add(RadioSelectionModel(
        text: 'Puran Kawnar', key: 'Puran Kawnar', isChecked: false, id: 2));
    fieldList2.add(RadioSelectionModel(
        text: 'Bhanupriya Kanwar',
        key: 'Bhanupriya Kanwar',
        isChecked: false,
        id: 3));
    fieldList2.add(RadioSelectionModel(
        text: 'Not Applicable', key: 'Not Applicable', isChecked: true, id: 4));
  }

  selectNomineeGrid() {
    selectNomineeList.add(RadioSelectionModel(
        text: 'Puran Kanwar', key: 'Puran Kanwar', isChecked: true, id: 0));
    selectNomineeList.add(RadioSelectionModel(
        text: 'Someone Else', key: 'Someone Else', isChecked: false, id: 1));
  }

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
