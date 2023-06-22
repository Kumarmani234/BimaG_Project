import 'dart:convert';

import 'package:bima_g/app/enums.dart';
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_details/model/ReqVerifyVehicleDetails.dart';
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_details/model/ResGetVehicleCompanyList.dart';
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_details/model/ResInsuranceSlider.dart';
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_details/model/ResVerifyVehicleDetails.dart';
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_details/views/bike_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utility/mask_input_formatter.dart';
import '../../../../../utility/utils.dart';
import '../../../../form_validation_expressions.dart';
import '../../../../module_controllers.dart';
import '../model/ResGetCityRto.dart';
import '../model/ResGetPolicyCities.dart';
import '../model/ResGetVehicleModelList.dart';
import '../model/ResGetVehicleVariantList.dart';
import '../model/bike_tabs_model.dart';

class ManufactureModel {
  String imgUrl;
  String text;
  int id;
  ManufactureModel({
    required this.imgUrl,
    required this.id,
    required this.text,
  });
}

class BikeInsuranceController extends GetxController {
  Rx<ButtonStatus> buttonStatus = ButtonStatus.InActive.obs;
  Rx<ButtonStatus> viewQuotesButtonStatus = ButtonStatus.Active.obs;
  RxInt currentIndexOfTopCarousel = 0.obs;
  Rx<String> selectedButton = Rx<String>('City');
  Rx<String> selectedCity = ''.obs;
  Rx<String> selectedRTO = Rx<String>('');
  Rx<ManufacturerModel> selectedManufacturer = ManufacturerModel().obs;
  Rx<VehicleModelList> selectedModel = VehicleModelList().obs;
  Rx<VehicleVariantList> selectedVariant = VehicleVariantList().obs;
  Rx<String> selectedYear = Rx<String>('');
  RxBool isEnable = RxBool(false);

  RxList<BikeTabsModel> listTabs = <BikeTabsModel>[].obs;
  Rx<TextEditingController> bikeNumberController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> RTOController = TextEditingController().obs;
  Rx<TextEditingController> manuController = TextEditingController().obs;
  Rx<TextEditingController> modelController = TextEditingController().obs;
  Rx<TextEditingController> variantController = TextEditingController().obs;

  GlobalKey<FormState> bikeRegNoKey = GlobalKey<FormState>();

  var maskFormatterForBike = new CustomTextInputFormatter(
      mask: '##-##-##-####',
      filter: {"#": FormFieldValidExpression().alphaNumValid},
      type: MaskAutoCompletionType.lazy);

  List<String> listDetailsPoints = [
    '6 Months Repair Warrant',
    '50% Advance Payment',
    '24 Supported Garages in (Your City)',
    'Own Damage Only'
  ];

  List<String> TabList = [
    'City',
    'RTO',
    'Manufacturer',
    'Model',
    'Variant',
    'Year',
  ];

  RxList<String> policyCityList = <String>[].obs;
  RxList<ManufacturerModel> ManufacturerList = <ManufacturerModel>[].obs;
  RxList<VehicleModelList> modelList = <VehicleModelList>[].obs;
  RxList<VehicleVariantList> variantList = <VehicleVariantList>[].obs;
  RxList<String> RtoList = <String>[].obs;


  List<String> selectOtherVariant = [
    'SF- STD ( 250 cc )',
    'SP Rear Disc (155 cc)',
    'Special Edition 2017 (155 cc)',
  ];

  List<String> yearList = [
    '2023',
    '2022',
    '2021',
    '2020',
    '2019',
    '2018',
    '2017',
    '2016',
    '2015',
    '2014',
    '2013',
    '2012',
    '2011',
    '2010',
    '2009',
    '2008',
    '2007',
    '2006',
    '2005',
    '2004',
    '2003',
    'Brand New Bike'
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    listTabs.add(BikeTabsModel(tabName: 'City', tabStatus: 2));
    listTabs.add(BikeTabsModel(tabName: 'RTO'));
    listTabs.add(BikeTabsModel(tabName: 'Manufacturer'));
    listTabs.add(BikeTabsModel(tabName: 'Model'));
    listTabs.add(BikeTabsModel(tabName: 'Variant'));
    listTabs.add(BikeTabsModel(tabName: 'Year'));
    dashboardController.fetchInsuranceSliderImages('1');
    policyCityList.clear();
    policyCityList.value = await bikeInsuranceController.fetchPolicyCityList();
    policyCityList.refresh();
  }

  @override
  void onClose() {}

  void setSelectedButton(String buttonName) {
    selectedButton.value = buttonName;
  }

  void setSelectButtonByIndex(int index) {
    switch (index) {
      case 0:
        return setSelectedButton('City');
      case 1:
        return setSelectedButton('RTO');
      case 2:
        return setSelectedButton('Manufacturer');
      case 3:
        return setSelectedButton('Model');
      case 4:
        return setSelectedButton('Variant');
      case 5:
        return setSelectedButton('Year');
    }
  }

  void setSelectedCity(String cityName) {
    selectedCity.value = cityName;
  }

