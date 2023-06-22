// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:bima_g/app/widgets/buttons.dart';
import 'package:bima_g/app/widgets/textfields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utility/utils.dart';

class DateOfBirthWidget extends StatelessWidget {
  DateTime? initialDate;
  Function onTap;
  bool isfill;
  TextEditingController controller;
  DateOfBirthWidget(
      {this.initialDate,
      required this.onTap,
      required this.controller,
      this.isfill = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderTextField(
      readOnly: true,
      isfill: isfill,
      onTap: () async {
        if (Platform.isAndroid) {
          DateTime? picked = await showDatePicker(
            context: context,
            initialDate: initialDate ?? DateTime.now(),
            initialDatePickerMode: DatePickerMode.day,
            firstDate: DateTime(1900, 1, 1), // set first date to 1 Jan 2000
            lastDate: DateTime.now(),
          );
          if (picked != null) {
            //profileController.selectedDate.value = picked;
            String formattedDate =
                '${picked.day.toString().padLeft(2, '0')} ${Utils.getMonthName(picked.month)} ${picked.year}';
            //profileController.BirthDateController.value.text = formattedDate;
            onTap(picked, formattedDate);
          }
        } else {
          DateTime? dateTime;
          showModalBottomSheet(
              context: context,
              builder: (ctx) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 200.h,
                        child: CupertinoDatePicker(
                            initialDateTime: initialDate ?? DateTime.now(),
                            maximumDate: DateTime.now(),
                            maximumYear: DateTime.now()
                                .year, // set first date to 1 Jan 2000
                            minimumDate: DateTime(1900, 1, 1),
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (picked) {
                              dateTime = picked;
                            }),
                      ),
                      ElevatedButtonBimaG(
                        text: 'apply'.tr,
                        onClick: () {
                          if (dateTime != null) {
                            String formattedDate =
                                '${dateTime!.day.toString().padLeft(2, '0')} ${Utils.getMonthName(dateTime!.month)} ${dateTime!.year}';
                            //profileController.BirthDateController.value.text = formattedDate;
                            onTap(dateTime, formattedDate);
                          } else {
                            String formattedDate =
                                '${DateTime.now().day.toString().padLeft(2, '0')} ${Utils.getMonthName(DateTime.now().month)} ${DateTime.now().year}';
                            onTap(DateTime.now(), formattedDate);
                          }
                          Get.back();
                        },
                      ),
                      SizedBox(
                        height: 30.h,
                      )
                    ],
                  ));
          /*picked = await showDatePicker(
            context: context,
            initialDate: initialDate ?? DateTime.now(),
            initialDatePickerMode: DatePickerMode.day,
            firstDate: DateTime(1900, 1, 1), // set first date to 1 Jan 2000
            lastDate: DateTime.now(),
          );*/
        }
      },
      hintText: 'date_of_birth'.tr,
      titleText: 'date_of_birth'.tr + "*",
      controller: controller,
      onValidate: (val) {
        if (val.toString().isEmpty) {
          return 'please_enter_birth_date'.tr;
        } else {
          return null;
        }
      },
      suffixIcon: Icon(Icons.date_range),
    );
  }
}

class DatePickerBimaG extends StatelessWidget {
  DateTime initialDate;
  DateTime? lastDate;
  Function onTap;
  String hintText, titleText;
  DatePickerBimaG(
      {required this.initialDate,
      required this.onTap,
      this.lastDate,
      required this.hintText,
      required this.titleText,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderTextField(
      readOnly: true,
      onTap: () async {
        if (Platform.isAndroid) {
          DateTime? picked = await showDatePicker(
            context: context,
            initialDate: initialDate,
            initialDatePickerMode: DatePickerMode.day,
            firstDate: DateTime(1900, 1, 1), // set first date to 1 Jan 2000
            lastDate: lastDate ?? DateTime(2100),
          );
          if (picked != null) {
            //profileController.selectedDate.value = picked;
            String formattedDate =
                '${picked.day.toString().padLeft(2, '0')} ${Utils.getMonthName(picked.month)} ${picked.year}';
            //profileController.BirthDateController.value.text = formattedDate;
            onTap(picked, formattedDate);
          }
        } else {
          DateTime? dateTime;
          showModalBottomSheet(
              context: context,
              builder: (ctx) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 200.h,
                        child: CupertinoDatePicker(
                            initialDateTime: initialDate ?? DateTime.now(),
                            maximumDate: DateTime.now(),
                            maximumYear: DateTime.now()
                                .year, // set first date to 1 Jan 2000
                            minimumDate: DateTime(1900, 1, 1),
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (picked) {
                              dateTime = picked;
                            }),
                      ),
                      ElevatedButtonBimaG(
                        text: 'Apply',
                        onClick: () {
                          if (dateTime != null) {
                            String formattedDate =
                                '${dateTime!.day.toString().padLeft(2, '0')} ${Utils.getMonthName(dateTime!.month)} ${dateTime!.year}';
                            //profileController.BirthDateController.value.text = formattedDate;
                            onTap(dateTime, formattedDate);
                          } else {
                            String formattedDate =
                                '${DateTime.now().day.toString().padLeft(2, '0')} ${Utils.getMonthName(DateTime.now().month)} ${DateTime.now().year}';
                            onTap(DateTime.now(), formattedDate);
                          }
                          Get.back();
                        },
                      ),
                      SizedBox(
                        height: 30.h,
                      )
                    ],
                  ));
        }
      },
      hintText: hintText,
      titleText: titleText,
      controller: TextEditingController(
          text:
              '${initialDate.day.toString().padLeft(2, '0')} ${Utils.getMonthName(initialDate.month)} ${initialDate.year}'),
      onValidate: (val) {
        if (val.toString().isEmpty) {
          return 'please_enter_birth_date'.tr;
        } else {
          return null;
        }
      },
      suffixIcon: Icon(Icons.date_range),
    );
  }
}
