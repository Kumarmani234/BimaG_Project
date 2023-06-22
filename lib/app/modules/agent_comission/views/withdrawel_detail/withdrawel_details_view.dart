import 'package:bima_g/app/modules/agent_comission/views/withdrawel_detail/withdrawel_link_status.dart';
import 'package:bima_g/app/widgets/buttons.dart';
import 'package:bima_g/utility/styles.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../utility/asset_paths.dart';
import '../../../../../utility/colors.dart';
import '../../../../module_controllers.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';

class WithdrawalDetailsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135.h),
        child: InsuranceAppbarView(
          title: 'withdraw_details'.tr,
          elevation: 0,
          isBottom: true,
          bottom: WithdrawelDetailsAppbarBottom(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
        child: Column(
          children: [
            WithDrawelCommonDetail(),
            SizedBox(height: 16.h),
            WithdrawelLinkStatus()
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            Styles.dropShadowZ200(),
          ],
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w, bottom: 20.h),
          child: RoundSquareButtons.buttonDisabled(
            onPressed: () {},
            text: 'Need Help?',
          ),
        ),
      ),
    );
  }
}

class WithDrawelCommonDetail extends StatelessWidget {
  const WithDrawelCommonDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        color: AppColors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'For',
              style: Ts.regular12(AppColors.grey4),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'A insurer Rahul Kumar Sharma register with link',
                    style: Ts.regular15(AppColors.secondaryColor),
                  ),
                ),
                SizedBox(width: 8.w),
                CircleAvatar(
                  radius: 21.w,
                  backgroundImage:
                      NetworkImage(dashboardController.profileUrl.value),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SvgPicture.asset(
                          AssetPath.verified,
                          height: 22.h,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              'Link',
              style: Ts.regular12(AppColors.grey4),
            ),
            Text(
              'www.bimag.com/hardikUrlRegister',
              style: Ts.regular15(AppColors.secondaryColor),
            ),
            SizedBox(height: 8.h),
            Text(
              'Transaction ID',
              style: Ts.regular12(AppColors.grey4),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'DHF38478GKTJ48392',
                    style: Ts.regular15(AppColors.secondaryColor),
                  ),
                ),
                SvgPicture.asset(AssetPath.copy),
                SizedBox(width: 3.w),
                Text(
                  'Copy',
                  style: Ts.bold15(AppColors.secondaryColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WithdrawelDetailsAppbarBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          color: AppColors.white, boxShadow: [Styles.dropShadowZ100()]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '+₹10',
                    style: Ts.medium24(AppColors.green),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '13 April, 02:14 PM',
                    style: Ts.regular11(AppColors.grey4),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Insurer register with link',
                    style: Ts.regular12(AppColors.secondaryColor),
                  ),
                ],
              ),
            ),
            Container(
              height: 56.h,
              width: 56.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.green.withOpacity(0.1),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: SvgPicture.asset(
                  AssetPath.user_circle_plus,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
