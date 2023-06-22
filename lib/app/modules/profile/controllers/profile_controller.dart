import 'dart:convert';

import 'package:bima_g/app/enums.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/profile/model/ReqEditUserProfile.dart';
import 'package:bima_g/app/modules/profile/model/ResGetUserProfile.dart';
import 'package:bima_g/app/modules/profile/model/radio_selection_model.dart';
import 'package:bima_g/app/modules/profile_address/controllers/profile_address_controller.dart';
import 'package:bima_g/app/widgets/dialogs.dart';
import 'package:bima_g/utility/encrypt_shared_pref.dart';
import 'package:bima_g/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final userName = ''.obs, mno = ''.obs;

  Rx<ButtonStatus> profileUpdateButtonStatus = ButtonStatus.Active.obs;

  //profile view controllers
  Rx<TextEditingController> UserNameController = TextEditingController().obs;
  Rx<TextEditingController> LastNameController = TextEditingController().obs;
  Rx<TextEditingController> EmailController = TextEditingController().obs;
  Rx<TextEditingController> BirthDateController = TextEditingController().obs;
  Rx<TextEditingController> MobileController = TextEditingController().obs;

  Rx<ProfileData> profileData = ProfileData().obs;

  //password & confirm password
  TextEditingController passwordCon = TextEditingController();
  TextEditingController confirmPasswordCon = TextEditingController();
  RxBool isPasswordVisible = true.obs;
  RxBool isConPasswordVisible = true.obs;

  //date picker controller
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  //Form key for form detail
  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();

  //radios for gender selection in profile
  RxList<RadioSelectionModel> GenderRadioList = <RadioSelectionModel>[].obs;

  String selectedBasicProfileGender = 'Male';
  String selectedFamilyTabGenderValue = 'Male';

  final count = 0.obs;
  final tabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    profileAddressController = Get.put(ProfileAddressController());
    addGenderRadios();

    bikeInsuranceController.fetchManufacturer();

    userName.value = await sharedPrefs.getString(SharedPrefs.firstName) +
        ' ' +
        await sharedPrefs.getString(SharedPrefs.lastName);
    mno.value = '+91 ' + await sharedPrefs.getString(SharedPrefs.phoneNumber);

    UserNameController.value.text =
        await sharedPrefs.getString(SharedPrefs.firstName);
    LastNameController.value.text =
        await sharedPrefs.getString(SharedPrefs.lastName);
    EmailController.value.text =
        await sharedPrefs.getString(SharedPrefs.userEmail);
    BirthDateController.value.text =
        await sharedPrefs.getString(SharedPrefs.dob);
    fetchAddressController.pincodeCon.text =
        await sharedPrefs.getString(SharedPrefs.dob);
    if (MobileController.value.text.isEmpty) {
      MobileController.value.text = mno.value;
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  onTabChange(index) => tabIndex.value = index;

  addGenderRadios() {
    GenderRadioList.clear();
    GenderRadioList.add(
        RadioSelectionModel(text: 'Male', key: 'Male', isChecked: true, id: 0));
    GenderRadioList.add(RadioSelectionModel(
        text: 'Female', key: 'Female', isChecked: false, id: 1));
    GenderRadioList.add(RadioSelectionModel(
        text: 'Other', key: 'Other', isChecked: false, id: 1));
  }

  getProfileDetails({bool updateAPI = false}) async {
    //mergeDataToField();
    //we are cheking oincode for prevent api calling for everytime
   if(!updateAPI){
     String pincode = await sharedPrefs.getString(SharedPrefs.pincode);
     if (pincode != 'blank' && pincode.isNotEmpty) {
       mergeDataToField();
       return;
     }
   }

    apiClientProvider.getUserProfile().then((value) async {
      print('profile controller called');
      //bool success = await apiClientProvider.checkStatus(value);
      if (value.body['code'] == 1) {
        print('getUserProfile ---- ${jsonEncode(value.body)}');
        await sharedPrefs.setString(
            SharedPrefs.profileData, value.body.toString());
        profileData.value = ResGetUserProfile.fromJson(value.body).data!;
        await sharedPrefs.setString(
            SharedPrefs.userName, profileData.value.userName.toString());
        await sharedPrefs.setString(
            SharedPrefs.firstName, profileData.value.firstName.toString());
        await sharedPrefs.setString(
            SharedPrefs.lastName, profileData.value.lastName.toString());
        await sharedPrefs.setString(
            SharedPrefs.phoneNumber, profileData.value.phoneNumber.toString());
        await sharedPrefs.setString(
            SharedPrefs.dob, profileData.value.dob.toString());
        await sharedPrefs.setString(
            SharedPrefs.gender, profileData.value.gender.toString());
        await sharedPrefs.setString(SharedPrefs.profileImage,
            profileData.value.profileImage.toString());
        await sharedPrefs.setString(
            SharedPrefs.city, profileData.value.city.toString());
        await sharedPrefs.setString(
            SharedPrefs.pincodeId, profileData.value.pincodeId.toString());
        await sharedPrefs.setString(
            SharedPrefs.pincode, profileData.value.pincode.toString());
        await sharedPrefs.setString(
            SharedPrefs.userEmail, profileData.value.userEmail.toString());
        await sharedPrefs.setString(SharedPrefs.streetAddress,
            profileData.value.streetAddress.toString());

        await sharedPrefs.setString(
            SharedPrefs.savedPincode, profileData.value.pincode.toString());
        await sharedPrefs.setString(SharedPrefs.savedStreetAddress,
            profileData.value.streetAddress.toString());
        await sharedPrefs.setString(
            SharedPrefs.savedCity, profileData.value.city.toString());
        await sharedPrefs.setString(SharedPrefs.savedAddressType, '1');
        print('profileImage URL : ${profileData.value.profileImage.toString()}');
        dashboardController.profileUrl.value =
            profileData.value.profileImage.toString();
        mergeDataToField();
      }
    });
  }

  Future<void> mergeDataToField() async {
    UserNameController.value.text =
        await sharedPrefs.getString(SharedPrefs.firstName);
    LastNameController.value.text =
        await sharedPrefs.getString(SharedPrefs.lastName);
    EmailController.value.text =
        await sharedPrefs.getString(SharedPrefs.userEmail);
    DateTime dateTime =
        DateTime.parse(await sharedPrefs.getString(SharedPrefs.dob));
    String formattedDate =
        '${dateTime.day.toString().padLeft(2, '0')} ${Utils.getMonthName(dateTime.month)} ${dateTime.year}';
    BirthDateController.value.text = formattedDate;
    selectedDate.value = dateTime;
    MobileController.value.text =
        await sharedPrefs.getString(SharedPrefs.phoneNumber);
    selectedBasicProfileGender =
        await sharedPrefs.getString(SharedPrefs.gender);

    await Future.delayed(Duration(milliseconds: 300), () async {
      fetchAddressController.pincodeCon.text =
          await sharedPrefs.getString(SharedPrefs.pincode);
      fetchAddressController.streetAddressCon.text =
          await sharedPrefs.getString(SharedPrefs.streetAddress);
      fetchAddressController.selectedPincode =
          int.parse(await sharedPrefs.getString(SharedPrefs.pincodeId));
    });
  }

  onSaveProfileDetails() {
    if (profileUpdateButtonStatus.value == ButtonStatus.Loading) {
      return;
    }

    if (profileController.profileFormKey.currentState!.validate()) {
      profileUpdateButtonStatus.value = ButtonStatus.Loading;
      ReqEditUserProfile reqEditUserProfile = ReqEditUserProfile(
          firstName: UserNameController.value.text,
          lastName: LastNameController.value.text,
          dob: selectedDate.value,
          gender: selectedBasicProfileGender,
          streetAddress: fetchAddressController.streetAddressCon.text,
          userEmail: EmailController.value.text,
          pincodeId: fetchAddressController.selectedPincode);

      apiClientProvider
          .editUserProfile(reqEditUserProfile.toJson())
          .then((response) async {
        profileUpdateButtonStatus.value = ButtonStatus.Active;
        bool success = await apiClientProvider.checkStatus(response);

        if (success) {
          await sharedPrefs.setString(SharedPrefs.pincode, "blank");
          Dialogs.showInfoDialog(response.body['message'],
              onCloseDialog: (val) => Get.back());
        }
      });
    }
  }
}
