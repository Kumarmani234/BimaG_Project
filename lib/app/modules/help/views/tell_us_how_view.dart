// ignore_for_file: deprecated_member_use

import 'package:bima_g/app/enums.dart';
import 'package:bima_g/app/modules/help/views/component_views/get_help_top_area_view.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../widgets/buttons.dart';
import '../../insurance_appbar/views/insurance_appbar_view.dart';
import 'help_chat_view.dart';

class TellUsHowView extends GetView {
  TellUsHowView({this.title, this.subtitle});

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'tell_us_how'.tr,
        ),
        preferredSize: Size.fromHeight(60.h),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetHelpTopAreaview(),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                SelectedDataDisplay(title: title, subtitle: subtitle),
                SizedBox(height: 16.h),
                HowWeHalpView(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomButton(
        key: Key('submit_key'),
        text: 'submit'.tr,
        buttonStatus: ButtonStatus.Active,
        onClick: () => Get.to(GetHelpChatView()),
      ),
    );
  }
}

class SelectedDataDisplay extends StatelessWidget {
  const SelectedDataDisplay({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.w),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? '',
                      style: Ts.medium13(AppColors.grey4),
                    ),
                    SizedBox(height: 7.h),
                    Row(
                      children: [
                        SizedBox(
                          child: SvgPicture.asset(
                            AssetPath.arrow_bend_right,
                            height: 20.h,
                            width: 20.w,
                            color: AppColors.grey5,
                          ),
                        ),
                        SizedBox(width: 7.w),
                        Expanded(
                          child: Text(
                            subtitle ?? '',
                            style: Ts.medium13(AppColors.grey5),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                right: 8.w,
                top: 8.h,
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset(AssetPath.edit_pencil),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class HowWeHalpView extends StatelessWidget {
  const HowWeHalpView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'tell_us_how_we_can_help_u'.tr + "?",
              style: Ts.bold15(AppColors.secondaryColor),
            ),
            SizedBox(height: 15.h),
            Text(
              'enter_the_details_for_your_service_requ'.tr,
              style: Ts.regular12(AppColors.grey5),
            ),
            SizedBox(height: 8.h),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 97.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                border: Border.all(color: AppColors.grey1),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Text(
                  'Nice doctors...Nice staff..It is located on the main road Named Sirsi Road so easily',
                  style: Ts.regular15(AppColors.grey5),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            DottedBorder(
              dashPattern: [3, 3],
              radius: Radius.circular(8.w),
              color: AppColors.grey3,
              child: Material(
                color: Colors.transparent,
                child: Ink(
                  child: InkWell(
                    onTap: () {
                      // memberDocumentController.openFilePicker();
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: Row(
                        children: [
                          Container(
                            height: 56.h,
                            width: 56.h,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                color: AppColors.grey1, shape: BoxShape.circle),
                            child: Center(
                              child: Image.asset(AssetPath.upload_file),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'add_attachment'.tr,
                                style: Ts.bold13(AppColors.grey5),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                'in Jpeg,jpg,png,pgf,docx,doc',
                                style: Ts.regular12(AppColors.grey3),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
