import 'dart:convert';

import 'package:bima_g/app/enums.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/profile_assets/model/ReqManageProperty.dart';
import 'package:bima_g/app/modules/profile_assets/model/ReqManageVehicle.dart';
import 'package:bima_g/app/modules/profile_assets/model/ResGetProperty.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../utility/utils.dart';
import '../../../widgets/dialogs.dart';
import '../../profile/model/radio_selection_model.dart';
import '../../two_wheeler_insurance/two_wheeler_details/model/ResGetVehicleCompanyList.dart';
import '../../two_wheeler_insurance/two_wheeler_details/model/ResGetVehicleModelList.dart';
import '../../two_wheeler_insurance/two_wheeler_details/model/ResGetVehicleVariantList.dart';
import '../model/ResGetVehicles.dart';
import '../views/add_new_assets_form_view.dart';

class ProfileAssetsController extends GetxController {
  Rx<ApiStatus> apiStatus = ApiStatus.Loading.obs;

  RxList<Vehicle> vehicleList = <Vehicle>[].obs;
  RxList<UserProperty> propertyList = <UserProperty>[].obs;
  RxList<RadioSelectionModel> assetTypeRadioList = <RadioSelectionModel>[].obs;
  RxList<RadioSelectionModel> fuelTypeList = <RadioSelectionModel>[].obs;
  Rx<String> selectSubTypeText = 'Select Vehicle Type'.obs;
  Rx<RadioSelectionModel>? selectedAssetType =
      RadioSelectionModel(text: 'Vehicle', key: '1', isChecked: true, id: 0)
          .obs;
  Rx<RadioSelectionModel>? selectedAssetSubType =
      RadioSelectionModel(text: 'Two Wheeler', key: '1', isChecked: true, id: 0)
          .obs;

  Rx<RadioSelectionModel>? StructureValue =
      RadioSelectionModel(text: 'Yes', key: 'Yes', isChecked: true, id: 0).obs;

  Rx<TextEditingController> assetsCityNameController =
      TextEditingController().obs;

  RxList<RadioSelectionModel> assetSubTypeRadioList =
      <RadioSelectionModel>[].obs;

  Rx<RadioSelectionModel>? selectedFuelType;

  int editVehicleID = 0, editPropertyID = 0;

  ManufacturerModel? selectedManufaturer;
  VehicleModelList? selectedVehicleModel;
  VehicleVariantList? selectedVehicleVariant;
  Rx<DateTime> selectedExpiryDate = DateTime.now().obs;

  Rx<TextEditingController> assetsRegController = TextEditingController().obs;
  Rx<TextEditingController> assetsAgePropertyController =
      TextEditingController(text: '5').obs;
  RxList<RadioSelectionModel> StructureValueList = <RadioSelectionModel>[].obs;
  Rx<TextEditingController> asetsStructureValueController =
      TextEditingController().obs;
  Rx<TextEditingController> expiryPropertyDatecontroller =
      TextEditingController().obs;

  Rx<String> selectedVehicleRegistrationYear =
      DateTime.now().year.toString().obs;
  Rx<ButtonStatus> formButtonStatus = ButtonStatus.Active.obs;

  Rx<DateTime?> slectedProAssetExpDate = Rx<DateTime?>(null);

