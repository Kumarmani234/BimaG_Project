import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utility/colors.dart';
import '../../../../../../utility/ts.dart';

class PrimaryFindTextView extends GetView {
  PrimaryFindTextView({
    required this.search_text,
    this.onSearchClick,
  });

  final String search_text;
  final onSearchClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          search_text + " ",
          style: Ts.regular13(
            AppColors.secondaryColor,
          ),
        ),
        Material(
          color: Colors.transparent,
          child: Ink(
            child: InkWell(
              onTap: onSearchClick,
              child: Text(
                'click_here'.tr,
                style: Ts.regular13(
                  AppColors.primaryColor,
                  isUnderline: true,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
