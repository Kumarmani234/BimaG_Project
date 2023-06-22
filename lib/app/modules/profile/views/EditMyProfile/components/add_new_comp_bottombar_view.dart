import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../../../utility/colors.dart';
import '../../../../../../utility/styles.dart';
import '../../../../../widgets/buttons.dart';

class AddNewCompBottombarView extends GetView {
  AddNewCompBottombarView({required this.onPressed});

  final onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          Styles.upperShadow(),
        ],
      ),
      child: Container(
        key: Key('add_new_document_save_key'),
        height: 40.h,
        padding: EdgeInsets.all(16.w),
        child: RoundSquareButtons.buttonEnabled(
            onPressed: onPressed, text: 'save'.tr),
      ),
    );
  }
}
