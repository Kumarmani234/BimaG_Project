import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/styles.dart';
import '../../../../../utility/ts.dart';
import '../../../../module_controllers.dart';
import '../../../near_by/views/near_by_view.dart';

class HelpIntroSearchview extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'how_can_we'.tr,
                style: Ts.medium32(AppColors.secondaryColor),
              ),
              Text(
                'help_u_today'.tr,
                style: Ts.medium32(AppColors.secondaryColor),
              ),
            ],
          ),
        ),
        SizedBox(height: 21.h),
        Container(
          decoration: BoxDecoration(
            boxShadow: [Styles.dropShadowZ100()],
          ),
          child: SearchBarView(
            onChanged: (val) {},
            controller: helpController.helpSearchController.value,
            hintText: 'Search',
          ),
        ),
      ],
    );
  }
}
