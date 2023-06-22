// ignore_for_file: must_be_immutable

import 'package:bima_g/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utility/ts.dart';
import '../../../module_controllers.dart';
import '../../../widgets/checkboxes.dart';
import '../controllers/sort_by_controller.dart';

class SortByView extends GetView<SortByController> {
  SortByView({this.onClick, Key? key}) : super(key: key);
  Function? onClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //list of selectable items
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: sortByController.sortByItems.length,
            padding: EdgeInsets.all(15.h),
            itemBuilder: (ctx, index) => CheckBoxWithImageIconBordered(
              isSelected: sortByController.sortByItems[index].isSelected,
              title: sortByController.sortByItems[index].sortBy,
              onClick: () {
                for (int i = 0; i < sortByController.sortByItems.length; i++) {
                  sortByController.sortByItems[i].isSelected = false;
                }

                sortByController.sortByItems[index].isSelected = true;
                sortByController.sortByItems.refresh();
              },
            ),
          ),
        ),

        //action button cancel & apply
        Row(
          children: [
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  'cancel'.tr,
                  style: Ts.regular15(AppColors.grey5),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
                child: ElevatedButton(
              onPressed: () {
                //click on apply
                for (int i = 0; i < sortByController.sortByItems.length; i++) {
                  if (sortByController.sortByItems[i].isSelected) {
                    onClick!(i);
                  }
                }
                Get.back();
              },
              child: Text('apply'.tr, style: Ts.regular15(Colors.white)),
            )),
            SizedBox(
              width: 15.w,
            ),
          ],
        ),
      ],
    );
  }
}

/*class SortByItem extends StatelessWidget {
  SortByItemModel sortByItemModel;
  final onClick;
  SortByItem({required this.sortByItemModel, required this.onClick,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.h),
        border: Border.all(color: sortByItemModel.isSelected ? AppColors.primaryColor : AppColors.grey1)
      ),
      child: InkWell(
        onTap: onClick,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(sortByItemModel.sortBy, style: Ts.bold14(AppColors.grey5)),
              RoundCheckBox(onChange: null, isChecked: sortByItemModel.isSelected)
            ],
          ),
        ),
      ),
    );
  }
}*/

