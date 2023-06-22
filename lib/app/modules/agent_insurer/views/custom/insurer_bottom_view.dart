import 'package:bima_g/app/modules/agent_add_insurer/views/agent_add_insurer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';
import '../../../../widgets/bottomsheet.dart';
import '../../../../widgets/buttons.dart';

class AgentInsurerBottomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h, top: 16.h),
      child: RoundSquareButtons.buttonEnabled(
        onPressed: () {
          HapticFeedback.mediumImpact();
          CustomBottomSheet(
            title: 'add_insurer'.tr,
          ).showBottomSheet(
            Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Text(
                    'Adding an insurer manually allows for more control and customization, while sending a link can save time by automatically populating the insurer\'s details based on the provided information.',
                    style: Ts.regular15(AppColors.grey4),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Get.back(),
                          child: Text(
                            'send_insurer_link'.tr,
                            style: Ts.regular15(AppColors.secondaryColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                            Get.to(AgentAddInsurerView());
                          },
                          child: Text(
                            key:Key('add_insurer_key'),
                            'add_insurer'.tr,
                            style: Ts.regular15(Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        text: 'add_insurer'.tr,
      ),
    );
  }
}
