import 'package:bima_g/app/modules/help/views/help_home_view.dart';
import 'package:bima_g/app/modules/policies/views/offline_policies_view.dart';
import 'package:get/get.dart';

class TopbarAuthenticationController extends GetxController {
  Rx<bool> hideLogo = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onPolicyClick() {
    Get.to(OfflinePoliciesView());
  }

  void onHelpClick() {
    Get.to(HelpView());
  }
}
