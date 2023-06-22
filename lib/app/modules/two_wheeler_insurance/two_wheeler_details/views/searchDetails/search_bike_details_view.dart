// ignore_for_file: must_be_immutable

import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_details/controllers/bike_insurance_search_controller.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../module_controllers.dart';
import '../../../../insurance_appbar/views/insurance_appbar_view.dart';
import '../../../../near_by/views/near_by_view.dart';

class SearchBikeDetailsView extends GetView<BikeInsuranceSearchController> {
  final int selectedTabId;
  Function? callbackData;
  SearchBikeDetailsView({required this.selectedTabId, this.callbackData});

  @override
  Widget build(BuildContext context) {
    String title = '';
    switch (selectedTabId) {
      case 0:
        title = bikeInsuranceSearchController
            .searchDetailsList[0].appbar_title_text
            .toString();
        break;
      case 1:
        title = bikeInsuranceSearchController
            .searchDetailsList[1].appbar_title_text
            .toString();
        break;
      case 2:
        title = bikeInsuranceSearchController
            .searchDetailsList[2].appbar_title_text
            .toString();
        break;
      case 3:
        title = bikeInsuranceSearchController
            .searchDetailsList[3].appbar_title_text
            .toString();
        break;
      case 4:
        title = bikeInsuranceSearchController
            .searchDetailsList[4].appbar_title_text
            .toString();
        break;
    }
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: title,
        ),
        preferredSize: Size.fromHeight(60.h),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60.h,
              decoration: BoxDecoration(boxShadow: [Styles.shadow()]),
              child: Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 10.h),
                child: SizedBox(
                  child: SearchBarView(
                    key: Key('search_key'),
                    onChanged: (val) {
                      print(val.toString());
                      bikeInsuranceSearchController.fetchList(val.toString());
                    },
                    controller:
                        bikeInsuranceSearchController.searchController.value,
                    hintText: title + " " + "Here",
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.separated(
                  itemCount: bikeInsuranceSearchController.stringList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 48.h,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        boxShadow: [Styles.shadow()],
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: Ink(
                          child: InkWell(
                            onTap: () {
                              callbackData!(bikeInsuranceSearchController
                                  .stringList[index]);
                            },
                            child: Center(
                              child: Text(
                                bikeInsuranceSearchController.stringList[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 8.h);
                  },
                  padding: EdgeInsets.only(
                      left: 16.w, right: 16.w, top: 10.h, bottom: 50.h),
                  physics: BouncingScrollPhysics(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
