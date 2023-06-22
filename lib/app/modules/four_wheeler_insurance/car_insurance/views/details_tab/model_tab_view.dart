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
import '../../../../two_wheeler_insurance/two_wheeler_details/model/ResGetVehicleVariantList.dart';
import '../../../../two_wheeler_insurance/two_wheeler_details/views/custom_components/primary_find_text_view.dart';
import '../../../../two_wheeler_insurance/two_wheeler_details/views/custom_components/primary_select_text_view.dart';

class ModelTabView extends GetView<CarInsuranceController> {
  ModelTabView({
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
                readOnly: true,
                onTap: () => carInsuranceSearchController.searchModel(
                    carInsuranceController.selectedModel.value.name ?? ''),
              ),
              SizedBox(height: 16.h),
              PrimarySelectTextView(
                primary_text: 'or'.tr + ' ' + 'select'.tr + ' ' + 'model'.tr,
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    childAspectRatio: 112 / 48,
                  ),
                  itemCount: carInsuranceController.modelList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 48.h,
                      width: 112.w,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: selectedButton.value ==
                                carInsuranceController.modelList[index]
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
                              color: carInsuranceController
                                          .selectedModel.value ==
                                      carInsuranceController.modelList[index]
                                  ? AppColors.primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: Ink(
                                child: InkWell(
                                  onTap: () {
                                    carInsuranceController.selectedModel.value =
                                        carInsuranceController.modelList[index];
                                    Future.delayed(
                                      Duration(milliseconds: 150),
                                      () {
                                        carInsuranceController
                                            .listTabs[3].tabStatus = 3;
                                        carInsuranceController.listTabs[3]
                                            .tabName = carInsuranceController
                                                .modelList[index].name ??
                                            '';
                                        carInsuranceController.listTabs
                                            .refresh();
                                        carInsuranceController
                                            .listTabs[4].tabStatus = 2;
                                        carInsuranceController
                                            .setSelectedButton('Variant');

                                        //variant
                                        carInsuranceController
                                            .listTabs[4].tabName = 'Variant';
                                        carInsuranceController
                                            .listTabs[4].tabStatus = 2;
                                        carInsuranceController.selectedVariant
                                            .value = VehicleVariantList();

                                        carInsuranceController.fetchVariantList(
                                            carInsuranceController
                                                .selectedModel.value.id);
                                      },
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      carInsuranceController
                                              .modelList[index].name ??
                                          '',
                                      style: Ts.bold14(
                                        carInsuranceController
                                                    .selectedModel.value ==
                                                carInsuranceController
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
                search_text: carInsuranceSearchController
                    .searchDetailsList[3].search_text
                    .toString(),
                onSearchClick: () => carInsuranceSearchController.searchModel(
                    carInsuranceController.selectedModel.value.name ?? ''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
