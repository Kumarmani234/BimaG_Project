import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';
import '../../../../module_controllers.dart';
import '../../../../widgets/field_with_radio_view.dart';
import '../filter_expand_button_view.dart';

class PropertyAgeView extends StatelessWidget {
  const PropertyAgeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterExpandButtonView(
          index: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //list garages
              Text(
                'Buying a higher cover reduces the chance of payment from your pocket in case your policy cover gets exhausted',
                style: Ts.regular13(AppColors.grey4),
              ),

              SizedBox(
                height: 15.h,
              ),

              SizedBox(
                //height: policyFilterController.propertyAgeList.length > 5 ? 250.h : policyFilterController.propertyAgeList.length * 60.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: policyFilterController.propertyAgeList.length,
                  itemBuilder: (ctx, index) => Obx(() => ItemWithCheckBox(
                        onClick: () =>
                            policyFilterController.onClickPropertyAge(index),
                        text: policyFilterController
                            .propertyAgeList[index].garageName,
                        isSelected: policyFilterController
                            .propertyAgeList[index].isSelected,
                      )),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
