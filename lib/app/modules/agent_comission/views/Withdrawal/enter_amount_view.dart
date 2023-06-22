import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';
import '../../../../module_controllers.dart';
import '../../../../widgets/textfields.dart';

class EnterAmountView extends StatelessWidget {
  const EnterAmountView({
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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BorderTextField(
              key: Key('amount_key'),
              hintText: 'enter_amount'.tr,
              titleText: 'enter_amount'.tr,
              controller: agentComissionController.amountController.value,
              textInputType: TextInputType.number,
              maxLength: 10,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              suffixIcon: Icon(
                Icons.check,
                color: AppColors.green,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Minimum 1000 withdrawal',
              style: Ts.regular12(AppColors.grey4),
            )
          ],
        ),
      ),
    );
  }
}
