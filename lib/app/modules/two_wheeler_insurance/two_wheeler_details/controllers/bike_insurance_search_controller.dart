import 'dart:async';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_details/model/ResGetVehicleModelList.dart';
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_details/model/ResGetVehicleVariantList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/searchDetails/search_bike_details_view.dart';

class BikeInsuranceSearchController extends GetxController {
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxList<SearchBikeDetailModel> searchDetailsList =
      <SearchBikeDetailModel>[].obs;
  int selectedTabId = 0;

  //fetch data for city, rto, model, maker, variant
  RxList<String> stringList = <String>[].obs;
  List<String> tempList = [];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    addSearchFieldData();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void addSearchFieldData() {
    searchDetailsList.add(SearchBikeDetailModel(
        id: 0,
        search_text: 'Can’t find your city?',
        appbar_title_text: 'Select City'));
    searchDetailsList.add(
      SearchBikeDetailModel(
          id: 1,
          search_text: 'Can’t find your RTO?',
          appbar_title_text: 'Select RTO'),
    );
    searchDetailsList.add(
      SearchBikeDetailModel(
          id: 2,
          search_text: 'Can’t find your two wheeler manufacturer?',
          appbar_title_text: 'Select Manufacturer'),
    );
    searchDetailsList.add(
      SearchBikeDetailModel(
          id: 3,
          search_text: 'Can’t find your two wheeler Model?',
          appbar_title_text: 'Select Model'),
    );
    searchDetailsList.add(
      SearchBikeDetailModel(
          id: 4,
          search_text: 'Can’t find your two wheeler Variant',
          appbar_title_text: 'Select Variant'),
    );
  }

  searchCity() {
    stringList.clear();
    stringList.refresh();
    selectedTabId = 0;
    fetchList('');
    Get.to(SearchBikeDetailsView(
      selectedTabId: searchDetailsList[0].id,
      callbackData: (data) {
        print('data : $data');

        bikeInsuranceController.listTabs[0].tabStatus = 3;
        bikeInsuranceController.selectedCity.value = data.toString();
        bikeInsuranceController.listTabs[0].tabName = data.toString();
        bikeInsuranceController.listTabs.refresh();
        bikeInsuranceController.setSelectedButton('RTO');
        bikeInsuranceController.listTabs[1].tabName = 'RTO';
        bikeInsuranceController.listTabs[1].tabStatus = 2;
        bikeInsuranceController.selectedRTO.value = '';
        bikeInsuranceController.fetchRTOList(rto: data.toString());
        Get.back();
      },
    ));
  }

  searchRTO(String rto) {
    print('rto : $rto');
    searchController.value.text = '';
    selectedTabId = 1;
    fetchList(rto);
    Get.to(SearchBikeDetailsView(
      selectedTabId: searchDetailsList[1].id,
      callbackData: (data) {
        bikeInsuranceController.selectedRTO.value = data.toString();
        Future.delayed(Duration(milliseconds: 150), () {
          bikeInsuranceController.listTabs[1].tabStatus = 3;
          bikeInsuranceController.listTabs[1].tabName = data.toString();
          bikeInsuranceController.listTabs.refresh();
          if (bikeInsuranceController.selectedManufacturer.value.name != null) {
            bikeInsuranceController.listTabs[2].tabStatus = 2;
          }
          print(
              'selectedRTO : ${bikeInsuranceController.selectedManufacturer.value}');

          bikeInsuranceController.setSelectedButton('Manufacturer');
          bikeInsuranceController.fetchManufacturer();
        });
        Get.back();
      },
    ));
  }

