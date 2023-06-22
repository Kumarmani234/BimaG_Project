import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/register_business/views/custom/buisness_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BusinessTypeTabView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ListView.builder(
          itemCount: registerBusinessController.PersonalInfoGridList.length,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(15.w),
          itemBuilder: (ctx, ind) => BusinessGrid(
            onClick: () => registerBusinessController.onChangeBuisnessInfo(ind),
            registerBusinessPerInfoModel:
                registerBusinessController.PersonalInfoGridList[ind],
          ),
        ),
      ),
    );
  }
}
