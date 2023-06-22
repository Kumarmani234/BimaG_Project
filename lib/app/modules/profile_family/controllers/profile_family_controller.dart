import 'dart:convert';

import 'package:bima_g/app/enums.dart';
import 'package:bima_g/app/modules/profile_family/model/ResGetFamilyMembers.dart';
import 'package:bima_g/app/modules/profile_family/model/ReqManageFamilyMembers.dart';
import 'package:bima_g/app/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../utility/utils.dart';
import '../../../data/models/ResNameIdList.dart';
import '../../../module_controllers.dart';

class ProfileFamilyController extends GetxController {
  RxList<FamilyMember> familyMemberList = <FamilyMember>[].obs;
  RxList<ResNameIdList> listRelation = Utils.getRelationsList().obs;
  Rx<ApiStatus> apiStatus = ApiStatus.Loading.obs;

  //Controllers for add new family member
  Rx<TextEditingController> familyMemberNameController =
      TextEditingController().obs;
  Rx<TextEditingController> familyMemberAgeController =
      TextEditingController().obs;
  Rx<DateTime?> selectedNewMemberBirthDate = Rx<DateTime?>(null);
  Rx<TextEditingController> fullNameController = TextEditingController().obs;
  Rx<TextEditingController> dateOfBirthController = TextEditingController().obs;

  String selectedAddFamilyGender = 'Male';
  ResNameIdList? selectedRelation;

  Rx<ButtonStatus> addMemberButtonStatus = ButtonStatus.Active.obs;

  int editMemberID = 0;

  RefreshController familyRefreshController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    fetchFamilyMembers();
    selectedRelation = listRelation.first;
  }

  @override
  void onClose() {}

  void fetchFamilyMembers() {
    apiStatus.value = ApiStatus.Loading;
    apiClientProvider.getFamilyMembers().then((value) async {
      apiStatus.value = ApiStatus.Completed;
      // bool success =
      //     await apiClientProvider.checkStatus(value, wantToShowDialog: false);
      if (value.body['code'] == 1) {
        familyMemberList.value =
            ResGetFamilyMembers.fromJson(value.body).data.familyMembers;
        if (familyMemberList.isEmpty) {
          apiStatus.value = ApiStatus.EmptyData;
        }
        familyMemberList.refresh();
      }
    });
  }

  void addEditFamilyMember() {
    addMemberButtonStatus.value = ButtonStatus.Loading;
    ReqManageFamilyMembers data = ReqManageFamilyMembers(
        dob: selectedNewMemberBirthDate.value,
        fullName: familyMemberNameController.value.text,
        gender: selectedAddFamilyGender,
        memberId: editMemberID,
        relationShipType: int.parse(selectedRelation!.id.toString()));

    print(jsonEncode(data.toJson()));
    apiClientProvider.manageFamilyMembers(data.toJson()).then((respones) async {
      addMemberButtonStatus.value = ButtonStatus.Active;
      print(jsonEncode(respones.body));
      // bool success = await apiClientProvider.checkStatus(respones);
      if (respones.body['code'] == 1) {
        fetchFamilyMembers();
        Get.back();
      }
    });
  }

  deleteFamilyMember() {
    Dialogs.showAlertDialog('Delete Family Member',
        subTitle: 'Are you sure you want to delete family member ?',
        leftButtonText: 'Cancel',
        rightButtonText: 'Delete', onRightButtonClick: () {
      print('on delete button clicked');
      Get.back();
    });
  }

  onRefresh() {
    Future.delayed(
        Duration(seconds: 2), () => familyRefreshController.refreshCompleted());

    fetchFamilyMembers();
  }
}
