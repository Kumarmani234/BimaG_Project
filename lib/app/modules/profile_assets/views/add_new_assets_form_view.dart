// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/profile_assets/views/assets_property_form_view.dart';
import 'package:bima_g/app/widgets/buttons.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/ts.dart';
import '../../../widgets/field_with_radio_view.dart';
import '../../insurance_appbar/views/insurance_appbar_view.dart';
import 'assets_vehicle_form_view.dart';

class AddNewAssetsFormView extends GetView {
  GlobalKey<FormState> AddAssetsFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'add_new_assets'.tr,
        ),
        preferredSize: Size.fromHeight(60.h),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: AddAssetsFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    color: AppColors.white,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (profileAssetsController.editVehicleID == 0)
                          Text(
                            'select_assets_type'.tr,
                            style: Ts.bold14(AppColors.secondaryColor),
                          ),
                        if (profileAssetsController.editVehicleID == 0)
                          SizedBox(height: 10.h),
                        if (profileAssetsController.editVehicleID == 0)
                          Container(
                            height: 48.h,
                            child: Obx(
                              () => ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return FieldWithRadioView(
                                    height: 48.h,
                                    width: 132.w,
                                    ishealthForm: true,
                                    text: profileAssetsController
                                        .assetTypeRadioList[index].text,
                                    isSelected: RxBool(profileAssetsController
                                        .assetTypeRadioList[index].isChecked),
                                    onClick: () {
                                      profileAssetsController
                                          .onTypeRadioChange(index);
                                    },
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: 10.w);
                                },
                                itemCount: profileAssetsController
                                    .assetTypeRadioList.length,
                              ),
                            ),
                          ),
                        if(profileAssetsController.editVehicleID == 0 && profileAssetsController.editPropertyID == 0)Column(
                          children: [
                            SizedBox(height: 20.h),
                            Obx(
                                  () => Text(
                                profileAssetsController.selectSubTypeText.value.tr,
                                style: Ts.bold14(AppColors.secondaryColor),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              height: 48.h,
                              child: Obx(
                                    () => ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return FieldWithRadioView(
                                      height: 48.h,
                                      width: Get.width * 0.35,
                                      ishealthForm: true,
                                      text: profileAssetsController
                                          .assetSubTypeRadioList[index].text,
                                      isSelected: RxBool(profileAssetsController
                                          .assetSubTypeRadioList[index].isChecked),
                                      onClick: () => profileAssetsController
                                          .onSubtypeRadioChange(index),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(width: 10.w);
                                  },
                                  itemCount: profileAssetsController
                                      .assetSubTypeRadioList.length,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),

                        Obx(
                          () =>
                              profileAssetsController.selectSubTypeText.value ==
                                      'Select Vehicle Type'.tr
                                  ? AssetsVehicleFormView()
                                  : AssetsPropertyFormView(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomButton(
          key: Key('add_new_assets_save_key'),
          text: 'save'.tr,
          buttonStatus: profileAssetsController.formButtonStatus.value,
          onClick: () {
            if (AddAssetsFormKey.currentState!.validate()) {
              if (profileAssetsController.selectedAssetType!.value.key == '1') {
                profileAssetsController.addEditNewVehicle();
              } else {
                profileAssetsController.addEditProperty();
              }
              print('############## Form validate ############');
            } else {
              print('############## Form not validate ############');
            }
          },
        ),
      ),
    );
  }
}