  RefreshController assetsRefreshController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    fuelTypeAdd();
    assetTypeRadio();
    assetSubTypeRadio();
    fetchVehicles();
    fetchProperties();
    structureValue();
  }

  @override
  void onClose() {}

  void onSubtypeRadioChange(index) {
    for (int j = 0; j < assetSubTypeRadioList.length; j++) {
      assetSubTypeRadioList[j].isChecked = false;
    }
    assetSubTypeRadioList[index].isChecked = true;
    selectedAssetSubType!.value = assetSubTypeRadioList[index];
    assetSubTypeRadioList.refresh();
  }

  void onTypeRadioChange(index) {
    for (int j = 0; j < assetTypeRadioList.length; j++) {
      assetTypeRadioList[j].isChecked = false;
    }
    assetTypeRadioList[index].isChecked = true;
    selectedAssetType!.value = assetTypeRadioList[index];
    assetTypeRadioList.refresh();

    //check the condition for vechicle insurance or other for change the text.
    if (assetTypeRadioList[index].text == 'Property') {
      assetSubTypeRadioList[0].text = 'Rented';
      assetSubTypeRadioList[1].text = 'Owned';
      selectSubTypeText.value = "Select Property Type";
    } else {
      assetSubTypeRadioList[0].text = 'Two Wheeler';
      assetSubTypeRadioList[1].text = 'Four Wheeler';
      assetSubTypeRadioList[0].key = '1';
      assetSubTypeRadioList[1].key = '2';
      selectSubTypeText.value = "Select Vehicle Type";
    }
    assetTypeRadioList.refresh();
    assetSubTypeRadioList.refresh();
  }

  void assetTypeRadio() {
    assetTypeRadioList.clear();
    assetTypeRadioList.add(
        RadioSelectionModel(text: 'Vehicle', key: '1', isChecked: true, id: 0));
    assetTypeRadioList.add(RadioSelectionModel(
        text: 'Property', key: '2', isChecked: false, id: 1));
  }

  void assetSubTypeRadio() {
    assetSubTypeRadioList.clear();
    assetSubTypeRadioList.add(RadioSelectionModel(
        text: 'Two Wheeler', key: '1', isChecked: true, id: 0));
    assetSubTypeRadioList.add(RadioSelectionModel(
        text: 'Four Wheeler', key: '2', isChecked: false, id: 1));
  }

  void fetchVehicles() {
    apiClientProvider.getVehicles().then((response) async {
      // bool success = await apiClientProvider.checkStatus(response,
      //     wantToShowDialog: false);
      if (response.body['code'] == 1) {
        vehicleList.value =
            ResGetVehicles.fromJson(response.body).data.vehicles ?? [];
        vehicleList.refresh();
      }
    });
  }

  void fetchProperties() {
    apiClientProvider.getProperties().then((response) async {
      // bool success = await apiClientProvider.checkStatus(response,
      //     wantToShowDialog: false);
      Utils.printLog(jsonEncode(response.body));
      if (response.body['code'] == 1) {
        propertyList.value =
            ResGetProperties.fromJson(response.body).data.userProperties;
        propertyList.refresh();
      }
    });
  }

  void onSubmitVehicleDetails() {}

  void addEditNewVehicle() {
    if (formButtonStatus.value == ButtonStatus.Loading) {
      return;
    }

    print('----inedit vehicle-----');
    if (selectedManufaturer == null) {
      print('manufaturer not selected');
      Get.snackbar('Vehicle', 'Please select vehicle manufacturer');
      HapticFeedback.mediumImpact();
      return;
    } else if (selectedVehicleModel == null) {
      print('model not selected');
      HapticFeedback.mediumImpact();
      Get.snackbar('Vehicle', 'Please select vehicle model');
      return;
    } else if (selectedVehicleVariant == null) {
      print('variant not selected');
      HapticFeedback.mediumImpact();
      Get.snackbar('Vehicle', 'Please select vehicle variant');
      return;
    } else {
      //success validation
      formButtonStatus.value = ButtonStatus.Loading;
      ReqManageVehicle reqManageVehicle = ReqManageVehicle(
          make: selectedManufaturer!.id.toString(),
          fuelType: selectedFuelType!.value.key.toString(),
          model: selectedVehicleModel!.id.toString(),
          policyExpiryDate:
              selectedExpiryDate.value.toString().substring(0, 10),
          registrationNumber: assetsRegController.value.text,
          registrationYear: selectedVehicleRegistrationYear.value,
          type: selectedAssetSubType!.value.key,
          variant: selectedVehicleVariant!.id.toString(),
          vehicleId: editVehicleID);
      print(jsonEncode(reqManageVehicle));

      apiClientProvider
          .manageVehicle(reqManageVehicle.toJson())
          .then((response) async {
        formButtonStatus.value = ButtonStatus.Active;
        // bool success = await apiClientProvider.checkStatus(response);

        if (response.body['code'] == 1) {
          fetchVehicles();
          Get.back();
        }
      });
    }
  }

  void addEditProperty() {
    if (formButtonStatus.value == ButtonStatus.Loading) {
      return;
    }
    //success validation
    formButtonStatus.value = ButtonStatus.Loading;
    ReqManageProperty reqManageProperty = ReqManageProperty(
      propertyId: editPropertyID,
      propertyType: int.parse(selectedAssetSubType!.value.key),
      isInsured:
          StructureValue!.value.key.toLowerCase() == 'yes' ? true : false,
      propertyAge: int.parse(assetsAgePropertyController.value.text),
      policyExpiryDate: slectedProAssetExpDate.value,
      propertyCity: assetsCityNameController.value.text,
      propertyValue: int.parse(
          asetsStructureValueController.value.text.replaceAll(',', '')),
    );

    apiClientProvider
        .manageProperty(reqManageProperty.toJson())
        .then((response) async {
      formButtonStatus.value = ButtonStatus.Active;
      formButtonStatus.value == ButtonStatus.Active;
      // bool success = await apiClientProvider.checkStatus(response);
      if (response.body['code'] == 1) {
        fetchProperties();
        Get.back();
      }
    });
    print('added property : ${reqManageProperty.toJson()}');
  }

  void fuelTypeAdd() {
    fuelTypeList.add(
        RadioSelectionModel(text: 'Petrol', key: '1', isChecked: true, id: 1));
    fuelTypeList.add(
        RadioSelectionModel(text: 'Diesel', key: '2', isChecked: false, id: 2));
    selectedFuelType = fuelTypeList.first.obs;
  }

  onEditVehicle(Vehicle vehicleModel) async {
    editVehicleID = vehicleModel.vehicleId ?? 0;

    profileAssetsController.assetsRegController.value.text =
        vehicleModel.registrationNumber!;
    profileAssetsController.selectedVehicleRegistrationYear.value =
        vehicleModel.registrationYear!;
    for (int i = 0; i < fuelTypeList.length; i++) {
      if (fuelTypeList[i].key == vehicleModel.fuelType.toString()) {
        profileAssetsController.selectedFuelType!.value = fuelTypeList[i];
      }
    }

    for (int i = 0;
        i < profileAssetsController.assetTypeRadioList.length;
        i++) {
      profileAssetsController.assetTypeRadioList[i].isChecked = false;
      if (profileAssetsController.assetTypeRadioList[i].key == '1') {
        profileAssetsController.assetTypeRadioList[i].isChecked = true;
      }
    }
    print(vehicleModel.type);
    onTypeRadioChange(0);

    if (vehicleModel.type == 1) {
      profileAssetsController.assetSubTypeRadioList[0].isChecked = false;
      profileAssetsController.assetSubTypeRadioList[1].isChecked = true;
    } else {
      profileAssetsController.assetSubTypeRadioList[0].isChecked = true;
      profileAssetsController.assetSubTypeRadioList[1].isChecked = false;
    }

    selectedExpiryDate.value = vehicleModel.policyExpiryDate ?? DateTime.now();

    if (vehicleModel.type == 1) {
      if (carInsuranceController.ManufacturerList.isNotEmpty) {
        getMakeModelVariantCar(vehicleModel);
      } else {
        await carInsuranceController.fetchManufacturer();
        getMakeModelVariantCar(vehicleModel);
      }
    } else {
      if (bikeInsuranceController.ManufacturerList.isNotEmpty) {
        getMakeModelVariantBike(vehicleModel);
      } else {
        await bikeInsuranceController.fetchManufacturer();
        getMakeModelVariantBike(vehicleModel);
      }
    }

    // Get.to(AddNewAssetsFormView());
  }

  onEditProperty(UserProperty propertyModel) async {
    editPropertyID = propertyModel.propertyId ?? 0;

    assetsCityNameController.value.text = propertyModel.propertyCity!;
    assetsAgePropertyController.value.text =
        propertyModel.propertyAge.toString();
    asetsStructureValueController.value.text =
        propertyModel.propertyValue.toString();

    //need to disable and reslesect all the values
    StructureValueList[0].isChecked = false;
    StructureValueList[1].isChecked = false;

    if (propertyModel.isInsured ?? true) {
      StructureValueList[0].isChecked = true;
    } else {
      StructureValueList[1].isChecked = true;
    }

    StructureValueList.refresh();

    onTypeRadioChange(1);

    profileAssetsController.assetTypeRadioList[1].isChecked = true;
    profileAddressController.refresh();

    print(propertyModel.propertyType);

    for (int i = 0;
        i < profileAssetsController.assetSubTypeRadioList.length;
        i++) {
      profileAssetsController.assetSubTypeRadioList[i].isChecked = false;
      if (profileAssetsController.assetSubTypeRadioList[i].key ==
          propertyModel.propertyType.toString()) {
        profileAssetsController.assetSubTypeRadioList[i].isChecked = true;
      }
    }

    slectedProAssetExpDate.value =
        propertyModel.policyExpiryDate ?? DateTime.now();
    String formattedDate =
        '${slectedProAssetExpDate.value!.day.toString().padLeft(2, '0')} ${Utils.getMonthName(slectedProAssetExpDate.value!.month)} ${slectedProAssetExpDate.value!.year}';
    expiryPropertyDatecontroller.value.text = formattedDate;
    Get.to(AddNewAssetsFormView());
  }

  getMakeModelVariantBike(Vehicle vehicleModel) async {
    for (int i = 0; i < bikeInsuranceController.ManufacturerList.length; i++) {
      print(
          'vehilce id :${bikeInsuranceController.ManufacturerList[i].name}    ++++     ${vehicleModel.vehicleCompanyName}');
      if (bikeInsuranceController.ManufacturerList[i].name.toString() ==
          vehicleModel.vehicleCompanyName) {
        selectedManufaturer = bikeInsuranceController.ManufacturerList[i];
        print(
            'selectedManufaturer : ${bikeInsuranceController.ManufacturerList[i].id}');
        selectedVehicleModel = VehicleModelList(
          id: vehicleModel.model ?? 0,
          name: vehicleModel.vehicleModelName,
        );

        selectedVehicleVariant = VehicleVariantList(
          id: vehicleModel.variant ?? 0,
          name: vehicleModel.vehicleVarientName,
        );
        Get.to(AddNewAssetsFormView());
        /*await bikeInsuranceController.fetchModelList(profileAssetsController.selectedManufaturer!.id);

          for(int j=0;j<bikeInsuranceController.modelList.length;j++){
            if(bikeInsuranceController.modelList[]){

            }
          }*/
      }
    }
  }

  getMakeModelVariantCar(Vehicle vehicleModel) async {
    for (int i = 0; i < carInsuranceController.ManufacturerList.length; i++) {
      print(
          'vehilce id :${carInsuranceController.ManufacturerList[i].name}    ++++     ${vehicleModel.vehicleCompanyName}');
      if (carInsuranceController.ManufacturerList[i].name.toString() ==
          vehicleModel.vehicleCompanyName) {
        selectedManufaturer = carInsuranceController.ManufacturerList[i];
        print(
            'selectedManufaturer : ${carInsuranceController.ManufacturerList[i].id}');
        selectedVehicleModel = VehicleModelList(
          id: vehicleModel.model ?? 0,
          name: vehicleModel.vehicleModelName,
        );

        selectedVehicleVariant = VehicleVariantList(
          id: vehicleModel.variant ?? 0,
          name: vehicleModel.vehicleVarientName,
        );
        Get.to(AddNewAssetsFormView());
        /*await bikeInsuranceController.fetchModelList(profileAssetsController.selectedManufaturer!.id);

          for(int j=0;j<bikeInsuranceController.modelList.length;j++){
            if(bikeInsuranceController.modelList[]){

            }
          }*/
      }
    }
  }

  deleteAssets() {
    Dialogs.showAlertDialog('Delete Asset',
        subTitle: 'Are you sure you want to delete asset ?',
        leftButtonText: 'Cancel',
        rightButtonText: 'Delete', onRightButtonClick: () {
      print('on delete button clicked');
      Get.back();
    });
  }

  void onStructureValueChange(index) {
    for (int j = 0; j < StructureValueList.length; j++) {
      StructureValueList[j].isChecked = false;
    }
    StructureValueList[index].isChecked = true;
    StructureValue!.value = StructureValueList[index];
    StructureValueList.refresh();
  }

  void structureValue() {
    StructureValueList.add(
        RadioSelectionModel(text: 'Yes', key: 'Yes', isChecked: true, id: 0));
    StructureValueList.add(
        RadioSelectionModel(text: 'No', key: 'No', isChecked: false, id: 1));
  }

  onProperyAssExpiryDatePickerTap(context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: slectedProAssetExpDate.value ?? DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2000, 1, 1), // set first date to 1 Jan 2000
        lastDate: DateTime(2101));
    if (picked != null && picked != slectedProAssetExpDate.value) {
      slectedProAssetExpDate.value = picked;
      String formattedDate =
          '${picked.day.toString().padLeft(2, '0')} ${Utils.getMonthName(picked.month)} ${picked.year}';

      expiryPropertyDatecontroller.value.text = formattedDate;
    }
  }

  onRefresh() {
    Future.delayed(
        Duration(seconds: 2), () => assetsRefreshController.refreshCompleted());

    fetchProperties();
    fetchVehicles();
  }
}
