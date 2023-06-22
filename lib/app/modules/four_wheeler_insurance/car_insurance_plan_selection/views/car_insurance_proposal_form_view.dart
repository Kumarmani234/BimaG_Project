// ignore_for_file: must_be_immutable

import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance_plan_selection/views/proposal_form/car_insuramce_proposal_bottom_bar.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance_plan_selection/views/proposal_form/car_insurance_proposal_tab_view.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance_plan_selection/views/proposal_form/car_nominee_tab_view.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance_plan_selection/views/proposal_form/car_owner_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../insurance_components/insurance_backup_selection_view.dart';
import '../../../../module_controllers.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';
import 'proposal_form/vehicle_tab_view.dart';

class CarInsuranceProposalFormView extends GetView {
  List<GlobalKey<FormState>> formKeys = [
    carInsurancePlanSelectionController.ownerTabFormkey,
    carInsurancePlanSelectionController.nomineeTabFormkey,
    carInsurancePlanSelectionController.vehicleTabFormkey,
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
            child: CarInsuranceProposalTabView(),
          ),
          Obx(() {
            switch (carInsurancePlanSelectionController.currentTabIndex.value) {
              case 0:
                return Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: carInsurancePlanSelectionController.ownerTabFormkey,
                      child: CarOwnerTabView(),
                    ),
                  ),
                );
              case 1:
                return Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key:
                          carInsurancePlanSelectionController.nomineeTabFormkey,
                      child: CarNomineeTabView(),
                    ),
                  ),
                );
              case 2:
                return Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key:
                          carInsurancePlanSelectionController.vehicleTabFormkey,
                      child: VehicleTabView(),
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
          visible: carInsurancePlanSelectionController.isShowBottomSheet.value,
          child: InsuranceBackupView(
            isHaveDiscountCoupen: false,
            onSheetCloseIconTap: () {
              carInsurancePlanSelectionController.toggleShowBottomSheet();
              carInsurancePlanSelectionController.toggleBottomIcon();
            },
          ),
        ),
      ),
      bottomNavigationBar: CarInsurancePropsalBottombar(
        formKeys: formKeys,
        onPremimunIconTap: () {
          // print('############## clicked #############');
          carInsurancePlanSelectionController.toggleShowBottomSheet();
          carInsurancePlanSelectionController.toggleBottomIcon();
        },
      ),
    );
  }
}
