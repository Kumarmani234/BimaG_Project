import 'package:bima_g/app/modules/register_business/model/reg_business_personal_info_modal.dart';
import 'package:bima_g/app/modules/register_business/model/reg_business_tab_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utility/asset_paths.dart';

class RegisterBusinessController extends GetxController {
  RxInt currentTabIndex = 0.obs;
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  String selectedProfileInfoGender = 'Male';
  String selectGSTIN = 'No';
  String selectwappNo = 'No';
  String selectedDocumentType = '';

  RxList<RegisterBusinessTabModel> RegBusinessTabsList =
      <RegisterBusinessTabModel>[].obs;

  RxList<RegisterBusinessPerInfoModel> PersonalInfoGridList =
      <RegisterBusinessPerInfoModel>[].obs;

  //for personal info tab
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> birthdateController = TextEditingController().obs;
  Rx<TextEditingController> mobilenoController = TextEditingController().obs;
  Rx<TextEditingController> altMobilenoController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;

  //for business info tab
  Rx<TextEditingController> gstnoController = TextEditingController().obs;
  Rx<TextEditingController> garageNameController = TextEditingController().obs;
  Rx<TextEditingController> companyPanController = TextEditingController().obs;
  Rx<TextEditingController> businessTypeController =
      TextEditingController().obs;
  Rx<TextEditingController> businessMoNoController =
      TextEditingController().obs;
  Rx<TextEditingController> whatsappController = TextEditingController().obs;
  Rx<TextEditingController> businessEmailController =
      TextEditingController().obs;

  //for the bank details
  Rx<TextEditingController> accountnoController = TextEditingController().obs;
  Rx<TextEditingController> ifcsController = TextEditingController().obs;
  Rx<TextEditingController> bankNameController = TextEditingController().obs;
  Rx<TextEditingController> branchNameController = TextEditingController().obs;
  Rx<TextEditingController> nameInBankDetailController =
      TextEditingController().obs;

  GlobalKey<FormState> personalInfoKey = GlobalKey<FormState>();
  GlobalKey<FormState> businessInfoKey = GlobalKey<FormState>();
  GlobalKey<FormState> bankDetailsKey = GlobalKey<FormState>();
  GlobalKey<FormState> documentsKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    getRegBusinessTabs();
    getPersonalInfoGrids();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> onChangeBuisnessInfo(ind) async {
    for (int i = 0; i < PersonalInfoGridList.length; i++) {
      PersonalInfoGridList[i].isSelected = false;
    }
    PersonalInfoGridList[ind].isSelected = true;
    PersonalInfoGridList.refresh();
  }

  getRegBusinessTabs() {
    RegBusinessTabsList.add(RegisterBusinessTabModel(
      tabName: 'business_type'.tr,
      tabId: 0,
      isActive: true,
    ));
    RegBusinessTabsList.add(RegisterBusinessTabModel(
      tabName: 'business_info'.tr,
      tabId: 1,
    ));
    RegBusinessTabsList.add(RegisterBusinessTabModel(
      tabName: 'personal_info'.tr,
      tabId: 2,
    ));

    RegBusinessTabsList.add(RegisterBusinessTabModel(
      tabName: 'bank_details'.tr,
      tabId: 3,
    ));
    RegBusinessTabsList.add(RegisterBusinessTabModel(
      tabName: 'documents'.tr,
      tabId: 4,
    ));
  }

  getPersonalInfoGrids() {
    PersonalInfoGridList.add(RegisterBusinessPerInfoModel(
      isSelected: true,
      title: 'hospital'.tr,
      subtitle: 'Delivering quality healthcare services for optimal wellness.',
      assetImage: AssetPath.hospital_info,
      id: 0,
    ));
    PersonalInfoGridList.add(RegisterBusinessPerInfoModel(
      isSelected: false,
      title: 'medical'.tr,
      subtitle:
          'Empowering healthcare solutions with advanced medical expertise and personalized care.',
      assetImage: AssetPath.medical_info,
      id: 1,
    ));
    PersonalInfoGridList.add(RegisterBusinessPerInfoModel(
      isSelected: false,
      title: 'doctor_nurse'.tr,
      subtitle:
          'Expert healthcare professionals dedicated to your well-being, providing personalized care and medical expertise.',
      assetImage: AssetPath.doctor_nurse,
      id: 2,
    ));
    PersonalInfoGridList.add(RegisterBusinessPerInfoModel(
      isSelected: false,
      title: 'garage_automobile_store'.tr,
      subtitle: 'Your go-to destination for automotive solutions and products.',
      assetImage: AssetPath.garage_automobile_store,
      id: 3,
    ));
    PersonalInfoGridList.add(RegisterBusinessPerInfoModel(
      isSelected: false,
      title: 'influencer_content_creator'.tr,
      subtitle: 'Unleash your influence and connect with a global audience.',
      assetImage: AssetPath.influencer_content_creator,
      id: 4,
    ));
    PersonalInfoGridList.add(RegisterBusinessPerInfoModel(
      isSelected: false,
      title: 'agent'.tr,
      subtitle: 'Protecting your future with comprehensive insurance coverage.',
      assetImage: AssetPath.agent_info,
      id: 5,
    ));
    PersonalInfoGridList.add(RegisterBusinessPerInfoModel(
      isSelected: false,
      title: 'other'.tr,
      subtitle:
          'Register your unique business and connect with potential customers.',
      assetImage: AssetPath.others_info,
      id: 6,
    ));
  }
}
