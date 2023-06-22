// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utility/colors.dart';
import '../../utility/ts.dart';

class InsuranceFielsWithIconView extends GetView {
  InsuranceFielsWithIconView({
    // required this.iconData,
    required this.text,
    required this.controller,
    this.onChange,
    required this.imgPath,
    this.onValidate,
    this.isDrop = false,
    this.onTap,
    this.readOnly,
    this.inputFormatters,
    this.textCapitalization,
  });

  // final IconData iconData;
  final String text, imgPath;
  final onChange, onValidate;
  bool? readOnly;
  final onTap;
  TextCapitalization? textCapitalization;
  List<TextInputFormatter>? inputFormatters;

  final Rx<TextEditingController> controller;
  final bool isDrop;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Stack(
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
              child: Row(
                children: [
                  SizedBox(width: 7.w),
                  SvgPicture.asset(imgPath),
                  // Icon(
                  //   iconData,
                  //   color: Color(0xFFC2C2C9),
                  //   size: 24,
                  // ),
                  SizedBox(width: 9.w),
                  SizedBox(
                    width: 150.w,
                    child: TextFormField(
                      onChanged: onChange,
                      onTap: onTap,
                      readOnly: readOnly ?? false,
                      inputFormatters: inputFormatters ?? [],
                      controller: controller.value,
                      validator: onValidate,
                      textCapitalization:
                          textCapitalization ?? TextCapitalization.none,
                      style: Ts.bold15(
                        Color(0xFF0A0A26),
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: text,
                        labelStyle: Ts.regular15(
                          Color(0xFF848493),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 5.h),
                      ),
                    ),
                  ),
                  Spacer(),
                  isDrop
                      ? Wrap(
                          alignment: WrapAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 6.h),
                              child: Text(
                                'existing_vehicle'.tr,
                                style: Ts.regular13(AppColors.secondaryColor),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 30,
                              color: AppColors.secondaryColor,
                            ),
                          ],
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
