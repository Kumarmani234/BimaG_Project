import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../widgets/field_with_radio_view.dart';

class MedicalTabView extends GetView {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Help us know the medical condition, if any',
                        style: Ts.bold15(AppColors.secondaryColor)),
                    SizedBox(height: 16.h),
                    Text(
                        'Have you or any member of your family proposed to be insured, suffered or are suffering from any disease/ailment/adverse medical condition of any kind especially Heart/Stroke/Cancer/Renal disorder/Alzheimer\'s disease/Parkinsons\'s disease?',
                        style: Ts.bold15(AppColors.secondaryColor)),
                    SizedBox(height: 10.h),
                    Obx(
                      () => GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 151 / 48,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                        ),
                        itemCount: healthInsurancePlanSelectionController
                            .fieldList1.length,
                        itemBuilder: (context, index) {
                          return FieldWithRadioView(
                            ishealthForm: true,
                            text: healthInsurancePlanSelectionController
                                .fieldList1[index].text
                                .toString(),
                            isSelected: RxBool(
                                healthInsurancePlanSelectionController
                                    .fieldList1[index].isChecked),
                            onClick: () {
                              healthInsurancePlanSelectionController
                                  .OnMedicalGrid1Change(index);
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                        'Have you or any member of your family proposed to be insured, suffered or are suffering from any disease/ailment/adverse medical condition of any kind especially Heart/Stroke/Cancer/Renal disorder/Alzheimer\'s disease/Parkinsons\'s disease?',
                        style: Ts.bold15(AppColors.secondaryColor)),
                    SizedBox(height: 10.h),
                    Obx(
                      () => GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 151 / 48,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                        ),
                        itemCount: healthInsurancePlanSelectionController
                            .fieldList2.length,
                        itemBuilder: (context, index) {
                          return FieldWithRadioView(
                            ishealthForm: true,
                            text: healthInsurancePlanSelectionController
                                .fieldList2[index].text
                                .toString(),
                            isSelected: RxBool(
                                healthInsurancePlanSelectionController
                                    .fieldList2[index].isChecked),
                            onClick: () {
                              healthInsurancePlanSelectionController
                                  .OnMedicalGrid2Change(index);
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
