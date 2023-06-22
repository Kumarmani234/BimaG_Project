import 'package:bima_g/utility/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home_insurance_module/home_insurance_plan_selection/models/home_proposal_form_tab_model.dart';
import '../../member_document/models/member_document_model.dart';

class AgentAddInsurerController extends GetxController {
  RxList<HomeProposalTabs> TabList = <HomeProposalTabs>[].obs;

  //form keys
  GlobalKey<FormState> personalInfoFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> documentFormKey = GlobalKey<FormState>();

  //profile info tab
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lasttNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> BirthDateController = TextEditingController().obs;
  Rx<TextEditingController> mobileController = TextEditingController().obs;

  String selectedGender = 'Male';
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  RxInt currentTabIndex = 0.obs;

  //document tab
  RxList<DocumentModel> documentList = <DocumentModel>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    TabList.add(
        HomeProposalTabs(tabName: 'Personal info', tabId: 0, isActive: true));
    TabList.add(HomeProposalTabs(tabName: 'Documents', tabId: 1));

    getDocumentList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  getDocumentList() {
    documentList.add(
      DocumentModel(
          img_url: AssetPath.profile_document,
          documentNo: '8576 6483 8473',
          documentType: 'Aadhaar Card',
          id: '0'),
    );
    documentList.add(DocumentModel(
        img_url: AssetPath.agent_info,
        documentNo: 'RJ14843848345',
        documentType: 'Driving License',
        id: '1'));
    documentList.add(DocumentModel(
        img_url: AssetPath.agent_info,
        documentNo: 'FC46DG3478',
        documentType: 'PAN Card',
        id: '2'));

    documentList.add(DocumentModel(
        img_url: AssetPath.agent_info,
        documentNo: 'RJ14DT5483',
        documentType: 'Vehicles RC',
        id: '3'));
  }
}
