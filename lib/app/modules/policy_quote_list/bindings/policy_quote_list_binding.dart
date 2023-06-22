import 'package:get/get.dart';

import '../controllers/policy_quote_list_controller.dart';

class PolicyQuoteListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PolicyQuoteListController>(
      () => PolicyQuoteListController(),
    );
  }
}
