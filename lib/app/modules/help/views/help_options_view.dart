import 'package:bima_g/app/modules/help/views/component_views/get_help_top_area_view.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../module_controllers.dart';
import '../../insurance_appbar/views/insurance_appbar_view.dart';
import 'custom/help_options_expand_btn.dart';

class HelpOptionsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'get_help'.tr,
        ),
        preferredSize: Size.fromHeight(60.h),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetHelpTopAreaview(),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'how_can_we_help'.tr,
              style: Ts.bold13(AppColors.grey5),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: helpController.helpOptionsList.length,
                itemBuilder: (context, index) {
                  return HelpExpandButtonView(
                    index: index,
                    child: helpController.fetchOptionsList(index),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 8.h),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
