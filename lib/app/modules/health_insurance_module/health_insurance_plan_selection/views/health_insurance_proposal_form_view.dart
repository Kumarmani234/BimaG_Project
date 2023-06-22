// ignore_for_file: must_be_immutable

import 'package:bima_g/app/modules/health_insurance_module/health_insurance_plan_selection/views/proposal_from/congratulations_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../insurance_components/insurance_backup_selection_view.dart';
import '../../../../module_controllers.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';
import 'plan_selection/health_insurance_selection_bottombar_view.dart';
import 'proposal_from/health_form_tab_view.dart';
import 'proposal_from/medical_tab_view.dart';
import 'proposal_from/members_tab_view.dart';
import 'proposal_from/nominee_tab_view.dart';
import 'proposal_from/proposer_tab_view.dart';

class HealthInsuranceProposalFormView extends GetView {
  List<GlobalKey<FormState>> formKeys = [
    healthInsurancePlanSelectionController.proposerTabFormkey,
    healthInsurancePlanSelectionController.membersTabFormkey,
    healthInsurancePlanSelectionController.medicalTabFormkey,
    healthInsurancePlanSelectionController.nomineeTabFormkey,
  ];
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
            child: HealthFormTabView(),
          ),
          Obx(
            () {
              switch (healthInsurancePlanSelectionController
                  .currentTabIndex.value) {
                case 0:
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: healthInsurancePlanSelectionController
                            .proposerTabFormkey,
                        child: ProposerTabView(),
                      ),
                    ),
                  );
                case 1:
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: healthInsurancePlanSelectionController
                            .membersTabFormkey,
                        child: MembersTabView(),
                      ),
                    ),
                  );
                case 2:
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: healthInsurancePlanSelectionController
                            .medicalTabFormkey,
                        child: MedicalTabView(),
                      ),
                    ),
                  );
                case 3:
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: healthInsurancePlanSelectionController
                            .nomineeTabFormkey,
                        child: NomineeTabView(),
                      ),
                    ),
                  );
                default:
                  return CongratulationsView(); // handle invalid index
              }
            },
          ),
        ],
      ),
      bottomSheet: Obx(
        () => Visibility(
          visible:
              healthInsurancePlanSelectionController.isShowBottomSheet.value,
          child: InsuranceBackupView(
            onSheetCloseIconTap: () {
              healthInsurancePlanSelectionController.toggleShowBottomSheet();
              healthInsurancePlanSelectionController.toggleBottomIcon();
            },
          ),
        ),
      ),
      bottomNavigationBar: HealthSlectionBottomBarView(
        formKeys: formKeys,
        onPremimunIconTap: () {
          // print('############## clicked #############');
          healthInsurancePlanSelectionController.toggleShowBottomSheet();
          healthInsurancePlanSelectionController.toggleBottomIcon();
        },
      ),
    );
  }
}
