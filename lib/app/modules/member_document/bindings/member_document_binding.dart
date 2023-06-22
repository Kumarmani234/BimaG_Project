import 'package:get/get.dart';

import '../controllers/member_document_controller.dart';

class MemberDocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MemberDocumentController>(
      () => MemberDocumentController(),
    );
  }
}
