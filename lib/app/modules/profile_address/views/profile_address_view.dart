import 'package:bima_g/app/enums.dart';
import 'package:bima_g/app/modules/profile_address/views/add_address_member_view.dart';
import 'package:bima_g/app/widgets/bimag_loading.dart';
import 'package:bima_g/app/widgets/bimag_no_data_found.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../module_controllers.dart';
import '../../../widgets/buttons.dart';
import '../controllers/profile_address_controller.dart';
import 'add_new_address_form_view.dart';

class ProfileAddressView extends GetView<ProfileAddressController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        controller: profileAddressController.addressRefreshController,
        onRefresh: profileAddressController.onRefresh,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Obx(() => getView()),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.h),
        child: SizedBox(
          key:Key('add_a_new_address_key'),
          height: 40.h,
          child: RoundSquareButtons.buttonEnabled(
              onPressed: () {
                profileAddressController.editAddressId = 0;
                Get.to(AddNewAddressFormView());
              },
              text: 'add_new_Address'.tr),
        ),
      ),
    );
  }

  getView() {
    if (profileAddressController.getAddressStatus.value == ApiStatus.Loading) {
      return LoadingBimaG();
    }

    if (profileAddressController.getAddressStatus.value ==
        ApiStatus.EmptyData) {
      return Obx(
        () => ListView.separated(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: profileAddressController.addressMemberList.length,
          itemBuilder: (ctx, index) => AddAddressMemberView(
            onEdit: () => profileAddressController.onEditAddress(
                profileAddressController.addressMemberList[index]),
            onDelete: () {
              profileAddressController.deleteAssets();
            },
            title: Utils.getAddressType(
                profileAddressController.addressMemberList[index].addressType ??
                    1),
            userName: profileController.userName.value,
            imageUrl: AssetPath.home_outline,
            heading: profileAddressController.addressMemberList[index].city
                .toString(),
            description: profileAddressController
                    .addressMemberList[index].streetAddress
                    .toString() +
                ', ' +
                profileAddressController.addressMemberList[index].city
                    .toString() +
                ', ' +
                profileAddressController.addressMemberList[index].district
                    .toString() +
                ', ' +
                profileAddressController.addressMemberList[index].state
                    .toString() +
                ' - ' +
                profileAddressController.addressMemberList[index].pincode
                    .toString(),
          ),
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: 16.h),
        ),
      );
    }

    return NoDataFoundBimaG();
  }
}
