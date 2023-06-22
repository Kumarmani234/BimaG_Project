// ignore_for_file: must_be_immutable

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../insurance_components/insurance_fiels_with_icon_view.dart';
import '../../controllers/bike_insurance_controller.dart';
import '../custom_components/primary_find_text_view.dart';
import '../custom_components/primary_select_text_view.dart';

class CitySelectionTabView extends GetView<BikeInsuranceController> {
  CitySelectionTabView({required this.cityController});

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
                onTap: () => bikeInsuranceSearchController.searchCity(),
              ),
              SizedBox(height: 16.h),
              PrimarySelectTextView(
                primary_text: 'or_sel_city'.tr,
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: bikeInsuranceController.policyCityList.isEmpty
                    ? Center(
                        child: CupertinoActivityIndicator(
                          radius: 15.w,
                        ),
                      )
                    : GridView.builder(
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                          childAspectRatio: 112 / 48,
                        ),
                        itemCount:
                            bikeInsuranceController.policyCityList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 48.h,
                            width: 112.w,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: selectedButton.value ==
                                      bikeInsuranceController
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
                                color: bikeInsuranceController
                                            .selectedCity.value ==
                                        bikeInsuranceController
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
                                      bikeInsuranceController
                                              .selectedCity.value =
                                          bikeInsuranceController
                                              .policyCityList[index];
                                      Future.delayed(
                                        Duration(milliseconds: 150),
                                        () {
                                          bikeInsuranceController
                                              .listTabs[0].tabStatus = 3;
                                          print(
                                              'widgetlist : 80 - ${bikeInsuranceController.policyCityList[index]}');
                                          bikeInsuranceController.listTabs[0]
                                              .tabName = bikeInsuranceController
                                                  .policyCityList[index] ??
                                              '';
                                          bikeInsuranceController.listTabs
                                              .refresh();
                                          bikeInsuranceController
                                              .setSelectedButton('rto'.tr);
                                          bikeInsuranceController
                                              .listTabs[1].tabName = 'rto'.tr;
                                          bikeInsuranceController
                                              .listTabs[1].tabStatus = 2;
                                          bikeInsuranceController
                                              .selectedRTO.value = '';
                                          bikeInsuranceController.fetchRTOList(
                                              rto: bikeInsuranceController
                                                  .policyCityList[index]);
                                        },
                                      );
                                    },
                                    child: Center(
                                      child: Text(
                                        bikeInsuranceController
                                            .policyCityList[index],
                                        style: Ts.bold14(
                                          bikeInsuranceController
                                                      .selectedCity.value ==
                                                  bikeInsuranceController
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
              PrimaryFindTextView(
                search_text: bikeInsuranceSearchController
                    .searchDetailsList[0].search_text
                    .toString(),
                onSearchClick: () => bikeInsuranceSearchController.searchCity(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
