// ignore_for_file: must_be_immutable

import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_plan_selection/views/proposal_form/proposal_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../insurance_components/insurance_backup_selection_view.dart';
import '../../../../module_controllers.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';
import 'proposal_form/first_tab_view.dart';
import 'proposal_form/proposal_tab_view.dart';
import 'proposal_form/second_tab_view.dart';
import 'proposal_form/third_tab_view.dart';

class BikeInsuranceProposalFormView extends GetView {
  List<GlobalKey<FormState>> formKeys = [
    twoWheelerPlanSelectionController.ownerTabFormkey,
    twoWheelerPlanSelectionController.nomineeTabFormkey,
    twoWheelerPlanSelectionController.vehicleTabFormkey,
  ];

  final RxBool isPremiumSheetOpen = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'proposal_form'.tr,
        ),
        preferredSize: Size.fromHeight(60.h),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: ProposalTabView(),
          ),
          Obx(() {
            switch (twoWheelerPlanSelectionController.currentTabIndex.value) {
              case 0:
                return Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: twoWheelerPlanSelectionController.ownerTabFormkey,
                      child: FirstTabAsOwnerView(),
                    ),
                  ),
                );
              case 1:
                return Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: twoWheelerPlanSelectionController.nomineeTabFormkey,
                      child: SecondTabAsNomineeView(),
                    ),
                  ),
                );
              case 2:
                return Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: twoWheelerPlanSelectionController.vehicleTabFormkey,
                      child: ThirdTabAsVechicleView(),
                    ),
                  ),
                );
              default:
                return Container(); // handle invalid index
            }
          }),
        ],
      ),
      bottomSheet: Obx(
        () => Visibility(
          visible: twoWheelerPlanSelectionController.isShowBottomSheet.value,
          child: InsuranceBackupView(
            isHaveDiscountCoupen: false,
            onSheetCloseIconTap: () {
              twoWheelerPlanSelectionController.toggleShowBottomSheet();
              twoWheelerPlanSelectionController.toggleBottomIcon();
            },
          ),
        ),
      ),
      bottomNavigationBar: BikeInsurancePropsalBottombar(
        formKeys: formKeys,
        onPremimunIconTap: () {
          twoWheelerPlanSelectionController.toggleShowBottomSheet();
          twoWheelerPlanSelectionController.toggleBottomIcon();
        },
      ),
    );
  }
}