  void setSelectedRTO(String RTOName) {
    selectedRTO.value = RTOName;
  }

  void setSelectedManufacturer(ManufacturerModel manuName) {
    selectedManufacturer.value = manuName;
  }

  void setSelectedModel(VehicleModelList modelName) {
    selectedModel.value = modelName;
  }

  void setSelectedVariant(VehicleVariantList variantName) {
    selectedVariant.value = variantName;
  }

  void setSelectedYear(String yearName) {
    selectedYear.value = yearName;
  }

  Future<void> findVehicleDetails(vehicle_num) async {
    if(buttonStatus.value == ButtonStatus.Loading){
      return;
    }
    buttonStatus.value = ButtonStatus.Loading;
    //searhc for verhicle details
    print('vehicle : ${vehicle_num.toString().replaceAll('-', '')}');
    apiClientProvider
        .verifyVehicleDetails(ReqVerifyVehicleDetails(
                registrationNumber: vehicle_num.toString().replaceAll('-', ''))
            .toJson())
        .then((res) async {
      buttonStatus.value = ButtonStatus.Active;
      bool success = await apiClientProvider.checkStatus(res);
      //{"StatusCode":401,"IsSuccess":false,"Message":"Invalid Token.","Result":null}
      if (success) {
        ResVerifyVehicleDetails resVerifyVehicleDetails =
            ResVerifyVehicleDetails.fromJson(res.body);
        try {

          //"present_address": "1146 GURU AMARDASS COLONY, NARAINGARH CHHEHARTA AMRITSAR, AMRITSAR, , Punjab, 0",
         // "present_address": "U-12 SHIVKEDARNATH FLAT, NR LALAV CHANDLODIA, AHMADABAD, , Gujarat, 382481",
          bikeInsuranceController.selectedCity.value = Utils.fetchCityFromAddress(resVerifyVehicleDetails.data.permanentAddress).trim();
           bikeInsuranceController.selectedRTO.value = vehicle_num.toString().replaceAll('-', '').substring(0,4);
          bikeInsuranceController.selectedManufacturer.value.name =
              resVerifyVehicleDetails.data.makerDescription;
          bikeInsuranceController.selectedModel.value.name =
              resVerifyVehicleDetails.data.makerModel;
          ;
          bikeInsuranceController.selectedVariant.value.name =
              resVerifyVehicleDetails.data.makerModel;
          bikeInsuranceController.selectedYear.value = resVerifyVehicleDetails
              .data.manufacturingDate
              .toString()
              .substring(resVerifyVehicleDetails.data.manufacturingDate
                      .toString()
                      .length -
                  4);

          twoWheelerPlanSelectionController.firstName = resVerifyVehicleDetails.data.ownerName;
          twoWheelerPlanSelectionController.lastName = resVerifyVehicleDetails.data.fatherName;
          Get.to(BikeDetailsView());
        } catch (_) {}
      }
      buttonStatus.value = ButtonStatus.Active;
    });

    //Get.to(PolicyQuoteListView());
  }

  Future<bool> fetchManufacturer({String city = ''}) async{
    ManufacturerList.clear();
    modelList.clear();
    variantList.clear();
    await apiClientProvider.getVehicleCompanyList('', 2).then((response) async {
      bool success = await apiClientProvider.checkStatus(response);
      if (success) {
        ManufacturerList.value =
            ResGetVehicleCompanyList.fromJson(response.body).data!;
        ManufacturerList.refresh();
        return true;
      }
    });
    return false;
  }

  Future<bool> fetchModelList(id) async {
    modelList.clear();
    variantList.clear();
    apiClientProvider.getVehicleModelList(id).then((response) async {
      bool success = await apiClientProvider.checkStatus(response);
      if (success) {
        modelList.value = ResGetVehicleModelList.fromJson(response.body).data!;
        modelList.refresh();

        return true;
      }
    });
    return false;
  }

  void fetchVariantList(id) {
    variantList.clear();
    apiClientProvider.getVehicleVariantList(id).then((response) async {
      bool success = await apiClientProvider.checkStatus(response);
      if (success) {
        variantList.value =
            ResGetVehicleVariantList.fromJson(response.body).data!;
        variantList.refresh();
      }
    });
  }

  Future<List<String>> fetchPolicyCityList({String city = ''}) async {

    Response<dynamic> response = await apiClientProvider.getPolicyCities(city);
    print('--city--${jsonEncode(response.body)}');
    bool success = await apiClientProvider.checkStatus(response, wantToShowDialog: false);
    if (success) {
      return ResGetPolicyCities.fromJson(response.body).data!;
    }else{
      return [];
    }
  }


  void fetchRTOList({String rto = ''}) {
    RtoList.clear();
    apiClientProvider.getCityRTO(rto).then((response) async {
      print('--city--${jsonEncode(response.body)}');
      bool success = await apiClientProvider.checkStatus(response);
      if (success) {
        RtoList.value = ResGetCityRto.fromJson(response.body).data!;
        RtoList.refresh();
      }
    });
  }


}
