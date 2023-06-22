// ignore_for_file: must_be_immutable

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance/controllers/car_insurance_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../../utility/colors.dart';
import '../../../../../../../../utility/ts.dart';
import '../../../../../../utility/asset_paths.dart';
import '../../../../../insurance_components/insurance_fiels_with_icon_view.dart';
import '../../../../two_wheeler_insurance/two_wheeler_details/views/custom_components/primary_find_text_view.dart';
import '../../../../two_wheeler_insurance/two_wheeler_details/views/custom_components/primary_select_text_view.dart';

class VariantTabView extends GetView<CarInsuranceController> {
  VariantTabView({
    required this.variantController,
  });

  Rx<TextEditingController> variantController;

  @override
  Widget build(BuildContext context) {
    RxString selectedButton = "".obs;

    return Expanded(
      child: Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InsuranceFielsWithIconView(
                // iconData: Icons.two_wheeler,
                imgPath: AssetPath.bike,
                text: 'search_variant'.tr,
                controller: variantController,
                readOnly: true,
                onTap: () => carInsuranceSearchController.searchVariant(
                    carInsuranceController.selectedModel.value.name ?? ''),
              ),
              SizedBox(height: 16.h),
              PrimarySelectTextView(
                primary_text: 'or'.tr + ' ' + 'select'.tr + ' ' + 'variant'.tr,
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 3.5,
                  ),
                  itemCount: carInsuranceController.variantList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 48.h,
                      width: 168.w,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: selectedButton.value ==
                                carInsuranceController.variantList[index]
                            ? AppColors.primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8.w),
                        border: Border.all(
                          color: AppColors.grey1,
                          width: 1.w,
                        ),
                      ),
                      child: Obx(
                        () {
                          return Container(
                            width: 118.w,
                            height: 20.h,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: carInsuranceController
                                          .selectedVariant.value ==
                                      carInsuranceController.variantList[index]
                                  ? AppColors.primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8.w),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: Ink(
                                child: InkWell(
                                  onTap: () {
                                    carInsuranceController
                                            .selectedVariant.value =
                                        carInsuranceController
                                            .variantList[index];
                                    Future.delayed(Duration(milliseconds: 150),
                                        () {
                                      carInsuranceController
                                          .listTabs[4].tabStatus = 3;
                                      carInsuranceController.listTabs[4]
                                          .tabName = carInsuranceController
                                              .variantList[index].name ??
                                          '';
                                      carInsuranceController.listTabs.refresh();
                                      carInsuranceController
                                          .listTabs[5].tabStatus = 2;
                                      carInsuranceController
                                          .setSelectedButton('Year');
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      carInsuranceController
                                              .variantList[index].name ??
                                          '',
                                      style: Ts.bold14(
                                        carInsuranceController
                                                    .selectedVariant.value ==
                                                carInsuranceController
                                                    .variantList[index]
                                            ? Colors.white
                                            : AppColors.grey5,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              PrimaryFindTextView(
                search_text: carInsuranceSearchController
                    .searchDetailsList[4].search_text
                    .toString(),
                onSearchClick: () => carInsuranceSearchController.searchVariant(
                    carInsuranceController.selectedModel.value.name ?? ''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
