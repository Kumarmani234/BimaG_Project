// ignore_for_file: must_be_immutable

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance/controllers/car_insurance_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../utility/colors.dart';
import '../../../../../../../utility/ts.dart';
import '../../../../../../utility/asset_paths.dart';
import '../../../../../insurance_components/insurance_fiels_with_icon_view.dart';
import '../../../../two_wheeler_insurance/two_wheeler_details/model/ResGetVehicleModelList.dart';
import '../../../../two_wheeler_insurance/two_wheeler_details/model/ResGetVehicleVariantList.dart';
import '../../../../two_wheeler_insurance/two_wheeler_details/views/custom_components/primary_find_text_view.dart';
import '../../../../two_wheeler_insurance/two_wheeler_details/views/custom_components/primary_select_text_view.dart';

class ManufacturerTabView extends GetView<CarInsuranceController> {
  ManufacturerTabView({
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
                onTap: () => carInsuranceSearchController.searchManufacture(
                    carInsuranceController.selectedManufacturer.value.name ??
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
                  itemCount: carInsuranceController.ManufacturerList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Obx(
                      () => Container(
                        height: 48.h,
                        width: 168.w,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: carInsuranceController
                                        .selectedManufacturer.value ==
                                    carInsuranceController
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
                                color: carInsuranceController
                                            .selectedManufacturer.value ==
                                        carInsuranceController
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
                                      carInsuranceController
                                              .selectedManufacturer.value =
                                          carInsuranceController
                                              .ManufacturerList[index];
                                      Future.delayed(
                                        Duration(milliseconds: 150),
                                        () {
                                          carInsuranceController
                                              .listTabs[2].tabStatus = 3;
                                          carInsuranceController.listTabs[2]
                                              .tabName = carInsuranceController
                                                  .ManufacturerList[index]
                                                  .name ??
                                              '';
                                          carInsuranceController.listTabs
                                              .refresh();
                                          carInsuranceController
                                              .setSelectedButton('Model');
                                          carInsuranceController
                                              .listTabs[3].tabName = 'Model';
                                          carInsuranceController
                                              .listTabs[3].tabStatus = 2;
                                          carInsuranceController.selectedModel
                                              .value = VehicleModelList();

                                          //variant
                                          carInsuranceController
                                              .listTabs[4].tabName = 'Variant';
                                          carInsuranceController
                                              .listTabs[4].tabStatus = 1;
                                          carInsuranceController.selectedVariant
                                              .value = VehicleVariantList();

                                          //year
                                          carInsuranceController
                                              .listTabs[5].tabName = 'Year';
                                          carInsuranceController
                                              .listTabs[5].tabStatus = 1;
                                          carInsuranceController
                                              .selectedYear.value = '';
                                          carInsuranceController.fetchModelList(
                                              carInsuranceController
                                                  .ManufacturerList[index].id);
                                        },
                                      );
                                    },
                                    child: Center(
                                      child: Text(
                                        carInsuranceController
                                                .ManufacturerList[index].name ??
                                            '',
                                        style: Ts.bold14(
                                          carInsuranceController
                                                      .selectedManufacturer
                                                      .value ==
                                                  carInsuranceController
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
                search_text: carInsuranceSearchController
                    .searchDetailsList[2].search_text
                    .toString(),
                onSearchClick: () => carInsuranceSearchController
                    .searchManufacture(carInsuranceController
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
