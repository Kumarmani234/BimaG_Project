import 'package:bima_g/app/widgets/bimag_no_data_found.dart';
import 'package:bima_g/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../utility/asset_paths.dart';
import '../../../enums.dart';
import '../../../module_controllers.dart';
import '../../../widgets/bimag_loading.dart';
import '../../../widgets/buttons.dart';
import '../controllers/profile_assets_controller.dart';
import 'add_assets_member_view.dart';
import 'add_new_assets_form_view.dart';

class ProfileAssetsView extends GetView<ProfileAssetsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        controller: profileAssetsController.assetsRefreshController,
        onRefresh: profileAssetsController.onRefresh,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Obx(
                  () => profileAssetsController.vehicleList.isEmpty &&
                          profileAssetsController.propertyList.isEmpty
                      ? (profileAssetsController.apiStatus.value ==
                              ApiStatus.Loading
                          ? LoadingBimaG()
                          : NoDataFoundBimaG())
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: profileAssetsController.vehicleList.length,
                          itemBuilder: (ctx, index) => AddAssetsMemberView(
                            onDelete: () {
                              profileAssetsController.deleteAssets();
                            },
                            onEdit: () {
                              profileAssetsController.onEditVehicle(
                                  profileAssetsController.vehicleList[index]);
                            },
                            title: profileAssetsController
                                    .vehicleList[index].vehicleCompanyName
                                    .toString() +
                                ' ' +
                                profileAssetsController
                                    .vehicleList[index].vehicleModelName
                                    .toString(),
                            subtitle: profileAssetsController
                                .vehicleList[index].registrationNumber
                                .toString()
                                .toUpperCase(),
                            imageUrl: profileAssetsController
                                        .vehicleList[index].type
                                        .toString() ==
                                    '1'
                                ? AssetPath.bike_outline
                                : AssetPath.car_outline,
                            key1: 'Reg. Year',
                            key2: 'Fuel Type',
                            key3: 'Policy Expiry Date',
                            val1: profileAssetsController
                                .vehicleList[index].registrationYear
                                .toString(),
                            val2: profileAssetsController
                                .vehicleList[index].fuelTypeName
                                .toString(),
                            val3:
                                '${profileAssetsController.vehicleList[index].policyExpiryDate!.day.toString().padLeft(2, '0')} ${Utils.getMonthName(profileAssetsController.vehicleList[index].policyExpiryDate!.month)} ${profileAssetsController.vehicleList[index].policyExpiryDate!.year}',
                          ),
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(height: 10.h),
                        ),
                ),
                SizedBox(height: 15.h),
                Obx(
                  () => profileAssetsController.vehicleList.isEmpty &&
                          profileAssetsController.propertyList.isEmpty
                      ? (profileAssetsController.vehicleList.isNotEmpty &&
                              profileAssetsController.propertyList.isEmpty
                          ? NoDataFoundBimaG()
                          : Container())
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:
                              profileAssetsController.propertyList.length,
                          itemBuilder: (ctx, index) => AddAssetsMemberView(
                            onDelete: () =>
                                profileAssetsController.deleteAssets(),
                            onEdit: () => profileAssetsController
                                .onEditProperty(profileAssetsController
                                    .propertyList[index]),
                            title:
                                'Age of Property (${profileAssetsController.propertyList[index].propertyType == 1 ? 'Owned' : 'Rented'})',
                            subtitle: profileAssetsController
                                .propertyList[index].propertyAge
                                .toString(),
                            imageUrl: AssetPath.home_outline,
                            key1: 'Structure Value',
                            key2: 'Content Value',
                            key3: 'Policy Expiry Date',
                            val1: profileAssetsController
                                .propertyList[index].propertyValue
                                .toString(),
                            val2: '0',
                            val3:
                                '${profileAssetsController.propertyList[index].policyExpiryDate!.day.toString().padLeft(2, '0')} ${Utils.getMonthName(profileAssetsController.propertyList[index].policyExpiryDate!.month)} ${profileAssetsController.propertyList[index].policyExpiryDate!.year}',
                          ),
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(height: 10.h),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.h),
        child: SizedBox(
          key: Key('add_new_assets_key'),
          height: 40.h,
          child: RoundSquareButtons.buttonEnabled(
              onPressed: () {
                profileAssetsController.editVehicleID = 0;

                profileAssetsController.editPropertyID = 0;

                Get.to(AddNewAssetsFormView());
              },
              text: 'add_new_assets'.tr),
        ),
      ),
    );
  }
}
