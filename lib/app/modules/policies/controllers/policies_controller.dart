import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../model/incomplete_policy_model.dart';
import '../model/purchased_policy_model.dart';
import '../model/tab_model.dart';

class PoliciesController extends GetxController {
  Rx<int> currentTabIndex = 0.obs;
  Rx<int> currentProfilePolicyTabIndex = 0.obs;
  RxList<PolicyTabModel> listTabs = <PolicyTabModel>[].obs;
  RxList<PurchasedPolicyModel> listRecentPolicies =
      <PurchasedPolicyModel>[].obs;
  RxList<PurchasedPolicyModel> listInActivePolicies =
      <PurchasedPolicyModel>[].obs;
  RxList<IncompletePolicyModel> listInCompletedPolicies =
      <IncompletePolicyModel>[].obs;

  RxList<PurchasedPolicyModel> listUnExpiredPolicies =
      <PurchasedPolicyModel>[].obs;
  RxList<PurchasedPolicyModel> listInAllPolicies = <PurchasedPolicyModel>[].obs;

  RefreshController policyRefreshController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    listTabs.add(PolicyTabModel(isSelected: true, tabName: 'Recent'));
    listTabs.add(PolicyTabModel(isSelected: false, tabName: 'Inactive'));

    //temparary add policies model
    listRecentPolicies.add(PurchasedPolicyModel(
        companyImage: 'https://iili.io/HO2R81j.png',
        date: 'Jan 02, 2024',
        planCompanyName: 'United india insurance',
        planName: 'Compulsory Personal Accident (Owner-Driver)',
        productName: 'Personal Accide...',
        sumInjured: '15.00 Lakhs'));

    listRecentPolicies.add(PurchasedPolicyModel(
        companyImage: 'https://iili.io/HO2R81j.png',
        date: 'Jan 02, 2024',
        planCompanyName: 'The New India Assur...',
        planName: 'Suzuki Gixxer Insurance Policies',
        productName: 'Personal Accide...',
        sumInjured: '15.00 Lakhs'));

    listRecentPolicies.add(PurchasedPolicyModel(
        companyImage: 'https://iili.io/HO2R81j.png',
        date: 'Jan 02, 2024',
        planCompanyName: 'The New India Assur...',
        planName: 'Suzuki Gixxer Insurance Policies',
        productName: 'Personal Accide...',
        sumInjured: '15.00 Lakhs'));

    listRecentPolicies.add(PurchasedPolicyModel(
        companyImage: 'https://iili.io/HO2R81j.png',
        date: 'Jan 02, 2024',
        planCompanyName: 'The New India Assur...',
        planName: 'Suzuki Gixxer Insurance Policies',
        productName: 'Personal Accide...',
        sumInjured: '15.00 Lakhs'));

    //list inActive policies
    listInActivePolicies.add(PurchasedPolicyModel(
        companyImage: 'https://iili.io/HO2R81j.png',
        date: '₹ 389 (Yearly)',
        planCompanyName: 'Tata Security',
        planName: 'Compulsory Personal Accident (Owner-Driver)',
        productName: '₹ 15,00,000',
        sumInjured: 'Policy Issued',
        expired: true));

    listInActivePolicies.add(PurchasedPolicyModel(
        companyImage: 'https://iili.io/HO2R81j.png',
        date: '₹ 389 (Yearly)',
        planCompanyName: 'The New India Assur...',
        planName: 'Suzuki Gixxer Insurance Policies',
        productName: '₹ 15,00,000',
        sumInjured: 'Policy Issued',
        expired: true));

    //list unexpired policy
    listUnExpiredPolicies.add(PurchasedPolicyModel(
      companyImage: 'https://iili.io/HO2R81j.png',
      date: '₹ 389 (Yearly)',
      planCompanyName: 'Tata Security',
      planName: 'Compulsory Personal Accident (Owner-Driver)',
      productName: '₹ 15,00,000',
      sumInjured: 'Policy Issued',
    ));

    listUnExpiredPolicies.add(PurchasedPolicyModel(
      companyImage: 'https://iili.io/HO2R81j.png',
      date: '₹ 389 (Yearly)',
      planCompanyName: 'The New India Assur...',
      planName: 'Suzuki Gixxer Insurance Policies',
      productName: '₹ 15,00,000',
      sumInjured: 'Policy Issued',
    ));

    listInAllPolicies.addAll(listUnExpiredPolicies);
    listInAllPolicies.addAll(listInActivePolicies);

    //list incomplet policies
    listInCompletedPolicies.add(IncompletePolicyModel(
        planName: 'Compulsory Personal Accident (Owner-Driver)',
        planDesc: 'Complete your policies today and save more 80%',
        planId: '0',
        planProgress: 25));
    listInCompletedPolicies.add(IncompletePolicyModel(
        planName: 'Compulsory Personal Accident (Owner-Driver)',
        planDesc: 'Complete your policies today and save more 80%',
        planId: '1',
        planProgress: 75));
    listInCompletedPolicies.add(IncompletePolicyModel(
        planName: 'Compulsory Personal Accident (Owner-Driver)',
        planDesc: 'Complete your policies today and save more 80%',
        planId: '2',
        planProgress: 30));
    listInCompletedPolicies.add(IncompletePolicyModel(
        planName: 'Compulsory Personal Accident (Owner-Driver)',
        planDesc: 'Complete your policies today and save more 80%',
        planId: '3',
        planProgress: 10));
  }

  @override
  void onClose() {}

  onRefresh() {
    Future.delayed(
        Duration(seconds: 2), () => policyRefreshController.refreshCompleted());
    // policyRefreshController.refreshCompleted();
  }
}
