import 'package:bima_g/app/enums.dart';
import 'package:bima_g/app/widgets/bimag_loading.dart';
import 'package:bima_g/app/widgets/bimag_no_data_found.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../module_controllers.dart';
import '../../../../widgets/buttons.dart';
import '../components/DocumentComponents/add_document_view.dart';

class DocumentTabView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => memberDocumentController.docListApiStatus.value ==
                ApiStatus.Completed
            ? SmartRefresher(
                controller: memberDocumentController.docRefreshController,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  itemCount: memberDocumentController.myDocumentList.length,
                  itemBuilder: (ctx, index) => AddDocumentView(
                    imageUrl: memberDocumentController
                        .myDocumentList[index].documentBase64
                        .toString(),
                    documentType: memberDocumentController
                        .myDocumentList[index].documentTypeName
                        .toString(),
                    documentNo: memberDocumentController
                        .myDocumentList[index].documentNumber
                        .toString(),
                    onEdit: () => memberDocumentController.onEditDocument(
                        memberDocumentController.myDocumentList[index]),
                    onDelete: () {},
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 8.h),
                ),
              )
            : (memberDocumentController.docListApiStatus.value ==
                    ApiStatus.Loading
                ? LoadingBimaG()
                : NoDataFoundBimaG()),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(14.h),
        child: SizedBox(
          key: Key('add_a_new_document_key'),
          child: RoundSquareButtons.buttonEnabled(
              onPressed: () => memberDocumentController.addNewDocument(),
              text: 'add_new_document'.tr),
        ),
      ),
    );
  }
}
