// ignore_for_file: must_be_immutable, body_might_complete_normally_nullable

import 'dart:io';
import 'package:bima_g/app/modules/member_document/controllers/member_document_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utility/colors.dart';
import '../../../../../utility/styles.dart';
import '../../../../../utility/ts.dart';
import '../../../../widgets/drop_down.dart';
import '../../../../widgets/textfields.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';
import '../../../profile/views/EditMyProfile/components/add_new_comp_bottombar_view.dart';
import '../../models/member_document_model.dart';
import 'another_screen.dart';

class FilePreviewScreen extends GetView<MemberDocumentController> {
  final List<File> files;
  FilePreviewScreen(this.files);

  String _selectedDocumentType = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _documentNoController = TextEditingController();

  void _onDelete(File file) {
    controller.deleteFile(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'Add New Document',
        ),
        preferredSize: Size.fromHeight(50.h),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 440,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.w),
              boxShadow: [
                Styles.shadow(),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  DropDown(
                    field_label: 'Document Type',
                    dropdown_values: [
                      'Aadhaar Card',
                      'Pan Card',
                      'Driving License',
                      'Vehicle RC'
                    ],
                    onChange: (value) {
                      _selectedDocumentType = value;
                    },
                  ),
                  BorderTextField(
                    hintText: '3645 7843 3648'.tr,
                    titleText: 'Document No'.tr,
                    controller: _documentNoController,
                    onValidate: (value) {
                      if (value.isEmpty) {
                        return 'Document No is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DottedBorder(
                    dashPattern: [4, 4],
                    color: AppColors.grey3,
                    child: Container(
                      width: 350.w,
                      height: 80.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 60.w,
                            width: 60.h,
                            decoration: BoxDecoration(
                              color: AppColors.grey2,
                              borderRadius: BorderRadius.circular(50.w),
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 17.w,
                                  ),
                                  Image.asset('assets/pngs/upload.png'),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Upload Your Document',
                                      style: Ts.bold15(AppColors.black),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'in Jpeg,jpg,png,pgf,docx,doc',
                                          style: Ts.regular15(AppColors.grey3),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GetBuilder<MemberDocumentController>(
                    builder: (_) {
                      return Container(
                        height: 110,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                files.length, // Number of columns in the grid
                            crossAxisSpacing: 10.0, // Spacing between columns
                            mainAxisSpacing: 10.0, // Spacing between rows
                          ),
                          itemCount: files.length,
                          itemBuilder: (BuildContext context, int index) {
                            final File file =
                                File(controller.previewFiles[index].path);
                            if (file.existsSync()) {
                              // Display preview based on file type
                              if (file.path.endsWith('.pdf')) {
                                return ListTile(
                                  leading: Icon(Icons.picture_as_pdf),
                                  title: Text('PDF Document'),
                                  onTap: () {
                                    // Handle PDF document preview or open in a PDF viewer
                                  },
                                );
                              } else if (file.path.endsWith('.docx')) {
                                return ListTile(
                                  leading: Icon(Icons.picture_as_pdf),
                                  title: Text('DocX Document'),
                                  onTap: () {
                                    // Handle PDF document preview or open in a PDF viewer
                                  },
                                );
                              } else if (file.path.endsWith('.doc')) {
                                return ListTile(
                                  leading: Icon(Icons.picture_as_pdf),
                                  title: Text('Doc Document'),
                                  onTap: () {
                                    // Handle PDF document preview or open in a PDF viewer
                                  },
                                );
                              } else if ((file.path.endsWith('.png') ||
                                      file.path.endsWith('.jpg') ||
                                      file.path.endsWith('.jpeg')) &&
                                  (files.length <= 5)) {
                                return Row(
                                  children: [
                                    Stack(
                                      children: [
                                        DottedBorder(
                                          dashPattern: [4, 4],
                                          color: AppColors.grey3,
                                          child: Container(
                                            child: Image.file(file),
                                          ),
                                        ),
                                        Positioned(
                                          top: 5.0,
                                          right: 5.0,
                                          child: GestureDetector(
                                            onTap: () {
                                              _onDelete(file);
                                              _.update();
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
                                );
                              } else {
                                Get.back();
                              }
                            } else {}
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: AddNewCompBottombarView(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Create a DocumentData object with the collected data
            DocumentData documentData = DocumentData(
              documentType: _selectedDocumentType,
              documentNo: _documentNoController.text,
              files: files,
            );

            // Navigate to another screen and pass the documentData object
            Get.to(AnotherScreen(documentData: documentData));
          }
        },
      ),
    );
  }
}
