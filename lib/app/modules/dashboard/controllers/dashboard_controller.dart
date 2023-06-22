import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/help/views/help_home_view.dart';
import 'package:bima_g/app/modules/homepage/views/homepage_view.dart';
import 'package:bima_g/app/modules/near_by/views/near_by_view.dart';
import 'package:bima_g/app/modules/profile/views/my_profile_main.dart';
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_details/model/ResInsuranceSlider.dart';
import 'package:bima_g/utility/encrypt_shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  Rx<int> selectedIndex = 0.obs;
  final profileUrl = ''.obs, userName = ''.obs;
  Rx<InsuranceSlider> listInsuranceSlider = InsuranceSlider().obs;

  List<Widget> dashboardPages = <Widget>[
    HomepageView(),
    NearByView(),
    MyProfileMainView(),
    HelpView()
  ];

  @override
  Future<void> onInit() async {
    userName.value = await sharedPrefs.getString(SharedPrefs.userName);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    sharedPrefs.getString(SharedPrefs.profileImage).then((value) => profileUrl.value = value);
  }

  @override
  void onClose() {}

  void fetchInsuranceSliderImages(type) {
    apiClientProvider.insuranceSlider(type.toString()).then((response) async {
      bool success = await apiClientProvider.checkStatus(response);
      if(success){
        listInsuranceSlider.value = ResInsuranceSlider.fromJson(response.body).data!;
      }
    });
  }
}
