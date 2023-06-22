import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';
import '../../../../module_controllers.dart';
import '../../../../widgets/field_with_radio_view.dart';
import '../filter_expand_button_view.dart';

class PremiumView extends StatelessWidget {
  const PremiumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterExpandButtonView(
          index: 3,
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
                //height: policyFilterController.premiumTypeList.length > 5 ? 250.h : policyFilterController.premiumTypeList.length * 60.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: policyFilterController.premiumTypeList.length,
                  itemBuilder: (ctx, index) => Obx(() => ItemWithCheckBox(
                        onClick: () {
                          HapticFeedback.mediumImpact();
                          policyFilterController
                                  .premiumTypeList[index].isSelected =
                              !policyFilterController
                                  .premiumTypeList[index].isSelected;
                          policyFilterController.premiumTypeList.refresh();
                        },
                        text: policyFilterController
                            .premiumTypeList[index].garageName,
                        isSelected: policyFilterController
                            .premiumTypeList[index].isSelected,
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
