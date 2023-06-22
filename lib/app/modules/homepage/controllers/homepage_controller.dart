import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance/controllers/car_insurance_controller.dart';
import 'package:bima_g/app/modules/health_insurance_module/health_insurance/controllers/health_insurance_controller.dart';
import 'package:bima_g/app/modules/home_insurance_module/home_insurance/controllers/home_insurance_controller.dart';
import 'package:bima_g/app/modules/policy_quote_list/controllers/policy_quote_list_controller.dart';
import 'package:bima_g/app/modules/sort_by/controllers/sort_by_controller.dart';
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_details/controllers/bike_insurance_controller.dart';
import 'package:bima_g/app/routes/app_pages.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../enums.dart';
import '../../../module_controllers.dart';
import '../../health_insurance_module/health_insurance/views/health_insurance_view.dart';
import '../../policy_filter/controllers/policy_filter_controller.dart';

class NewInsuranceModel {
  String imagePath, policyName;
  NewInsuranceModel({this.imagePath = '', this.policyName = ''});
}

class HomepageController extends GetxController {
  Rx<int> currentIndexOfTopCarousel = 0.obs,
      currentIndexOfYourPolicies = 0.obs,
      currentIndexOfIncompletePolicies = 0.obs;
  List<NewInsuranceModel> listPolicesType = [];

  //for drawer
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String appBarTitle = 'welcome_back';

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    listPolicesType.add(NewInsuranceModel(
        imagePath: AssetPath.policy_bike, policyName: 'two_wheeler'));
    listPolicesType.add(
        NewInsuranceModel(imagePath: AssetPath.policy_car, policyName: 'car'));
    listPolicesType.add(NewInsuranceModel(
        imagePath: AssetPath.policy_health, policyName: 'health'));
    listPolicesType.add(NewInsuranceModel(
        imagePath: AssetPath.policy_home, policyName: 'home'));
    listPolicesType.add(NewInsuranceModel(
        imagePath: AssetPath.policy_life, policyName: 'life'));
    listPolicesType.add(NewInsuranceModel(
        imagePath: AssetPath.policy_term, policyName: 'term'));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void navigatePolicy(index) {
    HapticFeedback.mediumImpact();
    Get.delete<PolicyFilterController>();
    Get.delete<SortByController>();
    Get.delete<PolicyQuoteListController>();
    sortByController = Get.put(SortByController());
    policyQuoteListController = Get.put(PolicyQuoteListController());
    policyFilterController = Get.put(PolicyFilterController());
    switch (index) {
      case 0:
        Get.delete<BikeInsuranceController>();
        bikeInsuranceController = Get.put(BikeInsuranceController());
        policyQuoteListController.setPolicyType(PolicyType.bikeInsurance);

        Get.toNamed(Routes.BIKE_INSURANCE);
        break;

      case 1:
        Get.delete<CarInsuranceController>();
        carInsuranceController = Get.put(CarInsuranceController());
        policyQuoteListController.setPolicyType(PolicyType.carInsurance);

        Get.toNamed(Routes.CAR_INSURANCE);
        break;
      case 2:
        Get.delete<HealthInsuranceController>();
        healthInsuranceController = Get.put(HealthInsuranceController());
        policyQuoteListController.setPolicyType(PolicyType.healthInsurance);

        Get.to(HealthInsuranceView());
        break;
      case 3:
        Get.delete<HomeInsuranceController>();
        homeInsuranceController = Get.put(HomeInsuranceController());
        policyQuoteListController.setPolicyType(PolicyType.homeInsurance);

        Get.toNamed(Routes.HOME_INSURANCE);
        break;
    }
  }
}
