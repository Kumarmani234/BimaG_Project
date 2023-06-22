// ignore_for_file: body_might_complete_normally_nullable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utility/colors.dart';
import '../../models/member_document_model.dart';

class AnotherScreen extends StatelessWidget {
  final DocumentData documentData;

  AnotherScreen({required this.documentData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document details'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'Document Type: ${documentData.documentType}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Document No: ${documentData.documentNo}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 20.w,
              height: 152.h,
              child: Container(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: documentData.files.length,
                    // Number of columns in the grid
                    crossAxisSpacing: 5.0,
                    // Spacing between columns
                    mainAxisSpacing: 10.0, // Spacing between rows
                  ),
                  itemCount: documentData.files.length,
                  itemBuilder: (BuildContext context, int index) {
                    final File file = documentData.files[index];
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
                      } else if (file.path.endsWith('.png') ||
                          file.path.endsWith('.jpg') ||
                          file.path.endsWith('.jpeg')) {
                        return SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.grey2,
                              borderRadius: BorderRadius.circular(8.w),
                            ),
                            child: Image.file(file),
                          ),
                        );
                      } else {
                        return ListTile(
                          leading: Icon(Icons.insert_drive_file),
                          title: Text('File'),
                          onTap: () {
                            // Handle other file types based on your needs
                          },
                        );
                      }
                    } else {}
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