  searchManufacture(String manufacture) {
    print('manufacture : $manufacture');
    searchController.value.text = '';
    selectedTabId = 2;
    fetchList(manufacture);
    Get.to(SearchBikeDetailsView(
      selectedTabId: searchDetailsList[2].id,
      callbackData: (data) {
        for (int i = 0;
            i < bikeInsuranceController.ManufacturerList.length;
            i++) {
          if (bikeInsuranceController.ManufacturerList[i].name!.toLowerCase() ==
              data.toString().toLowerCase()) {
            bikeInsuranceController.selectedManufacturer.value =
                bikeInsuranceController.ManufacturerList[i];
          }
        }

        Future.delayed(
          Duration(milliseconds: 150),
          () {
            bikeInsuranceController.listTabs[2].tabStatus = 3;
            bikeInsuranceController.listTabs[2].tabName = data.toString();
            bikeInsuranceController.listTabs.refresh();
            bikeInsuranceController.setSelectedButton('Model');
            bikeInsuranceController.listTabs[3].tabName = 'Model';
            bikeInsuranceController.listTabs[3].tabStatus = 2;
            bikeInsuranceController.selectedModel.value = VehicleModelList();

            //variant
            bikeInsuranceController.listTabs[4].tabName = 'Variant';
            bikeInsuranceController.listTabs[4].tabStatus = 1;
            bikeInsuranceController.selectedVariant.value =
                VehicleVariantList();

            //year
            bikeInsuranceController.listTabs[5].tabName = 'Year';
            bikeInsuranceController.listTabs[5].tabStatus = 1;
            bikeInsuranceController.selectedYear.value = '';
            bikeInsuranceController.fetchModelList(
                bikeInsuranceController.selectedManufacturer.value.id);
          },
        );
        Get.back();
      },
    ));
  }

  searchModel(String model) {
    print('model : $model');
    searchController.value.text = '';
    selectedTabId = 3;
    fetchList(model);
    Get.to(SearchBikeDetailsView(
      selectedTabId: searchDetailsList[3].id,
      callbackData: (data) {
        for (int i = 0; i < bikeInsuranceController.modelList.length; i++) {
          if (bikeInsuranceController.modelList[i].name!.toLowerCase() ==
              data.toString().toLowerCase()) {
            bikeInsuranceController.selectedModel.value =
                bikeInsuranceController.modelList[i];
          }
        }

        Future.delayed(Duration(milliseconds: 150), () {
          bikeInsuranceController.listTabs[3].tabStatus = 3;
          bikeInsuranceController.listTabs[3].tabName = data.toString();
          bikeInsuranceController.listTabs.refresh();
          bikeInsuranceController.listTabs[4].tabStatus = 2;
          bikeInsuranceController.setSelectedButton('Variant');

          //variant
          bikeInsuranceController.listTabs[4].tabName = 'Variant';
          bikeInsuranceController.listTabs[4].tabStatus = 2;
          bikeInsuranceController.selectedVariant.value = VehicleVariantList();

          bikeInsuranceController
              .fetchVariantList(bikeInsuranceController.selectedModel.value.id);
        });
        Get.back();
      },
    ));
  }

  searchVariant(String variant) {
    print('variant : $variant');
    searchController.value.text = '';
    selectedTabId = 4;
    fetchList(variant);
    Get.to(SearchBikeDetailsView(
      selectedTabId: searchDetailsList[4].id,
      callbackData: (data) {
        bikeInsuranceController.selectedVariant.value =
            VehicleVariantList(name: data.toString());
        Future.delayed(Duration(milliseconds: 150), () {
          bikeInsuranceController.listTabs[4].tabStatus = 3;
          bikeInsuranceController.listTabs[4].tabName = data.toString();
          bikeInsuranceController.listTabs.refresh();
          bikeInsuranceController.listTabs[5].tabStatus = 2;
          bikeInsuranceController.setSelectedButton('Year');
        });
        Get.back();
      },
    ));
  }

