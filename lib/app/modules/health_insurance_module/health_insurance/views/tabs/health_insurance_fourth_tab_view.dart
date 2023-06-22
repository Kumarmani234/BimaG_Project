import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/health_insurance_module/health_insurance/views/tabs/components/details_tab_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';

class HealthInsuranceFourthTabView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'member_have_illness_medical_history'.tr,
                  style: Ts.bold15(AppColors.secondaryColor),
                ),
                SizedBox(height: 16.h),
                Obx(
                  () => Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount:
                          healthInsuranceController.DetailsTabInfoList.length,
                      itemBuilder: (ctx, index) => DetailsTabGridView(
                        isChecked: healthInsuranceController
                            .DetailsTabInfoList[index].isChecked,
                        title_text: healthInsuranceController
                            .DetailsTabInfoList[index].title
                            .toString(),
                        subtitle_text: healthInsuranceController
                            .DetailsTabInfoList[index].subtitle
                            .toString(),
                        onCheck: () {
                          healthInsuranceController
                              .onDetailsCheckboxCheck(index);
                        },
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: 16.h),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
