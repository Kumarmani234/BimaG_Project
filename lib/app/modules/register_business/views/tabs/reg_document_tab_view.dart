import 'package:bima_g/utility/asset_paths.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utility/colors.dart';
import '../../../../../utility/ts.dart';
import '../../../../module_controllers.dart';
import '../../../../widgets/drop_down.dart';
import '../../../../widgets/textfields.dart';

class RegDocumentTabView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              drop_down(
                key: Key('doc_key'),
                isfill: true,
                field_label: 'Document Type',
                hint_text: '',
                is_dropdown_field: true,
                dropdown_values: [
                  'Aadhaar Card',
                  'Pan Card',
                  'Driving License',
                  'Vehicles RC'
                ],
                onChange: (value) {
                  registerBusinessController.selectedDocumentType = value;
                },
              ),
              BorderTextField(
                key: Key('doc_no_key'),
                isfill: true,
                hintText: '3645 7843 3648'.tr,
                titleText: 'Aadhaar Number'.tr,
                controller: memberDocumentController.documentNoController,
                onValidate: (value) {
                  if (value.toString().isEmpty) {
                    return 'Document No is required';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              DottedBorder(
                dashPattern: [3, 3],
                color: AppColors.grey3,
                child: Material(
                  color: Colors.transparent,
                  child: Ink(
                    child: InkWell(
                      onTap: () {
                        memberDocumentController.openFilePicker();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        child: Row(
                          children: [
                            Container(
                              height: 56.h,
                              width: 56.h,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  color: AppColors.grey1,
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Image.asset(AssetPath.upload_file),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Upload Your Document',
                                  style: Ts.bold13(AppColors.grey5),
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  'in Jpeg,jpg,png,pgf,docx,doc',
                                  style: Ts.regular12(AppColors.grey3),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
