import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';
import '../../../../module_controllers.dart';
import '../../../../widgets/field_with_radio_view.dart';
import '../../../../widgets/textfields.dart';
import '../filter_expand_button_view.dart';

class SelectedGaragesView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterExpandButtonView(
          index: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //search garages
              BorderTextField(
                controller: policyFilterController.garageSearchCon,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search Garages',
                titleText: '',
                onChange: (val) => print(val.toString()),
              ),
              SizedBox(
                height: 15.h,
              ),
              //list garages
              Text(
                'Garage near me',
                style: Ts.regular13(AppColors.grey4),
              ),

              SizedBox(
                height: 15.h,
              ),

              SizedBox(
                height: policyFilterController.nearByGarageList.length > 5
                    ? 250.h
                    : policyFilterController.nearByGarageList.length * 60.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: policyFilterController.nearByGarageList.length,
                  itemBuilder: (ctx, index) => Obx(
                    () => ItemWithCheckBox(
                      onClick: () {
                        HapticFeedback.mediumImpact();
                        policyFilterController
                                .nearByGarageList[index].isSelected =
                            !policyFilterController
                                .nearByGarageList[index].isSelected;
                        policyFilterController.nearByGarageList.refresh();
                      },
                      text: policyFilterController
                          .nearByGarageList[index].garageName,
                      isSelected: policyFilterController
                          .nearByGarageList[index].isSelected,
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
