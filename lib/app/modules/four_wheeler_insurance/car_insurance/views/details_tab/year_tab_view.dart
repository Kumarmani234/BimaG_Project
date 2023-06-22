// ignore_for_file: must_be_immutable

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance/controllers/car_insurance_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../../utility/colors.dart';
import '../../../../../../../../utility/ts.dart';
import '../../../../../widgets/buttons.dart';
import '../../../../two_wheeler_insurance/two_wheeler_details/views/custom_components/primary_select_text_view.dart';
import '../car_details_view.dart';

class YearTabView extends GetView<CarInsuranceController> {
  @override
  Widget build(BuildContext context) {
    RxString selectedButton = "".obs;

    return Expanded(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: PrimarySelectTextView(primary_text: 'select_year'.tr),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4.25,
                  mainAxisSpacing: 4,
                  childAspectRatio: 2.25,
                ),
                itemCount: carInsuranceController.yearList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 48.h,
                    width: 82.w,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: selectedButton.value ==
                              carInsuranceController.yearList[index]
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
                          width: 66.w,
                          height: 32.h,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: carInsuranceController.selectedYear.value ==
                                    carInsuranceController.yearList[index]
                                ? AppColors.primaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8.w),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: Ink(
                              child: InkWell(
                                onTap: () {
                                  carInsuranceController.selectedYear.value =
                                      carInsuranceController.yearList[index];
                                  Future.delayed(Duration(milliseconds: 150),
                                      () {
                                    carInsuranceController
                                        .listTabs[5].tabStatus = 3;
                                    carInsuranceController.listTabs[5].tabName =
                                        carInsuranceController.yearList[index];
                                    carInsuranceController.listTabs.refresh();
                                    selectedButton.value =
                                        carInsuranceController.yearList[index];
                                  });
                                },
                                child: Center(
                                  child: Text(
                                    carInsuranceController.yearList[index],
                                    style: Ts.bold14(
                                      carInsuranceController
                                                  .selectedYear.value ==
                                              carInsuranceController
                                                  .yearList[index]
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
            carInsuranceController.selectedYear.value == ''
                ? SizedBox()
                : BottomButton(
              key: Key('verify_detailss_key'),
                    text: 'Verify Details',
                    onClick: () => Get.to(
                      CarDetailsView(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
