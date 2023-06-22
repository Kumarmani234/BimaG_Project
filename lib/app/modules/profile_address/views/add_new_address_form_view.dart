// ignore_for_file: must_be_immutable

import 'package:bima_g/app/form_validation_expressions.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/fetch_address/views/fetch_address_view.dart';
import 'package:bima_g/app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/styles.dart';
import '../../../data/models/ResNameIdList.dart';
import '../../../widgets/drop_down.dart';
import '../../insurance_appbar/views/insurance_appbar_view.dart';

class AddNewAddressFormView extends GetView {
  GlobalKey<FormState> AddAddressFormKey = GlobalKey<FormState>();
  FormFieldValidExpression formFieldValidExpression =
      FormFieldValidExpression();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'add_new_Address'.tr,
        ),
        preferredSize: Size.fromHeight(80.h),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: AddAddressFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8.w),
                      boxShadow: [
                        Styles.shadow(),
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropDown2<ResNameIdList>(
                          key: Key('address_dropdown_key'),
                            field_label: 'address_type'.tr + "*",
                            dropdown_values:
                                profileAddressController.addressTypeList.value,
                            hint_text: 'address_type'.tr,
                            selectedValue:
                                profileAddressController.selectedAddressType,
                            onChange: (ResNameIdList res) {
                              profileAddressController.selectedAddressType =
                                  res;
                            },
                            itemBuilder: (ctx, ResNameIdList val) =>
                                Text(val.name ?? '')),
                        FetchAddressView(),
                        /*SizedBox(height: 12.h),
                        DropDown(
                          field_label: 'floor_no'.tr,
                          dropdown_values: [
                            'Ground Floor',
                            'First Floor',
                            'Second Floor',
                            'Third Floor',
                          ],
                        ),*/
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(() => BottomButton(
        key: Key('add_new_address_save_key'),
            text: 'save'.tr,
            buttonStatus: profileAddressController.saveButtonStatus.value,
            onClick: () {
              if (AddAddressFormKey.currentState!.validate()) {
                profileAddressController.addEditAddress();
              } else {}
            },
          )),
    );
  }
}
