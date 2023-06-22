import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';
import '../../../../../module_controllers.dart';
import '../../../../../widgets/checkboxes.dart';

class PropertyTypeTabView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
              child: Text(
                'are_you_tenant_or_owner'.tr,
                style: Ts.bold15(AppColors.secondaryColor),
              ),
            ),
            Obx(
              () => ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: homeInsuranceController.OwnerList.length,
                itemBuilder: (ctx, index) => CheckboxWithTextIconView(
                  imageUrl: homeInsuranceController.OwnerList[index].imageUrl,
                  isSelected: RxBool(
                      homeInsuranceController.OwnerList[index].isSelected),
                  title_text:
                      homeInsuranceController.OwnerList[index].title.toString(),
                  subtitle_text: homeInsuranceController
                      .OwnerList[index].subtitle
                      .toString(),
                  onClick: () {
                    homeInsuranceController.onOwnerValueChange(index);
                  },
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 16.h),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
              child: Text(
                'home_or_independant_house'.tr,
                style: Ts.bold15(AppColors.secondaryColor),
              ),
            ),
            Obx(
              () => ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: homeInsuranceController.independentHouseList.length,
                itemBuilder: (ctx, index) => CheckboxWithTextIconView(
                  imageUrl: homeInsuranceController
                      .independentHouseList[index].imageUrl,
                  isSelected: RxBool(homeInsuranceController
                      .independentHouseList[index].isSelected),
                  title_text: homeInsuranceController
                      .independentHouseList[index].title
                      .toString(),
                  subtitle_text: homeInsuranceController
                      .independentHouseList[index].subtitle
                      .toString(),
                  onClick: () {
                    homeInsuranceController.onHouseValueChange(index);
                  },
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 16.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
