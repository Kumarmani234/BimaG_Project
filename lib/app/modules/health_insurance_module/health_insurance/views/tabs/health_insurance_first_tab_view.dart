import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../widgets/field_with_radio_view.dart';

class HealthInsuranceFirstTabView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
          child: Text(
            'who_would_you_like_to_insure'.tr,
            style: Ts.bold15(AppColors.secondaryColor),
          ),
        ),
        Obx(
          () => Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: healthInsuranceController.insuredMembersList.length,
              itemBuilder: (ctx, index) => FieldWithRadioView(
                text: healthInsuranceController
                    .insuredMembersList[index].memberType
                    .toString(),
                isSelected: RxBool(healthInsuranceController
                    .insuredMembersList[index].isSelected),
                onClick: () {
                  healthInsuranceController
                          .insuredMembersList[index].isSelected =
                      !healthInsuranceController
                          .insuredMembersList[index].isSelected;
                  healthInsuranceController.insuredMembersList.refresh();
                },
                isChild:
                    healthInsuranceController.insuredMembersList[index].isChild,
                childCount: healthInsuranceController
                    .insuredMembersList[index].childCount,
                onChangeChild: (int childCount) {
                  healthInsuranceController
                      .insuredMembersList[index].childCount = childCount;
                  healthInsuranceController.insuredMembersList.refresh();
                },
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 16.h),
            ),
          ),
        ),
      ],
    );
  }
}
