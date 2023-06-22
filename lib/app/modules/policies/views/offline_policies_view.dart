// ignore_for_file: must_be_immutable

import 'package:bima_g/app/modules/policies/views/policies_tabs_view.dart';
import 'package:bima_g/app/modules/policies/views/purchased_policy_item_view.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/language_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../utility/ts.dart';
import '../../../../utility/utils.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/buttons.dart';
import '../controllers/policies_controller.dart';

class OfflinePoliciesView extends GetView<PoliciesController> {
  bool fromNoInternetConnection;
  OfflinePoliciesView({this.fromNoInternetConnection = false, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 25.h,
                ),
                if (!fromNoInternetConnection)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: SvgPicture.asset(AssetPath.back_button),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 16.h,
                ),
                Text('Your Offline Policies',
                    style: Ts.semiBold24(Colors.black)),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Your internet is not working properly but you can view your offline policies here.',
                  style: Ts.regular15(AppColors.grey4),
                ),
                SizedBox(
                  height: 20.h,
                ),
                PoliciesTabsView(),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: PurchasedPolicies(),
                ),
              ],
            ),
          ),
          if (fromNoInternetConnection)
            Align(
                alignment: Alignment.bottomCenter,
                child: BottomButton(
                  text: LanguageLabels.getStringLabels('try_again',
                      def: 'Try Again'),
                  secondaryText:
                      'Your internet is not working properly please check your connection and try again',
                  onClick: () async {
                    //check internet connection if available then proceed to next screen
                    if (await Utils.isInternetAvailable()) {
                      Get.toNamed(Routes.SPLASH);
                    }
                  },
                ))
        ],
      ),
    );
  }
}
