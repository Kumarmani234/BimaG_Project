// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utility/colors.dart';
import '../../utility/ts.dart';

class drop_down extends StatelessWidget {
  drop_down({
    Key? key,
    required this.field_label,
    required this.hint_text,
    this.is_dropdown_field = false,
    this.dropdown_values,
    this.selectedValue,
    this.onChange,
    this.isfill = false,
  }) : super(key: key);

  final String field_label;
  final String hint_text;
  final bool is_dropdown_field;
  final List<String>? dropdown_values;
  Function? onChange;
  bool isfill;
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          field_label,
          style: Ts.regular12(AppColors.grey5),
        ),
        SizedBox(height: 6.h),
        DropdownButtonFormField(
          value: selectedValue ?? dropdown_values![0],
          icon: Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: const Icon(
              Icons.keyboard_arrow_down,
              size: 30,
            ),
          ),
          onChanged: (val) => onChange == null ? null : onChange!(val),
          decoration: InputDecoration(
            hintStyle: Ts.medium15(AppColors.secondaryColor),
            contentPadding: EdgeInsets.only(left: 10.w),
            hintText: hint_text,
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.grey4,
                width: 1.w,
              ),
            ),
            filled: isfill,
            fillColor: isfill ? AppColors.white : Colors.transparent,
          ),
          items: dropdown_values!.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: Ts.medium15(AppColors.secondaryColor),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}

class DropDown extends StatelessWidget {
  DropDown({
    Key? key,
    required this.field_label,
    this.dropdown_values,
    this.selectedValue,
    this.onChange,
  }) : super(key: key);

  final String field_label;
  final List<String>? dropdown_values;
  Function? onChange;
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final randomIndex = Random().nextInt(dropdown_values!.length);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          field_label,
          style: Ts.regular12(AppColors.grey5),
        ),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          value: selectedValue ?? dropdown_values![randomIndex],
          icon: Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: const Icon(
              Icons.keyboard_arrow_down,
              size: 30,
            ),
          ),
          onChanged: (val) => onChange == null ? null : onChange!(val),
          decoration: InputDecoration(
            hintStyle: Ts.regular15(AppColors.grey4),
            contentPadding: EdgeInsets.only(left: 10.w),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.grey4,
                width: 1.w,
              ),
            ),
          ),
          items: dropdown_values!.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: Ts.medium15(AppColors.secondaryColor),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}

class DropDown2<T> extends StatelessWidget {
  DropDown2({
    Key? key,
    required this.field_label,
    required this.dropdown_values,
    required this.hint_text,
    this.selectedValue,
    required this.onChange,
    required this.itemBuilder,
    this.isfill = false,
    this.onValidate,
  }) : super(key: key);

  final String field_label;
  List<T>? dropdown_values;
  Widget Function(BuildContext, T) itemBuilder;
  T? selectedValue;
  Function onChange;
  String hint_text;
  bool isfill;
  final onValidate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          field_label,
          style: Ts.regular12(AppColors.grey5),
        ),
        SizedBox(height: 8.h),
        DropdownButtonFormField(
          value: selectedValue,
          hint: Text(
            hint_text,
            style: Ts.semiBold14(AppColors.grey4),
          ),
          icon: Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: const Icon(
              Icons.keyboard_arrow_down,
              size: 30,
            ),
          ),
          validator: onValidate,
          onChanged: (value) =>
              onChange!(value) /*=> onChange == null ? null : onChange!(val)*/,
          decoration: InputDecoration(
            hintStyle: Ts.regular15(AppColors.grey4),
            contentPadding: EdgeInsets.only(left: 10.w),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.grey4,
                width: 1.w,
              ),
            ),
            filled: isfill,
            fillColor: isfill ? AppColors.white : Colors.transparent,
          ),
          items: dropdown_values!.map<DropdownMenuItem<T>>((value) {
            return DropdownMenuItem<T>(
              value: value,
              child: itemBuilder(context, value),
            );
          }).toList(),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}

class SmallDropDown extends StatelessWidget {
  SmallDropDown({
    Key? key,
    required this.field_label,
    this.dropdown_values,
    this.selectedValue,
    this.onChange,
  }) : super(key: key);

  final String field_label;
  final List<String>? dropdown_values;
  Function? onChange;
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          field_label,
          style: Ts.regular12(AppColors.grey5),
        ),
        SizedBox(height: 6.h),
        SizedBox(
          height: 40.h,
          width: 146.w,
          child: DropdownButtonFormField(
            value: selectedValue ?? dropdown_values![0],
            icon: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: const Icon(
                Icons.keyboard_arrow_down,
                size: 30,
              ),
            ),
            onChanged: (val) => onChange == null ? null : onChange!(val),
            decoration: InputDecoration(
              hintStyle: Ts.medium15(AppColors.secondaryColor),
              contentPadding: EdgeInsets.only(left: 10.w),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.grey4,
                  width: 1.w,
                ),
              ),
            ),
            items:
                dropdown_values!.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: Ts.medium15(AppColors.secondaryColor),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
