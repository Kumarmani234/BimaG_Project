// ignore_for_file: must_be_immutable

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/home_insurance_module/home_insurance_plan_selection/views/tabs/address_detail_tab_view.dart';
import 'package:bima_g/app/modules/home_insurance_module/home_insurance_plan_selection/views/tabs/home_selection_form_tabbar_view.dart';
import 'package:bima_g/app/modules/home_insurance_module/home_insurance_plan_selection/views/tabs/personal_detail_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../insurance_components/insurance_backup_selection_view.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';
import 'home_insurance_proposal_form_bottombar.dart';

class HomeInsuranceProposalFormView extends GetView {
  List<GlobalKey<FormState>> formKeys = [
    homeInsurancePlanSelectionController.PersionalDetailFormKey,
    homeInsurancePlanSelectionController.AddressDetailFormKey,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'proposal_form'.tr,
        ),
        preferredSize: Size.fromHeight(50.h),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            child: HomeSelectionFormTabbarView(),
          ),
          Obx(
            () {
              switch (
                  homeInsurancePlanSelectionController.currentTabIndex.value) {
                case 0:
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: homeInsurancePlanSelectionController
                            .PersionalDetailFormKey,
                        child: PersonalDetailTabView(),
                      ),
                    ),
                  );
                case 1:
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: homeInsurancePlanSelectionController
                            .AddressDetailFormKey,
                        child: AddressDetailTabView(),
                      ),
                    ),
                  );
                default:
                  return Container(); // handle invalid index
              }
            },
          ),
        ],
      ),
      bottomSheet: Obx(
        () => Visibility(
          visible: homeInsurancePlanSelectionController.isShowBottomSheet.value,
          child: InsuranceBackupView(
            onSheetCloseIconTap: () {
              homeInsurancePlanSelectionController.toggleShowBottomSheet();
              homeInsurancePlanSelectionController.toggleBottomIcon();
            },
          ),
        ),
      ),
      bottomNavigationBar: home_insurance_proposal_bottombar(
        formKeys: formKeys,
        onPremimunIconTap: () {
          // print('############## clicked #############');
          homeInsurancePlanSelectionController.toggleShowBottomSheet();
          homeInsurancePlanSelectionController.toggleBottomIcon();
        },
      ),
    );
  }
}
