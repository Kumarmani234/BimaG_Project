import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/policy_filter/controllers/policy_filter_controller.dart';
import 'package:bima_g/app/modules/sort_by/views/sort_by_view.dart';
import 'package:bima_g/app/widgets/bottomsheet.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';

class FiltersView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 168.w,
          child: InkWell(
            onTap: () {
              HapticFeedback.mediumImpact();
              navigateToFilter();
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Image.asset(AssetPath.filterSorting_png),
                Container(
                  width: 100.w,
                  padding: EdgeInsets.only(left: 55.w),
                  child: Text(
                    'filter'.tr,
                    maxLines: 1,
                    style: Ts.bold14(Colors.black),
                  ),
                )
              ],
            ),
          ),
        ),

        /*Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Container(
              height: 40.h,
              color: Colors.white,
              child: Stack(
                children: [

                  Material(
                    color: Colors.transparent,
                    child: Ink(
                      child: InkWell(
                        onTap: () => navigateToFilter(),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'filter'.tr,
                            style: Ts.bold14(Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //SvgPicture.asset(AssetPath.filter_with_shadow),
                  Container(
                    width: 54.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                        image: DecorationImage(image: Image.asset(AssetPath.filter_with_shadow_png).image)
                      )
                  ),
                ],
              ),
            ),
          ),
        ),*/

        SizedBox(
          width: 168.w,
          child: InkWell(
            onTap: () {
              HapticFeedback.mediumImpact();
              CustomBottomSheet(
                title: 'sort_by'.tr,
                onCloseCallback: (val) => print(
                  'SortBy Bottomsheet close',
                ),
              ).showBottomSheet(SortByView(onClick: (int index) {
                policyQuoteListController
                    .reqGetQuoteDetails.filter!.sortStrategy = index + 1;
                policyQuoteListController.fetchQuoteList();
              }));
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Image.asset(AssetPath.sorting_button_png),
                Container(
                  width: 100.w,
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                    'sort_by'.tr,
                    maxLines: 1,
                    style: Ts.bold14(Colors.black),
                  ),
                )
              ],
            ),
          ),
        ),
        /*Expanded(
            child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            //sortByController.onReady();
            CustomBottomSheet(
              title: 'sort_by'.tr,
              onCloseCallback: (val) => print(
                'SortBy Bottomsheet close',
              ),
            ).showBottomSheet(SortByView(
              onClick: (int index){
                policyQuoteListController.reqGetQuoteDetails.filter!.sortStrategy = index + 1;
                policyQuoteListController.fetchBikeQuoteList();
              }
            ));
          },
          child: Container(
            height: 40.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0), color: Colors.white),
            child: Stack(
              children: [
                SvgPicture.asset(AssetPath.sortby_with_shadow),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Sort By',
                      style: Ts.bold14(Colors.black),
                    )),
              ],
            ),
          ),
        )),*/
      ],
    );
  }

  void navigateToFilter() {
    Get.toNamed(Routes.POLICY_FILTER)!.then((value) async {
      if (value.toString() == 'reset') {
        Get.delete<PolicyFilterController>();
        navigateToFilter();
      }
    });
  }
}
