import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/home_insurance_module/home_insurance/model/home_insurance_tab_model.dart';
import 'package:bima_g/app/modules/policy_quote_list/model/quote_list_model.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/list_tile_model.dart';

class HomeInsuranceController extends GetxController {
  RxList<HomeTabModel> HomeTabs = <HomeTabModel>[].obs;
  RxList<ListTileModel> insureHouseList = <ListTileModel>[].obs;
  RxList<ListTileModel> independentHouseList = <ListTileModel>[].obs;
  RxList<ListTileModel> OwnerList = <ListTileModel>[].obs;

  Rx<TextEditingController> buildingValueController =
      TextEditingController().obs;
  Rx<TextEditingController> householdController = TextEditingController().obs;
  Rx<TextEditingController> carpetController = TextEditingController().obs;
  Rx<TextEditingController> constructionController =
      TextEditingController().obs;

  Rx<ListTileModel>? OwnerValue = ListTileModel(
          imageUrl: AssetPath.rented,
          title: 'Tenant',
          subtitle: 'The Person who owns the property ',
          id: 1)
      .obs;

  Rx<ListTileModel>? HouseValue = ListTileModel(
          title: 'Flat',
          imageUrl: AssetPath.owner,
          subtitle: '',
          id: 0,
          isSelected: true)
      .obs;

  Rx<ListTileModel>? InsureCoverageValue = ListTileModel(
    id: 0,
    imageUrl: AssetPath.owner,
    title: 'Only Building',
    subtitle: 'The Person who owns the property',
    isSelected: true,
  ).obs;
  RxInt currentTabIndex = 0.obs;
  RxInt currentIndexOfTopCarousel = 0.obs;
  GlobalKey<FormState> detailsTabFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> coverageTabFormKey = GlobalKey<FormState>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    HomeTabs.add(HomeTabModel(tabName: 'details'.tr, tabId: 0, isActive: true));
    HomeTabs.add(
        HomeTabModel(tabName: 'property_type'.tr, tabId: 1, isActive: false));
    HomeTabs.add(
        HomeTabModel(tabName: 'coverage'.tr, tabId: 2, isActive: false));

    addInsureHouse();
    addIndependentHouse();
    addOwnerHouse();

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

  void addOwnerHouse() {
    OwnerList.add(ListTileModel(
        id: 0,
        title: 'Owner',
        isSelected: true,
        imageUrl: AssetPath.owner,
        subtitle: 'The Person who owns the property'));
    OwnerList.add(ListTileModel(
        imageUrl: AssetPath.rented,
        title: 'Tenant',
        subtitle: 'The Person who owns the property ',
        id: 1));
  }

  void onOwnerValueChange(index) {
    for (int j = 0; j < OwnerList.length; j++) {
      OwnerList[j].isSelected = false;
    }
    OwnerList[index].isSelected = true;
    OwnerValue!.value = OwnerList[index];
    OwnerList.refresh();
  }

  void onHouseValueChange(index) {
    for (int j = 0; j < independentHouseList.length; j++) {
      independentHouseList[j].isSelected = false;
    }
    independentHouseList[index].isSelected = true;
    HouseValue!.value = independentHouseList[index];
    independentHouseList.refresh();
  }

  void onInsureCoverageChange(index) {
    for (int j = 0; j < insureHouseList.length; j++) {
      insureHouseList[j].isSelected = false;
    }
    insureHouseList[index].isSelected = true;
    InsureCoverageValue!.value = insureHouseList[index];
    insureHouseList.refresh();
  }

  void addInsureHouse() {
    insureHouseList.add(ListTileModel(
      id: 0,
      title: 'Only Building',
      imageUrl: AssetPath.owner,
      subtitle: 'The Person who owns the property',
      isSelected: true,
    ));
    insureHouseList.add(ListTileModel(
        title: 'Household Items',
        imageUrl: AssetPath.rented,
        subtitle: 'The Person who owns the property',
        id: 1));
    insureHouseList.add(ListTileModel(
      title: 'Both',
      imageUrl: AssetPath.rented,
      subtitle: 'The Person who owns the property ',
      id: 2,
    ));
  }

  void addIndependentHouse() {
    independentHouseList.add(ListTileModel(
        title: 'Flat',
        imageUrl: AssetPath.owner,
        subtitle: '',
        id: 0,
        isSelected: true));
    independentHouseList.add(ListTileModel(
      title: 'Independent House',
      imageUrl: AssetPath.rented,
      subtitle: '',
      id: 1,
    ));
  }
}
