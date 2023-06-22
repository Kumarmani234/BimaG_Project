// ignore_for_file: must_be_immutable

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance/controllers/car_insurance_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../utility/colors.dart';
import '../../../../../../../utility/ts.dart';
import '../../../../../../utility/asset_paths.dart';
import '../../../../../insurance_components/insurance_fiels_with_icon_view.dart';
import '../../../../two_wheeler_insurance/two_wheeler_details/views/custom_components/primary_find_text_view.dart';
import '../../../../two_wheeler_insurance/two_wheeler_details/views/custom_components/primary_select_text_view.dart';

class CityTabView extends GetView<CarInsuranceController> {
  CityTabView({required this.cityController});

  Rx<TextEditingController> cityController;

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
                text: 'search_city'.tr,
                controller: cityController,
                readOnly: true,
                onTap: () => carInsuranceSearchController.searchCity(),
              ),
              SizedBox(height: 16.h),
              PrimarySelectTextView(
                primary_text: 'or_sel_city'.tr,
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: carInsuranceController.policyCityList.isEmpty
                    ? Center(
                        child: CupertinoActivityIndicator(
                          radius: 15.w,
                        ),
                      )
                    : Obx(
                        () => GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                            childAspectRatio: 112 / 48,
                          ),
                          itemCount:
                              carInsuranceController.policyCityList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 48.h,
                              width: 112.w,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                color: selectedButton.value ==
                                        carInsuranceController
                                            .policyCityList[index]
                                    ? AppColors.primaryColor
                                    : AppColors.white,
                                borderRadius: BorderRadius.circular(8.w),
                                border: Border.all(
                                  color: AppColors.grey1,
                                  width: 1.w,
                                ),
                              ),
                              child: Container(
                                width: 96.w,
                                height: 32.h,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  color: carInsuranceController
                                              .selectedCity.value ==
                                          carInsuranceController
                                              .policyCityList[index]
                                      ? AppColors.primaryColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: Ink(
                                    child: InkWell(
                                      onTap: () {
                                        print('widgetlist : 75');
                                        carInsuranceController
                                                .selectedCity.value =
                                            carInsuranceController
                                                .policyCityList[index];
                                        Future.delayed(
                                          Duration(milliseconds: 150),
                                          () {
                                            carInsuranceController
                                                .listTabs[0].tabStatus = 3;
                                            print(
                                                'widgetlist : 80 - ${carInsuranceController.policyCityList[index]}');
                                            carInsuranceController
                                                    .listTabs[0].tabName =
                                                carInsuranceController
                                                            .policyCityList[
                                                        index] ??
                                                    '';
                                            carInsuranceController.listTabs
                                                .refresh();
                                            carInsuranceController
                                                .setSelectedButton('RTO');
                                            carInsuranceController
                                                .listTabs[1].tabName = 'RTO';
                                            carInsuranceController
                                                .listTabs[1].tabStatus = 2;
                                            carInsuranceController
                                                .selectedRTO.value = '';
                                            carInsuranceController.fetchRTOList(
                                                rto: carInsuranceController
                                                    .policyCityList[index]);
                                          },
                                        );
                                      },
                                      child: Center(
                                        child: Text(
                                          carInsuranceController
                                              .policyCityList[index],
                                          style: Ts.bold14(
                                            carInsuranceController
                                                        .selectedCity.value ==
                                                    carInsuranceController
                                                        .policyCityList[index]
                                                ? Colors.white
                                                : AppColors.grey5,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ),
              PrimaryFindTextView(
                search_text: carInsuranceSearchController
                    .searchDetailsList[0].search_text
                    .toString(),
                onSearchClick: () => carInsuranceSearchController.searchCity(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
