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
import '../../../../two_wheeler_insurance/two_wheeler_details/views/custom_components/primary_find_text_view.dart';
import '../../../../two_wheeler_insurance/two_wheeler_details/views/custom_components/primary_select_text_view.dart';

class RtoTabView extends GetView<CarInsuranceController> {
  RtoTabView({
    required this.RTOController,
    required this.selectedCity,
  });

  Rx<TextEditingController> RTOController;
  String selectedCity;

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
                // iconData: Icons.location_city,
                imgPath: AssetPath.city,
                text: 'search_rto'.tr,
                controller: RTOController,
                onTap: () => carInsuranceSearchController
                    .searchRTO(carInsuranceController.listTabs[0].tabName),
                readOnly: true,
              ),
              SizedBox(height: 16.h),
              PrimarySelectTextView(
                primary_text:
                    'select'.tr + ' ' + '$selectedCity' + ' ' + 'rto'.tr,
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, //
                    crossAxisSpacing: 4.25,
                    mainAxisSpacing: 4,
                    childAspectRatio: 2.25,
                  ),
                  itemCount: carInsuranceController.RtoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 48.h,
                      width: 82.w,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: selectedButton.value ==
                                carInsuranceController.RtoList[index]
                            ? AppColors.primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.grey1, width: 1.w),
                      ),
                      child: Obx(
                        () {
                          return Container(
                            width: 66.w,
                            height: 32.h,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: carInsuranceController.selectedRTO.value ==
                                      carInsuranceController.RtoList[index]
                                  ? AppColors.primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: Ink(
                                child: InkWell(
                                  onTap: () {
                                    carInsuranceController.selectedRTO.value =
                                        carInsuranceController.RtoList[index];
                                    Future.delayed(
                                      Duration(milliseconds: 150),
                                      () {
                                        carInsuranceController
                                            .listTabs[1].tabStatus = 3;
                                        carInsuranceController
                                                .listTabs[1].tabName =
                                            carInsuranceController
                                                .RtoList[index];
                                        carInsuranceController.listTabs
                                            .refresh();
                                        if (carInsuranceController
                                                .selectedManufacturer
                                                .value
                                                .name !=
                                            null) {
                                          carInsuranceController
                                              .listTabs[2].tabStatus = 2;
                                        }
                                        print(
                                            'selectedRTO : ${carInsuranceController.selectedManufacturer.value}');

                                        carInsuranceController
                                            .setSelectedButton('Manufacturer');
                                        carInsuranceController
                                            .fetchManufacturer();
                                      },
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      carInsuranceController.RtoList[index],
                                      style: Ts.bold14(
                                        carInsuranceController
                                                    .selectedRTO.value ==
                                                carInsuranceController
                                                    .RtoList[index]
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
                    .searchDetailsList[1].search_text
                    .toString(),
                onSearchClick: () => carInsuranceSearchController
                    .searchRTO(carInsuranceController.listTabs[0].tabName),
              )
            ],
          ),
        ),
      ),
    );
  }
}
