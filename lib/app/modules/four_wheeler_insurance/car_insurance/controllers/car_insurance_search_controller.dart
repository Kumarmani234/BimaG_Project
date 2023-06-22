// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance/views/searchDetails/search_car_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../two_wheeler_insurance/two_wheeler_details/model/ResGetVehicleModelList.dart';
import '../../../two_wheeler_insurance/two_wheeler_details/model/ResGetVehicleVariantList.dart';

class CarInsuranceSearchController extends GetxController {
  Rx<TextEditingController> searchController = TextEditingController().obs;
  RxList<SearchCarDetailModel> searchDetailsList = <SearchCarDetailModel>[].obs;
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
    searchDetailsList.add(SearchCarDetailModel(
        id: 0,
        search_text: 'Can’t find your city?',
        appbar_title_text: 'Select City'));
    searchDetailsList.add(
      SearchCarDetailModel(
          id: 1,
          search_text: 'Can’t find your RTO?',
          appbar_title_text: 'Select RTO'),
    );
    searchDetailsList.add(
      SearchCarDetailModel(
          id: 2,
          search_text: 'Can’t find your four wheeler manufacturer?',
          appbar_title_text: 'Select Manufacturer'),
    );
    searchDetailsList.add(
      SearchCarDetailModel(
          id: 3,
          search_text: 'Can’t find your four wheeler Model?',
          appbar_title_text: 'Select Model'),
    );
    searchDetailsList.add(
      SearchCarDetailModel(
          id: 4,
          search_text: 'Can’t find your four wheeler Variant',
          appbar_title_text: 'Select Variant'),
    );
  }

  searchCity() {
    stringList.clear();
    stringList.refresh();
    selectedTabId = 0;
    fetchList('');
    Get.to(SearchCarDetailsView(
      selectedTabId: searchDetailsList[0].id,
      callbackData: (data) {
        print('data : $data');

        carInsuranceController.listTabs[0].tabStatus = 3;
        carInsuranceController.listTabs[0].tabName = data.toString();
        carInsuranceController.selectedCity.value = data.toString();
        carInsuranceController.listTabs.refresh();
        carInsuranceController.setSelectedButton('RTO');
        carInsuranceController.listTabs[1].tabName = 'RTO';
        carInsuranceController.listTabs[1].tabStatus = 2;
        carInsuranceController.selectedRTO.value = '';
        carInsuranceController.fetchRTOList(rto: data.toString());
        Get.back();
      },
    ));
  }

  searchRTO(String rto) {
    print('rto : $rto');
    searchController.value.text = '';
    selectedTabId = 1;
    fetchList(rto);
    Get.to(SearchCarDetailsView(
      selectedTabId: searchDetailsList[1].id,
      callbackData: (data) {
        carInsuranceController.selectedRTO.value = data.toString();
        Future.delayed(Duration(milliseconds: 150), () {
          carInsuranceController.listTabs[1].tabStatus = 3;
          carInsuranceController.listTabs[1].tabName = data.toString();
          carInsuranceController.listTabs.refresh();
          if (carInsuranceController.selectedManufacturer.value.name != null) {
            carInsuranceController.listTabs[2].tabStatus = 2;
          }
          print(
              'selectedRTO : ${carInsuranceController.selectedManufacturer.value}');

          carInsuranceController.setSelectedButton('Manufacturer');
          carInsuranceController.fetchManufacturer();
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
    Get.to(SearchCarDetailsView(
      selectedTabId: searchDetailsList[2].id,
      callbackData: (data) {
        for (int i = 0;
            i < carInsuranceController.ManufacturerList.length;
            i++) {
          if (carInsuranceController.ManufacturerList[i].name!.toLowerCase() ==
              data.toString().toLowerCase()) {
            carInsuranceController.selectedManufacturer.value =
                carInsuranceController.ManufacturerList[i];
          }
        }

        Future.delayed(
          Duration(milliseconds: 150),
          () {
            carInsuranceController.listTabs[2].tabStatus = 3;
            carInsuranceController.listTabs[2].tabName = data.toString();
            carInsuranceController.listTabs.refresh();
            carInsuranceController.setSelectedButton('Model');
            carInsuranceController.listTabs[3].tabName = 'Model';
            carInsuranceController.listTabs[3].tabStatus = 2;
            carInsuranceController.selectedModel.value = VehicleModelList();

            //variant
            carInsuranceController.listTabs[4].tabName = 'Variant';
            carInsuranceController.listTabs[4].tabStatus = 1;
            carInsuranceController.selectedVariant.value = VehicleVariantList();

            //year
            carInsuranceController.listTabs[5].tabName = 'Year';
            carInsuranceController.listTabs[5].tabStatus = 1;
            carInsuranceController.selectedYear.value = '';
            carInsuranceController.fetchModelList(
                carInsuranceController.selectedManufacturer.value.id);
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
    Get.to(SearchCarDetailsView(
      selectedTabId: searchDetailsList[3].id,
      callbackData: (data) {
        for (int i = 0; i < carInsuranceController.modelList.length; i++) {
          if (carInsuranceController.modelList[i].name!.toLowerCase() ==
              data.toString().toLowerCase()) {
            carInsuranceController.selectedModel.value =
                carInsuranceController.modelList[i];
          }
        }

        Future.delayed(Duration(milliseconds: 150), () {
          carInsuranceController.listTabs[3].tabStatus = 3;
          carInsuranceController.listTabs[3].tabName = data.toString();
          carInsuranceController.listTabs.refresh();
          carInsuranceController.listTabs[4].tabStatus = 2;
          carInsuranceController.setSelectedButton('Variant');

          //variant
          carInsuranceController.listTabs[4].tabName = 'Variant';
          carInsuranceController.listTabs[4].tabStatus = 2;
          carInsuranceController.selectedVariant.value = VehicleVariantList();

          carInsuranceController
              .fetchVariantList(carInsuranceController.selectedModel.value.id);
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
    Get.to(SearchCarDetailsView(
      selectedTabId: searchDetailsList[4].id,
      callbackData: (data) {
        carInsuranceController.selectedVariant.value =
            VehicleVariantList(name: data.toString());
        Future.delayed(Duration(milliseconds: 150), () {
          carInsuranceController.listTabs[4].tabStatus = 3;
          carInsuranceController.listTabs[4].tabName = data.toString();
          carInsuranceController.listTabs.refresh();
          carInsuranceController.listTabs[5].tabStatus = 2;
          carInsuranceController.setSelectedButton('Year');
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
          await carInsuranceController.fetchPolicyCityList(city: str);
      tempList.clear();
      for (String str in stringList) {
        tempList.add(str);
      }
      stringList.refresh();
    }
    //rto
    else if (ids == 1) {
      stringList.clear();
      print('lenght rtolist : ${carInsuranceController.RtoList.length}');
      for (int i = 0; i < carInsuranceController.RtoList.length; i++) {
        stringList.add(carInsuranceController.RtoList[i]);
      }

      tempList.clear();
      print('string list $str: 169 ----- ${stringList.length}');
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
    // manufacturer
    else if (ids == 2) {
      stringList.clear();
      print(
          'lenght rtolist : ${carInsuranceController.ManufacturerList.length}');
      for (int i = 0; i < carInsuranceController.ManufacturerList.length; i++) {
        stringList.add(carInsuranceController.ManufacturerList[i].name ?? '');
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
      print('lenght rtolist : ${carInsuranceController.modelList.length}');
      for (int i = 0; i < carInsuranceController.modelList.length; i++) {
        stringList.add(carInsuranceController.modelList[i].name ?? '');
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
      print('lenght rtolist : ${carInsuranceController.variantList.length}');
      for (int i = 0; i < carInsuranceController.variantList.length; i++) {
        stringList.add(carInsuranceController.variantList[i].name ?? '');
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

class SearchCarDetailModel {
  int id;
  String search_text;
  String appbar_title_text;

  SearchCarDetailModel({
    required this.id,
    required this.search_text,
    required this.appbar_title_text,
  });
}
