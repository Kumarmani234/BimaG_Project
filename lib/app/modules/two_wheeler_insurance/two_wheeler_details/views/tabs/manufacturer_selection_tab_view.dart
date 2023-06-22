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
import '../../model/ResGetVehicleModelList.dart';
import '../../model/ResGetVehicleVariantList.dart';
import '../custom_components/primary_find_text_view.dart';
import '../custom_components/primary_select_text_view.dart';

class ManufacturerSelectionTabView extends GetView<BikeInsuranceController> {
  ManufacturerSelectionTabView({
    required this.manuController,
  });

  Rx<TextEditingController> manuController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InsuranceFielsWithIconView(
                // iconData: Icons.precision_manufacturing,
                imgPath: AssetPath.manufacturer,
                text: 'search_manufacturer'.tr,
                controller: manuController,
                readOnly: true,
                onTap: () => bikeInsuranceSearchController.searchManufacture(
                    bikeInsuranceController.selectedManufacturer.value.name ??
                        ''),
              ),
              SizedBox(height: 16.h),
              PrimarySelectTextView(
                primary_text:
                    'or'.tr + ' ' + 'select'.tr + ' ' + 'manufacturer'.tr,
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
                  itemCount: bikeInsuranceController.ManufacturerList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Obx(
                      () => Container(
                        height: 48.h,
                        width: 168.w,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: bikeInsuranceController
                                        .selectedManufacturer.value ==
                                    bikeInsuranceController
                                        .ManufacturerList[index]
                                ? AppColors.primaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: AppColors.grey1, width: 1.w)),
                        child: Obx(
                          () {
                            return Container(
                              height: 20.h,
                              width: 118.w,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                color: bikeInsuranceController
                                            .selectedManufacturer.value ==
                                        bikeInsuranceController
                                            .ManufacturerList[index]
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
                                              .selectedManufacturer.value =
                                          bikeInsuranceController
                                              .ManufacturerList[index];
                                      Future.delayed(
                                        Duration(milliseconds: 150),
                                        () {
                                          bikeInsuranceController
                                              .listTabs[2].tabStatus = 3;
                                          bikeInsuranceController.listTabs[2]
                                              .tabName = bikeInsuranceController
                                                  .ManufacturerList[index]
                                                  .name ??
                                              '';
                                          bikeInsuranceController.listTabs
                                              .refresh();
                                          bikeInsuranceController
                                              .setSelectedButton('Model');
                                          bikeInsuranceController
                                              .listTabs[3].tabName = 'Model';
                                          bikeInsuranceController
                                              .listTabs[3].tabStatus = 2;
                                          bikeInsuranceController.selectedModel
                                              .value = VehicleModelList();

                                          //variant
                                          bikeInsuranceController
                                              .listTabs[4].tabName = 'Variant';
                                          bikeInsuranceController
                                              .listTabs[4].tabStatus = 1;
                                          bikeInsuranceController
                                              .selectedVariant
                                              .value = VehicleVariantList();

                                          //year
                                          bikeInsuranceController
                                              .listTabs[5].tabName = 'Year';
                                          bikeInsuranceController
                                              .listTabs[5].tabStatus = 1;
                                          bikeInsuranceController
                                              .selectedYear.value = '';
                                          bikeInsuranceController
                                              .fetchModelList(
                                                  bikeInsuranceController
                                                      .ManufacturerList[index]
                                                      .id);
                                        },
                                      );
                                    },
                                    child: Center(
                                      child: Text(
                                        bikeInsuranceController
                                                .ManufacturerList[index].name ??
                                            '',
                                        style: Ts.bold14(
                                          bikeInsuranceController
                                                      .selectedManufacturer
                                                      .value ==
                                                  bikeInsuranceController
                                                      .ManufacturerList[index]
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
                      ),
                    );
                  },
                ),
              ),
              PrimaryFindTextView(
                search_text: bikeInsuranceSearchController
                    .searchDetailsList[2].search_text
                    .toString(),
                onSearchClick: () => bikeInsuranceSearchController
                    .searchManufacture(bikeInsuranceController
                            .selectedManufacturer.value.name ??
                        ''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
