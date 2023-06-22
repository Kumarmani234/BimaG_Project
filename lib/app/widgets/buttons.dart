// ignore_for_file: must_be_immutable

import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utility/styles.dart';
import '../../utility/ts.dart';
import '../enums.dart';

class FilledButton extends StatelessWidget {
  String text;
  FilledButton({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: AppColors.primaryColor),
      child: Text(text, style: Ts.regular15(Colors.white)),
    );
  }
}

class RoundSquareButtons {
  static buttonEnabled({required onPressed, required text}) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0, backgroundColor: AppColors.primaryColor),
        child: Text(text, style: Ts.regular15(AppColors.white)));
  }

  static buttonDisabled({required onPressed, required text}) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: AppColors.primaryColor.withOpacity(0.1)),
        child: Text(text, style: Ts.regular15(AppColors.primaryColor)));
  }

  static buttonWhite({required onPressed, required text}) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0, backgroundColor: AppColors.white),
        child: Text(text, style: Ts.regular15(AppColors.black)));
  }

  static buttonNavigation({required onPressed, required text}) {
    return Stack(
      children: [
        ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                elevation: 0, backgroundColor: AppColors.primaryColor),
            child: Text(text, style: Ts.regular15(AppColors.white))),
        Icon(
          Icons.chevron_right,
          color: AppColors.white,
        )
      ],
    );
  }

  static buttonEnableNavigationExpanded({required onPressed, required text}) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                minimumSize: Size(Get.width.h, 40.h),
                alignment: Alignment.centerLeft,
                elevation: 0,
                backgroundColor: AppColors.primaryColor),
            child: Text(text, style: Ts.medium15(AppColors.white))),
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: Icon(
            Icons.chevron_right,
            color: AppColors.white,
          ),
        )
      ],
    );
  }

  static buttonDisableNavigationExpanded({required onPressed, required text}) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                minimumSize: Size(Get.width.h, 40.h),
                alignment: Alignment.centerLeft,
                elevation: 0,
                backgroundColor: AppColors.primaryColor.withOpacity(0.1)),
            child: Text(text, style: Ts.medium15(AppColors.primaryColor))),
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: Icon(
            Icons.chevron_right,
            color: AppColors.primaryColor,
          ),
        )
      ],
    );
  }
}

class IconButtonRound extends StatelessWidget {
  String title;
  Widget icon;
  double? width;
  final onClick;
  Color? color;
  IconButtonRound(
      {required this.title,
      required this.icon,
      this.width,
      required this.onClick,
      this.color,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: width ?? 100.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.w),
            border:
                Border.all(width: 1, color: color ?? AppColors.primaryColor)),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            Expanded(
                child: Text(
              title,
              style: Ts.regular13(color ?? AppColors.primaryColor),
            )),
            icon
          ],
        ),
      ),
    );
  }
}

class PaymentModeButton extends StatelessWidget {
  String title, iconPath;
  final onClick;
  PaymentModeButton(
      {required this.title,
      required this.iconPath,
      required this.onClick,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onClick,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            SvgPicture.asset(iconPath),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
                child: Text(
              title,
              style: Ts.semiBold15(AppColors.black),
            ))
          ],
        ),
      ),
    );
  }
}

class OutlineButton extends StatelessWidget {
  final onClicked;
  String title;
  bool isSelected;
  OutlineButton(
      {required this.onClicked,
      required this.title,
      required this.isSelected,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          shape: isSelected
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.w),
                  side: BorderSide(width: 1, color: AppColors.primaryColor))
              : null,
        ),
        onPressed: onClicked,
        child: Text(
          title,
          style: Ts.regular15(
              isSelected ? AppColors.primaryColor : AppColors.grey4),
        ));
  }
}

class BottomButton extends StatelessWidget {
  final onClick;
  String text, secondaryText;
  ButtonStatus buttonStatus;

  BottomButton(
      {this.onClick,
      required this.text,
      this.secondaryText = '',
      this.buttonStatus = ButtonStatus.Active,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 20.h),
      width: MediaQuery.of(context).size.width,
      decoration:
          BoxDecoration(color: Colors.white, boxShadow: [Styles.upperShadow()]),
      child: Padding(
        padding: EdgeInsets.all(15.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (secondaryText.isNotEmpty)
              Text(
                secondaryText,
                style: Ts.regular15(AppColors.grey4),
              ),
            if (secondaryText.isNotEmpty)
              SizedBox(
                height: 10.h,
              ),
            Opacity(
              opacity: buttonStatus == ButtonStatus.InActive ? 0.2 : 1.0,
              child: ElevatedButton(
                onPressed: onClick,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical:
                          buttonStatus == ButtonStatus.Loading ? 0 : 10.h),
                  child: buttonStatus == ButtonStatus.Loading
                      ? Image.asset(
                          AssetPath.common_icon_path_png + 'three_bounce.gif',
                          height: 35.h,
                        )
                      : Text(text, style: Ts.regular15(Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ElevatedButtonBimaG extends StatelessWidget {
  final onClick;
  String text;
  ButtonStatus buttonStatus;
    ElevatedButtonBimaG(
      {this.onClick,
      required this.text,
      this.buttonStatus = ButtonStatus.Active,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: buttonStatus == ButtonStatus.InActive ? 0.2 : 1.0,
      child: ElevatedButton(
        onPressed: onClick,
        child: buttonStatus == ButtonStatus.Loading
            ? Image.asset(
                AssetPath.common_icon_path_png + 'three_bounce.gif',
                height: 35.h,
              )
            : Text(
                text,
                style: Ts.regular15(Colors.white),
              ),
      ),
    );
  }
}

class serachVehicleDetailsFieldButton extends StatelessWidget {
  serachVehicleDetailsFieldButton(
      {this.onTap, required this.search_text, required this.iconData});

  final onTap;
  final String search_text;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 48.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(0xFFE7E7E9),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: Container(
            height: 48.h,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Color(0xFFE7E7E9),
                ),
                bottom: BorderSide(
                  color: Color(0xFFE7E7E9),
                ),
                left: BorderSide(
                  color: Color(0xFF4040FF),
                  width: 2.0.w,
                ),
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: Ink(
                child: InkWell(
                  onTap: onTap,
                  child: Row(
                    children: [
                      SizedBox(width: 7.w),
                      Icon(
                        iconData,
                        color: Color(0xFFC2C2C9),
                        size: 24,
                      ),
                      SizedBox(width: 9.w),
                      SizedBox(
                        width: 150.w,
                        child: Text(
                          search_text,
                          style: Ts.regular14(
                            Color(0xFF848493),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
