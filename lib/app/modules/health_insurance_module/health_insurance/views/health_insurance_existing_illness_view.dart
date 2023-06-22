import 'package:bima_g/app/modules/health_insurance_module/health_insurance/views/tabs/components/existing_liiness_bottom_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';
import '../../../../module_controllers.dart';
import '../../../../widgets/field_with_radio_view.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';

class HealthInsuranceExistingIllnessView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'health_insurance'.tr,
        ),
        preferredSize: Size.fromHeight(60.h),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible:
                    healthInsuranceController.DetailsTabInfoList[0].isChecked,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'tell_us_about_illness'.tr,
                      style: Ts.bold15(AppColors.secondaryColor),
                    ),
                    SizedBox(height: 16.h),
                    Obx(
                      () => ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            healthInsuranceController.existingLillness.length,
                        itemBuilder: (ctx, index) => FieldWithRadioView(
                          text: healthInsuranceController
                              .existingLillness[index].memberType
                              .toString(),
                          isSelected: RxBool(healthInsuranceController
                              .existingLillness[index].isSelected),
                          onClick: () {
                            healthInsuranceController
                                    .existingLillness[index].isSelected =
                                !healthInsuranceController
                                    .existingLillness[index].isSelected;
                            healthInsuranceController.existingLillness
                                .refresh();
                          },
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 16.h),
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
              Visibility(
                visible:
                    healthInsuranceController.DetailsTabInfoList[1].isChecked,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'tell_us_about_surgical_procedure'.tr,
                      style: Ts.bold15(AppColors.secondaryColor),
                    ),
                    SizedBox(height: 16.h),
                    Obx(
                      () => ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            healthInsuranceController.surgicalProcedure.length,
                        itemBuilder: (ctx, index) => FieldWithRadioView(
                          text: healthInsuranceController
                              .surgicalProcedure[index].memberType
                              .toString(),
                          isSelected: RxBool(healthInsuranceController
                              .surgicalProcedure[index].isSelected),
                          onClick: () {
                            healthInsuranceController
                                    .surgicalProcedure[index].isSelected =
                                !healthInsuranceController
                                    .surgicalProcedure[index].isSelected;
                            healthInsuranceController.surgicalProcedure
                                .refresh();
                          },
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 16.h),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ExistingLillnessBottomBar(),
    );
  }
}
