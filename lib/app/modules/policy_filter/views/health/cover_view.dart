import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';
import '../../../../module_controllers.dart';
import '../../../../widgets/field_with_radio_view.dart';
import '../filter_expand_button_view.dart';

class CoverView extends StatelessWidget {
  const CoverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterExpandButtonView(
          index: 0,
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
                //height: policyFilterController.coverTypeList.length > 5 ? 250.h : policyFilterController.coverTypeList.length * 60.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: policyFilterController.coverTypeList.length,
                  itemBuilder: (ctx, index) => Obx(() => ItemWithCheckBox(
                        onClick: () {
                          HapticFeedback.mediumImpact();
                          policyFilterController
                                  .coverTypeList[index].isSelected =
                              !policyFilterController
                                  .coverTypeList[index].isSelected;
                          policyFilterController.coverTypeList.refresh();
                        },
                        text: policyFilterController
                            .coverTypeList[index].garageName,
                        isSelected: policyFilterController
                            .coverTypeList[index].isSelected,
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
