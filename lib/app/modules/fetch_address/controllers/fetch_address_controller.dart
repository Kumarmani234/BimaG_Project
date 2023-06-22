import 'dart:async';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/fetch_address/model/ReqGetAddressByPincode.dart';
import 'package:bima_g/app/modules/fetch_address/model/ResStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../two_wheeler_insurance/two_wheeler_details/model/ResCities.dart';
import '../model/ResGetAddressByPincode.dart';

class FetchAddressController extends GetxController {
  TextEditingController streetAddressCon = TextEditingController();
  TextEditingController pincodeCon = TextEditingController();

  Rx<bool> isUserKnowPincode = true.obs;
  StreamController<String> streamController = StreamController();

  RxList<PincodeList> listAreas = <PincodeList>[].obs;
  RxList<String> listStates = <String>[].obs;
  RxList<String> listDistricts = <String>[].obs;
  RxList<CitiesList> listCities = <CitiesList>[].obs;

  int? selectedPincode;

  @override
  void onInit() {
    super.onInit();
    streamController.stream.debounce(Duration(seconds: 1)).listen((s) {
      if (s.toString().length >= 5) {
        getAddressByPincode(s);
      }
      // your code
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void clearVeriables() {
    streetAddressCon.text = '';
    pincodeCon.text = '';
  }

  void getAddressByPincode(pinCode) {
    listAreas.clear();
    listAreas.refresh();
    apiClientProvider
        .getAddressByPincode(ReqGetAddressByPincode(pinCode: pinCode).toJson())
        .then((value) async {
      bool success = await apiClientProvider.checkStatus(value);
      if (success) {
        ResGetAddressByPincode resGetAddressByPincode =
            ResGetAddressByPincode.fromJson(value.body);
        listAreas.clear();
        listAreas.addAll(resGetAddressByPincode.data);
        listAreas.refresh();
      }
    });
  }

  void fetchStates() {
    listStates.clear();
    listStates.refresh();
    listDistricts.clear();
    listDistricts.refresh();
    listCities.clear();
    listCities.refresh();
    apiClientProvider.states().then((value) async {
      bool success = await apiClientProvider.checkStatus(value);
      if (success) {
        listStates.value = ResStates.fromJson(value.body).data ?? [];
        listStates.refresh();
      }
    });
  }

  void fetchDistricts(stateName) {
    listDistricts.clear();
    listDistricts.refresh();
    listCities.clear();
    listCities.refresh();
    apiClientProvider.districts(stateName).then((value) async {
      bool success = await apiClientProvider.checkStatus(value);
      if (success) {
        listDistricts.value = ResStates.fromJson(value.body).data ?? [];
        listDistricts.refresh();
      }
    });
  }

  void fetchCities({String district = ''}) {
    listCities.clear();
    apiClientProvider.cities(district).then((response) async {
      bool success = await apiClientProvider.checkStatus(response);
      if (success) {
        listCities.value = ResCities.fromJson(response.body).data!;
        listCities.refresh();
      }
    });
  }
}
