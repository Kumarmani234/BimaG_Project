// ignore_for_file: must_be_immutable

import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../modules/profile/model/radio_selection_model.dart';
import 'checkboxes.dart';

class FieldWithRadioView extends GetView {
  final String text;
  final RxBool isSelected;
  final bool ishealthForm;
  final double width;
  final double height;
  final bool isChild;
  final onClick;
  Function? onChangeChild;
  int childCount;

  FieldWithRadioView({
    required this.text,
    required this.isSelected,
    this.width = 344,
    this.height = 48,
    this.onClick,
    this.ishealthForm = false,
    this.isChild = false,
    this.childCount = 1,
    this.onChangeChild,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(
          color: isSelected.value
              ? AppColors.primaryColor
              : ishealthForm
                  ? AppColors.grey1
                  : Colors.transparent,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: InkWell(
          onTap: onClick,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: Ts.bold14(AppColors.grey5),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (isSelected.value && isChild) isHaveChild(childCount),
              SizedBox(width: 8.w),
              Center(
                child: InkWell(
                  onTap: onClick,
                  child: Container(
                    height: 25.h,
                    width: 25.h,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected.value
                          ? AppColors.primaryColor
                          : Colors.transparent,
                      border: Border.all(
                        color: isSelected.value
                            ? AppColors.primaryColor
                            : AppColors.grey4,
                      ),
                    ),
                    child: isSelected.value
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 15.h,
                          )
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  isHaveChild(int count) {
    return Row(
      children: [
        Container(
          height: 18.h,
          width: 18.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.secondaryColor),
          ),
          child: InkWell(
            onTap: () {
              count++;
              onChangeChild!(count);
            },
            child: Icon(
              Icons.add,
              size: 10,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          height: 15.h,
          width: 15.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.secondaryColor),
          ),
          child: InkWell(
            onTap: () {
              if (count > 1) {
                count--;
                onChangeChild!(count);
              }
            },
            child: Center(
              child: Container(
                height: 1.h,
                width: 7.w,
                color: AppColors.secondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ItemWithCheckBox extends StatelessWidget {
  bool isSelected;
  final onClick;
  String text;
  ItemWithCheckBox(
      {required this.isSelected,
      required this.text,
      required this.onClick,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.h),
        border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.grey1),
      ),
      child: InkWell(
        onTap: onClick,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text, style: Ts.bold14(AppColors.grey5)),
              RoundCheckBox(onChange: null, isChecked: isSelected)
            ],
          ),
        ),
      ),
    );
  }
}

class GenderSelection extends StatelessWidget {
  GenderSelection({
    this.isSelected = false,
    this.onCheck,
    this.height = 20,
    this.width = 70,
    this.textStyle,
    required this.text,
  });
  final double height;
  final double width;
  final bool isSelected;
  final onCheck;
  final TextStyle? textStyle;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: onCheck,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 20.h,
                  width: 20.h,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? AppColors.primaryColor
                        : Colors.transparent,
                    border: Border.all(
                        color:
                            isSelected ? Colors.transparent : AppColors.grey4),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: Ink(
                      child: InkWell(
                        onTap: onCheck,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: isSelected
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 15.h,
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  text,
                  style: textStyle ?? Ts.medium15(AppColors.secondaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SelectGenderView extends StatelessWidget {
  Function onSelectGender;
  String selectedGender;
  SelectGenderView(
      {super.key, required this.onSelectGender, this.selectedGender = 'Male'});

  RxList<RadioSelectionModel> familyTabGenderRadioList = [
    RadioSelectionModel(text: 'Female', key: 'Male', isChecked: true, id: 0),
    RadioSelectionModel(text: 'Male', key: 'Female', isChecked: false, id: 1),
    RadioSelectionModel(text: 'Other', key: 'Other', isChecked: false, id: 2)
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30.h,
        child: Obx(() => ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                for (int i = 0; i < familyTabGenderRadioList.length; i++) {
                  familyTabGenderRadioList[i].isChecked = false;
                  if (familyTabGenderRadioList[i].key == selectedGender) {
                    familyTabGenderRadioList[i].isChecked = true;
                  }
                }
                return GenderSelection(
                  text: familyTabGenderRadioList[index].text,
                  isSelected: familyTabGenderRadioList[index].isChecked,
                  onCheck: () {
                    for (int i = 0; i < familyTabGenderRadioList.length; i++) {
                      familyTabGenderRadioList[i].isChecked = false;
                    }
                    familyTabGenderRadioList[index].isChecked = true;
                    selectedGender = familyTabGenderRadioList[index].key;
                    onSelectGender(familyTabGenderRadioList[index].key);
                    familyTabGenderRadioList.refresh();
                    //profileController.onFamilyTabGenderChange(index);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 40.w);
              },
              itemCount: familyTabGenderRadioList.length,
            )));
  }
}

class SelectYesOrNoView extends StatelessWidget {
  Function onSelection;
  String selectPermission;
  SelectYesOrNoView({
    super.key,
    required this.onSelection,
    this.selectPermission = 'Yes',
  });

  RxList<RadioSelectionModel> PermissionOpstionList = [
    RadioSelectionModel(text: 'Yes', key: 'Yes', isChecked: true, id: 0),
    RadioSelectionModel(text: 'No', key: 'No', isChecked: false, id: 1),
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      child: Obx(
        () => ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            for (int i = 0; i < PermissionOpstionList.length; i++) {
              PermissionOpstionList[i].isChecked = false;
              if (PermissionOpstionList[i].key == selectPermission) {
                PermissionOpstionList[i].isChecked = true;
              }
            }
            return GenderSelection(
              text: PermissionOpstionList[index].text,
              textStyle: Ts.medium14(AppColors.secondaryColor),
              isSelected: PermissionOpstionList[index].isChecked,
              onCheck: () {
                for (int i = 0; i < PermissionOpstionList.length; i++) {
                  PermissionOpstionList[i].isChecked = false;
                }
                PermissionOpstionList[index].isChecked = true;
                selectPermission = PermissionOpstionList[index].key;
                onSelection(PermissionOpstionList[index].key);
                PermissionOpstionList.refresh();
                //profileController.onFamilyTabGenderChange(index);
              },
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 41.w);
          },
          itemCount: PermissionOpstionList.length,
        ),
      ),
    );
  }
}
