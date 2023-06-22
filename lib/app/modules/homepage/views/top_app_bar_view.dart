import 'package:bima_g/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/ts.dart';

class TopAppBarView extends GetView<DashboardController> {
  TopAppBarView({
    required this.title,
    required this.subtitle,
    required this.actionIcon,
    required this.imgUrl,
    this.onPressed,
    this.OnTap,
    this.isAgentTopbar = false,
    this.elevation,
  });

  final String title;
  final String subtitle;
  final String imgUrl;
  final OnTap;
  final bool isAgentTopbar;
  final double? elevation;
  final VoidCallback? onPressed;
  final IconData actionIcon;

  @override
  Widget build(BuildContext context) {
    print('appbar url : ${imgUrl}');
    return AppBar(
      elevation: elevation ?? 10,
      toolbarHeight: 90.h,
      leading: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: OnTap, //=> Get.toNamed(Routes.LANGUAGES),
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, top: 10.h),
          child: CircleAvatar(
            key: Key('menu_drawer_key'),
            backgroundImage: imgUrl.isEmpty
                ? Image.asset(AssetPath.dummy_profile).image
                : Image.network(imgUrl).image,
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 8.h,
          ),
          Text(title, style: Ts.medium17(AppColors.secondaryColor)),
          SizedBox(height: 2.h),
          Row(
            children: [
              Text(
                subtitle,
                style: Ts.regular13(AppColors.grey5),
              ),
              SizedBox(width: 5.w),
              isAgentTopbar ? SvgPicture.asset(AssetPath.verified) : SizedBox()
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          key: Key('arrow_right_key'),
          onPressed: onPressed ?? null,
          icon: Icon(actionIcon, color: AppColors.grey5),
        ),
      ],
    );
  }
}
