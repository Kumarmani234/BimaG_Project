// ignore_for_file: must_be_immutable

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/ts.dart';
import '../filter_expand_button_view.dart';

class NoClaimBonusView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterExpandButtonView(
          index: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Click to know more about ',
                    style: Ts.regular13(AppColors.grey4),
                  ),
                  Text(
                    'No Claim Bonus',
                    style: Ts.bold14(AppColors.primaryColor)
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Was there any claim in last year ?',
                style: Ts.regular15(AppColors.grey4),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: () {
                          policyFilterController.claimAble.value =
                              !policyFilterController.claimAble.value;
                          policyFilterController.ClaimDisable.value = false;
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColors.primaryColor.withOpacity(
                              policyFilterController.claimAble.value ? 1 : 0.1),
                        ),
                        child: Text(
                          'Yes',
                          style: Ts.regular15(
                              policyFilterController.claimAble.value
                                  ? AppColors.white
                                  : AppColors.primaryColor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: () {
                          policyFilterController.claimAble.value = false;
                          policyFilterController.ClaimDisable.value =
                              !policyFilterController.ClaimDisable.value;
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColors.primaryColor.withOpacity(
                              policyFilterController.ClaimDisable.value
                                  ? 1
                                  : 0.1),
                        ),
                        child: Text(
                          'No',
                          style: Ts.regular15(
                              policyFilterController.ClaimDisable.value
                                  ? AppColors.white
                                  : AppColors.primaryColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Obx(
                () => Visibility(
                  visible: policyFilterController.ClaimDisable.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select previous year NCB',
                        style: Ts.regular15(AppColors.grey4),
                      ),
                      SizedBox(height: 12.h),
                      GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 151 / 48,
                          crossAxisSpacing: 5.w,
                          mainAxisSpacing: 5.h,
                        ),
                        itemCount:
                            policyFilterController.NCBSelectionList.length,
                        itemBuilder: (context, index) {
                          return Obx(
                            () => Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                color: policyFilterController
                                        .NCBSelectionList[index].isButtonAble
                                    ? AppColors.primaryColor
                                    : AppColors.primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8.w),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: Ink(
                                  child: InkWell(
                                    onTap: () {
                                      policyFilterController
                                          .onPreviousClaimSelect(index);
                                    },
                                    child: Center(
                                      child: Text(
                                        policyFilterController
                                            .NCBSelectionList[index].text,
                                        style: Ts.regular15(
                                          policyFilterController
                                                  .NCBSelectionList[index]
                                                  .isButtonAble
                                              ? AppColors.white
                                              : AppColors.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}






// import 'package:bima_g/utility/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:get/get.dart';

// import '../../../../../utility/ts.dart';
// import '../../../../module_controllers.dart';
// import '../../../../widgets/buttons.dart';
// import '../filter_expand_button_view.dart';

// class NoClaimBonusView extends GetView {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         FilterExpandButtonView(
//           index: 1,
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     'Click to know more about ',
//                     style: Ts.regular13(AppColors.grey4),
//                   ),
//                   Text(
//                     'No Claim Bonus',
//                     style: Ts.bold14(AppColors.primaryColor)
//                         .copyWith(decoration: TextDecoration.underline),
//                   ),
//                 ],
//               ),

//               SizedBox(
//                 height: 15.h,
//               ),

//               //switches
//               Obx(
//                 () => NCBView(
//                   title: 'Current applicable NCB',
//                   isSelected: policyFilterController.currentApplicableNcb.value,
//                   onYesClick: () =>
//                       policyFilterController.currentApplicableNcb.value = true,
//                   onNoClick: () =>
//                       policyFilterController.currentApplicableNcb.value = false,
//                 ),
//               ),
//               Obx(
//                 () => NCBView(
//                   title: 'Previous year NCB',
//                   isSelected: policyFilterController.prevYearNcb.value,
//                   onYesClick: () =>
//                       policyFilterController.prevYearNcb.value = true,
//                   onNoClick: () =>
//                       policyFilterController.prevYearNcb.value = false,
//                 ),
//               ),
//               Obx(
//                 () => NCBView(
//                   title: 'Claims in last policy',
//                   isSelected: policyFilterController.claimsInLastPolicy.value,
//                   onYesClick: () =>
//                       policyFilterController.claimsInLastPolicy.value = true,
//                   onNoClick: () =>
//                       policyFilterController.claimsInLastPolicy.value = false,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class NCBView extends StatelessWidget {
//   bool isSelected;
//   String title;
//   final onYesClick, onNoClick;
//   NCBView(
//       {required this.title,
//       required this.isSelected,
//       required this.onYesClick,
//       required this.onNoClick,
//       Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     print('isSelected  :$isSelected');
//     return Row(
//       children: [
//         Text(title, style: Ts.regular15(AppColors.grey4)),
//         Spacer(),
//         isSelected
//             ? RoundSquareButtons.buttonEnabled(
//                 onPressed: onYesClick, text: 'Yes')
//             : RoundSquareButtons.buttonDisabled(
//                 onPressed: onYesClick, text: 'Yes'),
//         SizedBox(
//           width: 10.w,
//         ),
//         isSelected
//             ? RoundSquareButtons.buttonDisabled(
//                 onPressed: onNoClick, text: 'No')
//             : RoundSquareButtons.buttonEnabled(onPressed: onNoClick, text: 'No')
//       ],
//     );
//   }
// }


