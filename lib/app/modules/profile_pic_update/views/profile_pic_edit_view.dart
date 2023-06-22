// ignore_for_file: deprecated_member_use, unnecessary_null_comparison, invalid_use_of_protected_member, must_be_immutable, deprecated_export_use

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/widgets/buttons.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:cropperx/cropperx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/styles.dart';
import '../../insurance_appbar/views/insurance_appbar_view.dart';
import '../controllers/profile_pic_update_controller.dart';

class ProfilePicEditView extends GetView<ProfilePicUpdateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'edit_profile_photo'.tr,
          actions: [
            IconButton(
              onPressed: () async {
                await profilePicUpdateController.getImageFromGallery();
              },
              icon: Icon(Icons.photo_library),
            ),
            IconButton(
              onPressed: () async {
                await profilePicUpdateController.getImageFromCamera();
              },
              icon: Icon(Icons.camera),
            ),
          ],
        ),
        preferredSize: Size.fromHeight(70.h),
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => Cropper(
                  overlayType: OverlayType.circle,
                  overlayColor: AppColors.secondaryColor.withOpacity(0.8),
                  cropperKey: profilePicUpdateController.cropperKey,
                  image: profilePicUpdateController.selectedImageFile.value ==
                          null
                      ? (dashboardController.profileUrl.value.isEmpty
                          ? Image.asset(AssetPath.dummy_profile)
                          : Image.network(dashboardController.profileUrl.value))
                      : Image.file(
                          profilePicUpdateController.selectedImageFile.value!),
                ),
              ),
            ),
            Obx(() => Visibility(
                  visible: profilePicUpdateController.selectedImageFile.value !=
                      null,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        boxShadow: [Styles.upperShadow()]),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 40.h,
                            width: 168.w,
                            child: TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                'cancel'.tr,
                                style: Ts.regular15(AppColors.secondaryColor),
                              ),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            height: 40.h,
                            width: 168.w,
                            child: RoundSquareButtons.buttonEnabled(
                              // onPressed: () async {
                              //   var a = await Cropper.crop(
                              //     cropperKey: profilePicUpdateController.cropperKey,
                              //   );
                              //   if (a != null) {
                              //     profilePicUpdateController.croppedImageBytes.value =
                              //         a.toList();
                              //     Get.back(
                              //         result: profilePicUpdateController
                              //             .croppedImageBytes.value);
                              //   }
                              // },
                              onPressed: () =>
                                  profilePicUpdateController.onChooseFile(),
                              text: 'save'.tr,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
