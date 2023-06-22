import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../module_controllers.dart';

class NewInsuranceListView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 25.h),
          Text(
            key:Key('list_view_key'),
            'buy_new_insurance'.tr,
            style: Ts.bold14(Colors.black),
          ),
          SizedBox(height: 20.h),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.w,
            childAspectRatio: 1,
            physics: NeverScrollableScrollPhysics(),
            children: [
              for (int i = 0; i < homeController.listPolicesType.length; i++)
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.h),
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: Ink(
                      child: InkWell(
                        onTap: () => homeController.navigatePolicy(i),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              key:Key('insurance_${i}_type'),
                                homeController.listPolicesType[i].imagePath),
                            Text(
                              homeController.listPolicesType[i].policyName.tr,
                              style: Ts.semiBold13(Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
