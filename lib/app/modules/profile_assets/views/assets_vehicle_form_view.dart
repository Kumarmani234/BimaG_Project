import 'package:bima_g/app/widgets/date_of_birth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../module_controllers.dart';
import '../../../widgets/drop_down.dart';
import '../../../widgets/textfields.dart';
import '../../profile/model/radio_selection_model.dart';
import '../../two_wheeler_insurance/two_wheeler_details/model/ResGetVehicleCompanyList.dart';
import '../../two_wheeler_insurance/two_wheeler_details/model/ResGetVehicleModelList.dart';
import '../../two_wheeler_insurance/two_wheeler_details/model/ResGetVehicleVariantList.dart';

class AssetsVehicleFormView extends GetView {
  AssetsVehicleFormView();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          BorderTextField(
            hintText: 'RJ - 14 - DT - 0577',
            titleText: 'registration_number'.tr + "*",
            textCapitalization: TextCapitalization.characters,
            inputFormatters: [bikeInsuranceController.maskFormatterForBike],
            controller: profileAssetsController.assetsRegController.value,
            onValidate: (val) {
              if (val.toString().isEmpty) {
                return 'please_enter_registration_no'.tr;
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 12.h),
          Obx(() => DropDown2<ManufacturerModel>(
                field_label: 'make'.tr + "*",
                hint_text: 'make'.tr,
                dropdown_values: profileAssetsController.assetSubTypeRadioList[0].isChecked ? bikeInsuranceController.ManufacturerList.value : carInsuranceController.ManufacturerList.value,
                selectedValue: profileAssetsController.selectedManufaturer,
                onChange: (ManufacturerModel val) {
                  print('onChanged : ${val.name}');
                  profileAssetsController.selectedManufaturer = val;
                  if(profileAssetsController.assetSubTypeRadioList[0].isChecked){
                    bikeInsuranceController.fetchModelList(val.id);
                  }else{
                    carInsuranceController.fetchModelList(val.id);
                  }

                },
                itemBuilder: (BuildContext ctx, ManufacturerModel val) => Text(
                  val.name.toString(),
                ),
              )),
          /*DropDown2(
            field_label: 'Make',
            dropdown_values: bikeInsuranceController.ManufacturerList, hint_text: 'Make', onChange: (), itemBuilder: (BuildContext , ManufacturerModel ) {  },
          ),*/
          Obx(() =>  (profileAssetsController.assetSubTypeRadioList[0].isChecked ? bikeInsuranceController.modelList.isNotEmpty : carInsuranceController.modelList.isNotEmpty)
              ? DropDown2<VehicleModelList>(
                  field_label: 'model'.tr + "*",
                  hint_text: 'model'.tr,
                  //selectedValue: profileAssetsController.selectedVehicleModel ,
                  dropdown_values: profileAssetsController.assetSubTypeRadioList[0].isChecked ? bikeInsuranceController.modelList.value : carInsuranceController.modelList.value,
                  onChange: (VehicleModelList val) {
                    print('onChanged : ${val.name}');
                    profileAssetsController.selectedVehicleModel = val;

                    if(profileAssetsController.assetSubTypeRadioList[0].isChecked){
                      bikeInsuranceController.fetchVariantList(val.id);
                    }else{
                      carInsuranceController.fetchVariantList(val.id);
                    }

                  },
                  itemBuilder: (BuildContext ctx, VehicleModelList val) => Text(
                    val.name.toString(),
                  ),
                )
              : Container()),
          /*DropDown(
            field_label: 'Model',
            dropdown_values: bikeInsuranceController.selectModel,
          ),*/
          Obx(() => (profileAssetsController.assetSubTypeRadioList[0].isChecked ? bikeInsuranceController.variantList.isEmpty : carInsuranceController.variantList.isEmpty)
              ? Container()
              : DropDown2<VehicleVariantList>(
                  field_label: 'variant'.tr + "*",
                  hint_text: 'variant'.tr,
                  //selectedValue: profileAssetsController.selectedVehicleVariant,
                  dropdown_values:profileAssetsController.assetSubTypeRadioList[0].isChecked ? bikeInsuranceController.variantList.value : carInsuranceController.variantList.value,
                  onChange: (VehicleVariantList val) {
                    print('onChanged : ${val.name}');
                    profileAssetsController.selectedVehicleVariant = val;
                  },
                  itemBuilder: (BuildContext ctx, VehicleVariantList val) =>
                      Text(
                    val.name.toString(),
                  ),
                )),
          /*DropDown(
            field_label: 'Varient',
            dropdown_values: bikeInsuranceController.selectVariant,
          ),*/
          Obx(
            () => DropDown(
              field_label: 'registration_year'.tr,
              dropdown_values: bikeInsuranceController.yearList,
              selectedValue:
                  profileAssetsController.selectedVehicleRegistrationYear.value,
              onChange: (data) => profileAssetsController
                  .selectedVehicleRegistrationYear.value = data,
            ),
          ),
          Obx(
            () => DropDown2<RadioSelectionModel>(
              field_label: 'fuel_type'.tr,
              dropdown_values: profileAssetsController.fuelTypeList,
              selectedValue: profileAssetsController.selectedFuelType!.value,
              onChange: (RadioSelectionModel data) =>
                  profileAssetsController.selectedFuelType!.value = data,
              hint_text: 'fuel_type'.tr,
              itemBuilder: (BuildContext ctx, RadioSelectionModel data) =>
                  Text(data.text),
            ),
          ),
          Obx(
            () => DatePickerBimaG(
              hintText: 'enter_policy_expiry_date'.tr,
              titleText: 'policy_expiry_date'.tr,
              initialDate: profileAssetsController.selectedExpiryDate.value,
              onTap: (date, formattedDate) {
                profileAssetsController.selectedExpiryDate.value = date;
              },
            ),
          ),
        ],
      ),
    );
  }
}
