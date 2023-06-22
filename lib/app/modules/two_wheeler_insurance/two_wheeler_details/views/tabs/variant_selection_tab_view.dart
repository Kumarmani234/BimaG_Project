// ignore_for_file: must_be_immutable

import 'package:bima_g/app/module_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/asset_paths.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../insurance_components/insurance_fiels_with_icon_view.dart';
import '../../controllers/bike_insurance_controller.dart';
import '../custom_components/primary_find_text_view.dart';
import '../custom_components/primary_select_text_view.dart';

class VariantSelectionTabView extends GetView<BikeInsuranceController> {
  VariantSelectionTabView({
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
                onTap: () => bikeInsuranceSearchController.searchVariant(
                    bikeInsuranceController.selectedModel.value.name ?? ''),
              ),
              SizedBox(height: 16.h),
              PrimarySelectTextView(
                primary_text: 'or'.tr + ' ' + 'select'.tr + ' ' + 'variant'.tr,
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 3.5,
                  ),
                  itemCount: bikeInsuranceController.variantList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 48.h,
                      width: 168.w,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: selectedButton.value ==
                                bikeInsuranceController.variantList[index]
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
                              color: bikeInsuranceController
                                          .selectedVariant.value ==
                                      bikeInsuranceController.variantList[index]
                                  ? AppColors.primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8.w),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: Ink(
                                child: InkWell(
                                  onTap: () {
                                    bikeInsuranceController
                                            .selectedVariant.value =
                                        bikeInsuranceController
                                            .variantList[index];
                                    Future.delayed(Duration(milliseconds: 150),
                                        () {
                                      bikeInsuranceController
                                          .listTabs[4].tabStatus = 3;
                                      bikeInsuranceController.listTabs[4]
                                          .tabName = bikeInsuranceController
                                              .variantList[index].name ??
                                          '';
                                      bikeInsuranceController.listTabs
                                          .refresh();
                                      bikeInsuranceController
                                          .listTabs[5].tabStatus = 2;
                                      bikeInsuranceController
                                          .setSelectedButton('Year');
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      bikeInsuranceController
                                              .variantList[index].name ??
                                          '',
                                      style: Ts.bold14(
                                        bikeInsuranceController
                                                    .selectedVariant.value ==
                                                bikeInsuranceController
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
                search_text: bikeInsuranceSearchController
                    .searchDetailsList[4].search_text
                    .toString(),
                onSearchClick: () =>
                    bikeInsuranceSearchController.searchVariant(
                        bikeInsuranceController.selectedModel.value.name ?? ''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
