// ignore_for_file: must_be_immutable
import 'package:bima_g/app/widgets/bimag_no_data_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../utility/utils.dart';
import '../../../enums.dart';
import '../../../module_controllers.dart';
import '../../../widgets/bimag_loading.dart';
import '../../../widgets/buttons.dart';
import '../controllers/profile_family_controller.dart';
import 'add_family_member_form_view.dart';
import 'add_family_member_view.dart';

class ProfileFamilyView extends GetView<ProfileFamilyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        onRefresh: profileFamilyController.onRefresh,
        controller: profileFamilyController.familyRefreshController,
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Expanded(
              child: Obx(
                () => profileFamilyController.familyMemberList.isEmpty
                    ? (profileFamilyController.apiStatus.value ==
                            ApiStatus.Loading
                        ? LoadingBimaG()
                        : NoDataFoundBimaG())
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount:
                            profileFamilyController.familyMemberList.length,
                        itemBuilder: (ctx, index) => AddFamilyMemberView(
                          onTap: () {
                            profileFamilyController.editMemberID =
                                profileFamilyController
                                        .familyMemberList[index].memberId ??
                                    0;

                            for (int i = 0;
                                i < profileFamilyController.listRelation.length;
                                i++) {
                              if (profileFamilyController.listRelation[i].id
                                      .toString() ==
                                  profileFamilyController
                                      .familyMemberList[index].relationShipType
                                      .toString()) {
                                profileFamilyController.selectedRelation =
                                    profileFamilyController.listRelation[i];
                              }
                            }

                            profileFamilyController
                                    .familyMemberAgeController.value.text =
                                '${profileFamilyController.familyMemberList[index].dob!.day.toString().padLeft(2, '0')} ${Utils.getMonthName(profileFamilyController.familyMemberList[index].dob!.month)} ${profileFamilyController.familyMemberList[index].dob!.year}';

                            profileFamilyController.familyMemberNameController
                                .value.text = profileFamilyController
                                    .familyMemberList[index].fullName ??
                                '';

                            profileFamilyController
                                    .selectedNewMemberBirthDate.value =
                                profileFamilyController
                                    .familyMemberList[index].dob;

                            profileFamilyController.selectedAddFamilyGender =
                                profileFamilyController
                                        .familyMemberList[index].gender ??
                                    'Male';

                            Get.to(AddFamilyMemberFormView());
                          },
                          timeText: (profileFamilyController
                                          .familyMemberList[index].dob!.year -
                                      DateTime.now().year)
                                  .toString()
                                  .replaceAll('-', '') +
                              '\nYear',
                          memberName: profileFamilyController
                              .familyMemberList[index].fullName
                              .toString(),
                          memberRelation: Utils.getRelation(
                              profileFamilyController.familyMemberList[index]
                                      .relationShipType ??
                                  0),
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 8.h),
                      ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.h),
        child: SizedBox(
          key:Key('add_a_family_member_key'),
          height: 40.h,
          child: RoundSquareButtons.buttonEnabled(
              onPressed: () {
                profileFamilyController.editMemberID = 0;

                profileFamilyController.selectedRelation =
                    profileFamilyController.listRelation.first;

                profileFamilyController.familyMemberAgeController.value.text =
                    '';

                profileFamilyController.familyMemberNameController.value.text =
                    '';

                profileFamilyController.selectedNewMemberBirthDate.value =
                    DateTime.now();

                profileFamilyController.selectedAddFamilyGender = 'Male';

                Get.to(AddFamilyMemberFormView());
              },
              text: 'add_a_family_member'.tr),
        ),
      ),
    );
  }
}
