// ignore_for_file: invalid_use_of_protected_member

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/profile_pic_update/views/profile_pic_edit_view.dart';
import 'package:bima_g/app/widgets/buttons.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/profile_pic_update_controller.dart';

class ProfilePicUpdateView extends GetView<ProfilePicUpdateController> {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => CircleAvatar(
                backgroundImage: dashboardController.profileUrl.value.isEmpty
                    ? Image.asset(AssetPath.dummy_profile).image
                    : Image.network(dashboardController.profileUrl.value).image,
                // Image.memory(
                //     base64Decode(dashboardController.profileUrl.value),
                //   ).image,
                maxRadius: 28,
                /* child: ClipOval(
                  child: Container(
                    width: 56,
                    height: 56,
                    child: Obx(
                      () => profilePicUpdateController
                              .croppedImageBytes.isNotEmpty
                          ? Image.memory(
                              Uint8List.fromList(
                                profilePicUpdateController.croppedImageBytes
                                    .toList(),
                              ),
                              fit: BoxFit.cover,
                            )
                          : Container(),
                    ),
                  ),
                ),*/
              ),
            ),
            Spacer(),
            RoundSquareButtons.buttonDisabled(
              onPressed: () => Get.to(ProfilePicEditView()),
              text: 'edit_image'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
