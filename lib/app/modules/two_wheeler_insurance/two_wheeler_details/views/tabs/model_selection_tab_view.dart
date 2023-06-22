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
import '../../model/ResGetVehicleVariantList.dart';
import '../custom_components/primary_find_text_view.dart';
import '../custom_components/primary_select_text_view.dart';

class ModelSelectionTabView extends GetView<BikeInsuranceController> {
  ModelSelectionTabView({
    required this.modelController,
  });

  Rx<TextEditingController> modelController;

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
                text: 'search_model'.tr,
                controller: modelController,
                onTap: () => bikeInsuranceSearchController.searchModel(
                    bikeInsuranceController.selectedModel.value.name ?? ''),
                readOnly: true,
              ),
              SizedBox(height: 16.h),
              PrimarySelectTextView(
                primary_text: 'or'.tr + ' ' + 'select'.tr + ' ' + 'model'.tr,
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    childAspectRatio: 112 / 48,
                  ),
                  itemCount: bikeInsuranceController.modelList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 48.h,
                      width: 112.w,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: selectedButton.value ==
                                bikeInsuranceController.modelList[index]
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
                            width: 96.w,
                            height: 32.h,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: bikeInsuranceController
                                          .selectedModel.value ==
                                      bikeInsuranceController.modelList[index]
                                  ? AppColors.primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: Ink(
                                child: InkWell(
                                  onTap: () {
                                    bikeInsuranceController
                                            .selectedModel.value =
                                        bikeInsuranceController
                                            .modelList[index];
                                    Future.delayed(
                                      Duration(milliseconds: 150),
                                      () {
                                        bikeInsuranceController
                                            .listTabs[3].tabStatus = 3;
                                        bikeInsuranceController.listTabs[3]
                                            .tabName = bikeInsuranceController
                                                .modelList[index].name ??
                                            '';
                                        bikeInsuranceController.listTabs
                                            .refresh();
                                        bikeInsuranceController
                                            .listTabs[4].tabStatus = 2;
                                        bikeInsuranceController
                                            .setSelectedButton('Variant');

                                        //variant
                                        bikeInsuranceController
                                            .listTabs[4].tabName = 'Variant';
                                        bikeInsuranceController
                                            .listTabs[4].tabStatus = 2;
                                        bikeInsuranceController.selectedVariant
                                            .value = VehicleVariantList();

                                        bikeInsuranceController
                                            .fetchVariantList(
                                                bikeInsuranceController
                                                    .selectedModel.value.id);
                                      },
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      bikeInsuranceController
                                              .modelList[index].name ??
                                          '',
                                      style: Ts.bold14(
                                        bikeInsuranceController
                                                    .selectedModel.value ==
                                                bikeInsuranceController
                                                    .modelList[index]
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
                    .searchDetailsList[3].search_text
                    .toString(),
                onSearchClick: () => bikeInsuranceSearchController.searchModel(
                    bikeInsuranceController.selectedModel.value.name ?? ''),
              )
            ],
          ),
        ),
      ),
    );
  }
}
