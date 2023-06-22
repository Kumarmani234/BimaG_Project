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

class RtoSelectionTabView extends GetView<BikeInsuranceController> {
  RtoSelectionTabView({
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
                readOnly: true,
                onTap: () => bikeInsuranceSearchController
                    .searchRTO(bikeInsuranceController.listTabs[0].tabName),
              ),
              SizedBox(height: 16.h),
              PrimarySelectTextView(
                primary_text:
                    'select'.tr + ' ' + '$selectedCity' + ' ' + 'rto'.tr,
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, //
                    crossAxisSpacing: 4.25,
                    mainAxisSpacing: 4,
                    childAspectRatio: 2.25,
                  ),
                  itemCount: bikeInsuranceController.RtoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 48.h,
                      width: 82.w,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: selectedButton.value ==
                                bikeInsuranceController.RtoList[index]
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
                              color:
                                  bikeInsuranceController.selectedRTO.value ==
                                          bikeInsuranceController.RtoList[index]
                                      ? AppColors.primaryColor
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: Ink(
                                child: InkWell(
                                  onTap: () {
                                    bikeInsuranceController.selectedRTO.value =
                                        bikeInsuranceController.RtoList[index];
                                    Future.delayed(
                                      Duration(milliseconds: 150),
                                      () {
                                        bikeInsuranceController
                                            .listTabs[1].tabStatus = 3;
                                        bikeInsuranceController
                                                .listTabs[1].tabName =
                                            bikeInsuranceController
                                                .RtoList[index];
                                        bikeInsuranceController.listTabs
                                            .refresh();
                                        if (bikeInsuranceController
                                                .selectedManufacturer
                                                .value
                                                .name !=
                                            null) {
                                          bikeInsuranceController
                                              .listTabs[2].tabStatus = 2;
                                        }
                                        print(
                                            'selectedRTO : ${bikeInsuranceController.selectedManufacturer.value}');

                                        bikeInsuranceController
                                            .setSelectedButton('Manufacturer');
                                        bikeInsuranceController
                                            .fetchManufacturer();
                                      },
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      bikeInsuranceController.RtoList[index],
                                      style: Ts.bold14(
                                        bikeInsuranceController
                                                    .selectedRTO.value ==
                                                bikeInsuranceController
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
                search_text: bikeInsuranceSearchController
                    .searchDetailsList[1].search_text
                    .toString(),
                onSearchClick: () => bikeInsuranceSearchController
                    .searchRTO(bikeInsuranceController.listTabs[0].tabName),
              )
            ],
          ),
        ),
      ),
    );
  }
}
