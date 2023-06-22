import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';
import '../../../../module_controllers.dart';
import '../custom/withdrawel_item_widget.dart';

class SelectBankView extends StatelessWidget {
  const SelectBankView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h, bottom: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'select_bank'.tr,
              style: Ts.regular12(AppColors.grey4),
            ),
            SizedBox(height: 10.h),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => withdrawel_item_widget(
                title: agentComissionController.bankList[index].title,
                subtitle: agentComissionController.bankList[index].subtitle,
                image: agentComissionController.bankList[index].imageUrl,
                isSelected: agentComissionController.bankList[index].isSelected,
              ),
              separatorBuilder: (context, index) => SizedBox(height: 8.h),
              itemCount: agentComissionController.bankList.length,
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: AppColors.secondaryColor,
                      size: 19,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'add_new_bank'.tr,
                      style: Ts.bold15(AppColors.secondaryColor),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