  Future<void> fetchList(String str) async {
    int ids = selectedTabId;
    print('selected ids : $ids');
    if (ids == 0) {
      //city
      stringList.clear();
      stringList.value =
          await bikeInsuranceController.fetchPolicyCityList(city: str);
      tempList.clear();
      for (String str in stringList) {
        tempList.add(str);
      }
      stringList.refresh();
    }

    //rto
    else if (ids == 1) {
      stringList.clear();
      print('lenght rtolist : ${bikeInsuranceController.RtoList.length}');
      for (int i = 0; i < bikeInsuranceController.RtoList.length; i++) {
        stringList.add(bikeInsuranceController.RtoList[i]);
      }

      tempList.clear();
      print('string list $str: 169 ----- ${stringList.value.length}');
      if (str.isNotEmpty) {
        for (int i = 0; i < stringList.length; i++) {
          if (stringList[i]
              .toLowerCase()
              .contains(searchController.value.text.toLowerCase())) {
            print('data : ${stringList[i]}');
            tempList.add(stringList[i]);
          }
        }
        stringList.clear();
        for (int i = 0; i < tempList.length; i++) {
          stringList.add(tempList[i]);
        }
        stringList.refresh();
      }
      stringList.refresh();
    }

    //manufacturer
    else if (ids == 2) {
      stringList.clear();
      print(
          'lenght rtolist : ${bikeInsuranceController.ManufacturerList.length}');
      for (int i = 0;
          i < bikeInsuranceController.ManufacturerList.length;
          i++) {
        stringList.add(bikeInsuranceController.ManufacturerList[i].name ?? '');
      }

      print('string list $str: 169 ----- ${stringList.value.length}');
      if (searchController.value.text.isNotEmpty) {
        tempList.clear();
        for (int i = 0; i < stringList.length; i++) {
          if (stringList[i]
              .toLowerCase()
              .contains(searchController.value.text.toLowerCase())) {
            print('data : ${stringList[i]}');
            tempList.add(stringList[i]);
          }
        }
        stringList.clear();
        for (int i = 0; i < tempList.length; i++) {
          stringList.add(tempList[i]);
        }
        stringList.refresh();
      }
      stringList.refresh();
    }

    //model
    else if (ids == 3) {
      stringList.clear();
      print('lenght rtolist : ${bikeInsuranceController.modelList.length}');
      for (int i = 0; i < bikeInsuranceController.modelList.length; i++) {
        stringList.add(bikeInsuranceController.modelList[i].name ?? '');
      }

      tempList.clear();
      print('string list $str: 169 ----- ${stringList.value.length}');
      if (str.isNotEmpty) {
        for (int i = 0; i < stringList.length; i++) {
          if (stringList[i]
              .toLowerCase()
              .contains(searchController.value.text.toLowerCase())) {
            print('data : ${stringList[i]}');
            tempList.add(stringList[i]);
          }
        }
        stringList.clear();
        for (int i = 0; i < tempList.length; i++) {
          stringList.add(tempList[i]);
        }
        stringList.refresh();
      }
      stringList.refresh();
    }

    //variant
    else if (ids == 4) {
      stringList.clear();
      print('lenght rtolist : ${bikeInsuranceController.variantList.length}');
      for (int i = 0; i < bikeInsuranceController.variantList.length; i++) {
        stringList.add(bikeInsuranceController.variantList[i].name ?? '');
      }

      tempList.clear();
      print('string list $str: 169 ----- ${stringList.value.length}');
      if (str.isNotEmpty) {
        for (int i = 0; i < stringList.length; i++) {
          if (stringList[i]
              .toLowerCase()
              .contains(searchController.value.text.toLowerCase())) {
            print('data : ${stringList[i]}');
            tempList.add(stringList[i]);
          }
        }
        stringList.clear();
        for (int i = 0; i < tempList.length; i++) {
          stringList.add(tempList[i]);
        }
        stringList.refresh();
      }
      stringList.refresh();
    }
  }
}

class SearchBikeDetailModel {
  int id;
  String search_text;
  String appbar_title_text;

  SearchBikeDetailModel({
    required this.id,
    required this.search_text,
    required this.appbar_title_text,
  });
}
