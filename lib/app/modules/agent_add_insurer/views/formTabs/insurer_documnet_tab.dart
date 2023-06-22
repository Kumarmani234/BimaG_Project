import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../utility/colors.dart';
import '../../../../module_controllers.dart';
import '../../../../widgets/buttons.dart';
import '../../../member_document/views/components/DocumentComponents/add_document_view.dart';
import '../../../member_document/views/tabsForm/add_new_document_form_view.dart';

class InsurerDocumnetTab extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      body: Obx(
        () => ListView.separated(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          itemCount: agentAddInsurerController.documentList.length,
          itemBuilder: (ctx, index) => AddDocumentView(
            imageUrl: agentAddInsurerController.documentList[index].img_url
                .toString(),
            documentType: agentAddInsurerController
                .documentList[index].documentType
                .toString(),
            documentNo: agentAddInsurerController.documentList[index].documentNo
                .toString(),
            onEdit: () {},
            onDelete: () {},
          ),
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: 8.h),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(14.h),
        child: SizedBox(
          key: Key('add_a_new_document_key'),
          child: RoundSquareButtons.buttonEnabled(
              onPressed: () => Get.to(AddNewDocumentFormView()),
              text: 'add_new_document'.tr),
        ),
      ),
    );
  }
}
