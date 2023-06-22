import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/member_document/models/ResGetDocumentTypeList.dart';
import 'package:bima_g/app/widgets/drop_down.dart';
import 'package:bima_g/app/widgets/textfields.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/styles.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';
import '../../../profile/views/EditMyProfile/components/add_new_comp_bottombar_view.dart';

class AddNewDocumentFormView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'add_new_document'.tr,
        ),
        preferredSize: Size.fromHeight(50.h),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Form(
          key: memberDocumentController.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8.w),
                    boxShadow: [
                      Styles.shadow(),
                    ]),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropDown2<DocTypes>(
                        key: Key('document_type_key'),
                        field_label: 'Document Type',
                        hint_text: 'Document Type',
                        selectedValue:
                            memberDocumentController.selectedDocType.value,
                        dropdown_values:
                            memberDocumentController.docTypeList.value,
                        onChange: (DocTypes val) {
                          memberDocumentController.selectedDocType.value = val;
                        },
                        itemBuilder: (BuildContext ctx, DocTypes val) => Text(
                          val.documentTypeName.toString(),
                        ),
                      ),
                      Obx(() => BorderTextField(
                        key: Key('document_no_key'),
                            hintText: memberDocumentController
                                    .selectedDocType.value.documentTypeName ??
                                '',
                            titleText: memberDocumentController
                                    .selectedDocType.value.documentTypeName ??
                                '',
                            controller:
                                memberDocumentController.documentNoController,
                            onValidate: (value) {
                              if (value.toString().isEmpty) {
                                return 'Document No is required';
                              }
                              return null;
                            },
                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                      Obx(() => memberDocumentController.previewFiles.isNotEmpty
                          ? Container()
                          : DottedBorder(
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
                                              child: Image.asset(
                                                  AssetPath.upload_file),
                                            ),
                                          ),
                                          SizedBox(width: 8.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                key:Key('upload_document_key'),
                                                'Upload Your Document',
                                                style:
                                                    Ts.bold13(AppColors.grey5),
                                              ),
                                              SizedBox(height: 2.h),
                                              Text(
                                                'in Jpeg,jpg,png,pgf,docx,doc',
                                                style: Ts.regular12(
                                                    AppColors.grey3),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      Obx(() => SizedBox(
                            height:
                                memberDocumentController.previewFiles.isEmpty
                                    ? 20.h
                                    : 0.h,
                          )),
                      Obx(() => memberDocumentController.previewFiles.isEmpty
                          ? Container()
                          : Container(
                              height: 110.h,
                              width: 110.w,
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      DottedBorder(
                                        dashPattern: [4, 4],
                                        color: AppColors.grey3,
                                        radius: Radius.circular(10.w),
                                        child: Container(
                                          padding: EdgeInsets.all(8.0),
                                          child: Image.file(
                                            memberDocumentController
                                                .previewFiles[0],
                                            fit: BoxFit.fill,
                                            width: 92.w,
                                            height: 92.h,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 5.0,
                                        right: 5.0,
                                        child: GestureDetector(
                                          onTap: () {
                                            memberDocumentController
                                                .previewFiles
                                                .clear();
                                            memberDocumentController
                                                .previewFiles
                                                .refresh();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AddNewCompBottombarView(
        onPressed: () => memberDocumentController.addDocuments(),
      ),
    );
  }
}
