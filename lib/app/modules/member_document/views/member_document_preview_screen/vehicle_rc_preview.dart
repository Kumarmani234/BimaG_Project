import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/member_document/controllers/member_document_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../../utility/styles.dart';
import '../../../../../utility/ts.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';
import '../components/DocumentComponents/document_view.dart';
import '../tabsForm/add_new_document_form_view.dart';

class VehicleRcPreview extends GetView<MemberDocumentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(
          title: 'Vehicles RC',
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Center(
                child: GestureDetector(
                  onTap: () => Get.to(AddNewDocumentFormView()),
                  child: Text(
                    'edit'.tr,
                    style: Ts.bold15(AppColors.primaryColor),
                  ),
                ),
              ),
            )
          ],
        ),
        preferredSize: Size.fromHeight(55.h),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount:
                    memberDocumentController.DocumentList.isEmpty ? 0 : 1,
                itemBuilder: (ctx, index) => DocumentView(
                  imageUrl: memberDocumentController.DocumentList[3].img_url
                      .toString(),
                  documentType: memberDocumentController
                      .DocumentList[3].documentType
                      .toString(),
                  documentNo: memberDocumentController
                      .DocumentList[3].documentNo
                      .toString(),
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 8.h),
              ),
            ),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [Styles.shadow()],
                borderRadius: BorderRadius.circular(16.w),
              ),
              child: Image.asset('assets/pngs/driving_license.png'),
            ),
            SizedBox(height: 16.h),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(15.w),
                  boxShadow: [Styles.shadow()]),
              child: Image.asset('assets/pngs/driving_license.png'),
            ),
          ],
        ),
      ),
    );
  }
}
