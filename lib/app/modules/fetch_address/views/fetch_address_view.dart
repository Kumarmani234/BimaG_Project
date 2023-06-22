// ignore_for_file: must_be_immutable

import 'package:bima_g/app/form_validation_expressions.dart';
import 'package:bima_g/app/modules/fetch_address/model/ResGetAddressByPincode.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/ts.dart';
import '../../../module_controllers.dart';
import '../../../widgets/drop_down.dart';
import '../../../widgets/textfields.dart';
import '../../two_wheeler_insurance/two_wheeler_details/model/ResCities.dart';
import '../controllers/fetch_address_controller.dart';

class FetchAddressView extends StatefulWidget {
  final bool isfill;

  FetchAddressView({this.isfill = false});
  @override
  State<FetchAddressView> createState() => _FetchAddressViewState();
}

class _FetchAddressViewState extends State<FetchAddressView> {
  FormFieldValidExpression formFieldValidExpression =
      FormFieldValidExpression();

  @override
  void initState() {
    super.initState();
    print('oninit called in AskMobile View');
    Get.delete<FetchAddressController>();
    fetchAddressController = Get.put(FetchAddressController());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //only pincode
        Obx(
          () => Visibility(
            visible: fetchAddressController.isUserKnowPincode.value,
            child: Stack(
              children: [
                //pincode
                BorderTextField(
                  key: Key('pincode_key'),
                  spacing: 6.h,
                  isfill: widget.isfill,
                  titleText: 'pincode'.tr + "*",
                  hintText: 'user_pincode'.tr,
                  maxLength: 6,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  textInputType: TextInputType.number,
                  controller: fetchAddressController.pincodeCon,
                  suffixIcon: TextButton(
                    child: Text(
                      '',
                      style: Ts.medium15(AppColors.black),
                    ),
                    onPressed: () {},
                  ),
                  onChange: (val) {
                    fetchAddressController.streamController.add(val.toString());
                  },
                  onValidate: (val) {
                    if (val.toString().isEmpty) {
                      return 'please_enter_pincode_no'.tr;
                    } else if (!formFieldValidExpression.pincodeValid
                        .hasMatch(val)) {
                      return 'invalid_pincode_format'.tr;
                    } else {
                      return null;
                    }
                  },
                ),

                //dont know pincode
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      fetchAddressController.isUserKnowPincode.value =
                          !fetchAddressController.isUserKnowPincode.value;
                      if (!fetchAddressController.isUserKnowPincode.value) {
                        fetchAddressController.fetchStates();
                      }
                    },
                    child: Text(
                      "dont_know_pincode".tr,
                      style: Ts.medium12(AppColors.primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(
          height: 16.h,
        ),

        //select state
        Obx(() => !fetchAddressController.isUserKnowPincode.value
            ? DropDown2<String>(
                isfill: widget.isfill,
                field_label: 'select_state'.tr + "*",
                hint_text: 'select_state'.tr,
                dropdown_values: fetchAddressController.listStates.value,
                onChange: (String val) {
                  print('onChanged : ${val}');
                  fetchAddressController.fetchDistricts(val.toString());
                },
                itemBuilder: (BuildContext ctx, String val) => Text(
                  val.capitalize ?? '',
                ),
                onValidate: (val) {
                  if (val.toString().isEmpty || val == null) {
                    return 'please_select_state'.tr;
                  }
                },
              )
            : Container()),

        //SizedBox(height: 12.h,),
        //select city
        Obx(() => !fetchAddressController.isUserKnowPincode.value
            ? fetchAddressController.listDistricts.isEmpty
                ? Container()
                : DropDown2<String>(
                    isfill: widget.isfill,
                    field_label: 'select_city'.tr + "*",
                    hint_text: 'select_city'.tr,
                    dropdown_values: fetchAddressController.listDistricts.value,
                    onChange: (String val) {
                      print('onChanged : ${val}');
                      //fetchAddressController.(val.toString());
                      fetchAddressController.fetchCities(district: val);
                    },
                    itemBuilder: (BuildContext ctx, String val) => Text(
                      val.toString().capitalize ?? '',
                    ),
                    onValidate: (val) {
                      if (val.toString().isEmpty || val == null) {
                        return 'please_select_city'.tr;
                      }
                    },
                  )
            : Container()),

        //SizedBox(height: 12.h,),
        //select only village or select village with pincode
        Obx(
          () => Stack(
            children: [
              fetchAddressController.isUserKnowPincode.value
                  ? fetchAddressController.listAreas.value.isEmpty
                      ? Container()
                      : DropDown2<PincodeList>(
                key: Key('village_dropdown_key'),
                          isfill: widget.isfill,
                          field_label: 'select_village'.tr,
                          hint_text: 'select_village'.tr,
                          dropdown_values:
                              fetchAddressController.listAreas.value,
                          onChange: (PincodeList val) {
                            print('onChanged : ${val.id}');
                            fetchAddressController.selectedPincode = val.id;
                          },
                          itemBuilder: (BuildContext ctx, PincodeList val) =>
                              Text(
                            val.cityVillageArea.toString(),
                          ),
                          onValidate: (val) {
                            if (val.toString().isEmpty || val == null) {
                              return 'please_select_village'.tr;
                            }
                          },
                        )
                  : fetchAddressController.listCities.isEmpty
                      ? Container()
                      : DropDown2<CitiesList>(
                          isfill: widget.isfill,
                          field_label: 'select_village_n_pincode'.tr + "*",
                          hint_text: 'select_village_n_pincode'.tr,
                          dropdown_values:
                              fetchAddressController.listCities.value,
                          onChange: (CitiesList val) {
                            print('onChanged : ${val.masterId}');
                            fetchAddressController.selectedPincode =
                                val.masterId;
                          },
                          itemBuilder: (BuildContext ctx, CitiesList val) =>
                              Text(
                            val.city.toString().capitalize.toString() +
                                ' , ' +
                                val.pincode.toString(),
                          ),
                          onValidate: (val) {
                            if (val.toString().isEmpty || val == null) {
                              return 'please_select_village_n_pincode'.tr;
                            }
                          },
                        ),
              if (!fetchAddressController.isUserKnowPincode.value)
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () =>
                        fetchAddressController.isUserKnowPincode.value =
                            !fetchAddressController.isUserKnowPincode.value,
                    child: Text(
                      "i_know_pincode".tr,
                      style: Ts.medium12(AppColors.primaryColor),
                    ),
                  ),
                ),
            ],
          ),
        ),

        //street address
        BorderTextField(
          key: Key('street_address_key'),
          titleText: 'street_address'.tr + "*",
          hintText: 'street_address'.tr,
          maxLength: 100,
          isfill: widget.isfill,
          controller: fetchAddressController.streetAddressCon,
          onValidate: (val) {
            if (val.toString().isEmpty) {
              return 'please_enter_street_address'.tr;
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
