import 'package:bima_g/app/modules/help/views/help_options/fifth_help_option.dart';
import 'package:bima_g/app/modules/help/views/help_options/first_help_option.dart';
import 'package:bima_g/app/modules/help/views/help_options/fourth_help_option.dart';
import 'package:bima_g/app/modules/help/views/help_options/second_help_option.dart';
import 'package:bima_g/app/modules/help/views/help_options/sixth_help_option.dart';
import 'package:bima_g/app/modules/help/views/help_options/third_help_option.dart';
import 'package:bima_g/app/modules/policies/model/purchased_policy_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../policy_filter/model/filter_expand_model.dart';
import '../model/open_ticket_model.dart';
import '../model/ticket_policy_item_model.dart';

class HelpController extends GetxController {
  Rx<int> currentIndexOfYourPolicies = 0.obs;
  Rx<int> currentIndexOfTicketsPolicies = 0.obs;
  Rx<TextEditingController> helpSearchController = TextEditingController().obs;
  RxList<PurchasedPolicyModel> listOfPolicies = <PurchasedPolicyModel>[].obs;
  RxList<TicketsPolicyModel> listOfTickets = <TicketsPolicyModel>[].obs;
  RxList<OpenTicketModel> listOfOpenTickets = <OpenTicketModel>[].obs;
  RxList<FilterExpandModel> helpOptionsList = <FilterExpandModel>[].obs;

  RefreshController helpHomeRefreshController =
      RefreshController(initialRefresh: false);

  RefreshController getHelpRefreshController =
      RefreshController(initialRefresh: false);

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    getListOfPolocies();
    getListOfTickets();
    getOpenTickets();
    getHelpOptions();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  getListOfPolocies() {
    //list of your policy in help_home.view
    listOfPolicies.add(PurchasedPolicyModel(
        companyImage: 'https://iili.io/HO2R81j.png',
        date: 'Jan 02, 2024',
        planCompanyName: 'United india insurance',
        planName: 'Compulsory Personal Accident (Owner-Driver)',
        productName: 'Personal Accide...',
        sumInjured: '15.00 Lakhs',
        expired: true));

    listOfPolicies.add(PurchasedPolicyModel(
        companyImage: 'https://iili.io/HO2R81j.png',
        date: 'Jan 02, 2024',
        planCompanyName: 'The New India Assur...',
        planName: 'Suzuki Gixxer Insurance Policies',
        productName: 'Personal Accide...',
        sumInjured: '15.00 Lakhs',
        expired: true));

    listOfPolicies.add(PurchasedPolicyModel(
        companyImage: 'https://iili.io/HO2R81j.png',
        date: 'Jan 02, 2024',
        planCompanyName: 'The New India Assur...',
        planName: 'Suzuki Gixxer Insurance Policies',
        productName: 'Personal Accide...',
        sumInjured: '15.00 Lakhs',
        expired: true));

    listOfPolicies.add(PurchasedPolicyModel(
        companyImage: 'https://iili.io/HO2R81j.png',
        date: 'Jan 02, 2024',
        planCompanyName: 'The New India Assur...',
        planName: 'Suzuki Gixxer Insurance Policies',
        productName: 'Personal Accide...',
        sumInjured: '15.00 Lakhs'));
  }

  getListOfTickets() {
    //list of your policy in help_home.view
    listOfTickets.add(TicketsPolicyModel(
        companyImage: 'https://iili.io/HO2R81j.png',
        status: 'Jan 02, 2024',
        planCompanyName: 'United india insurance',
        planName: 'Compulsory Personal Accident (Owner-Driver)',
        raised_date: 'May 11, 2023',
        ticket_id: 'BG340009209',
        expired: true));

    listOfTickets.add(TicketsPolicyModel(
        companyImage: 'https://iili.io/HO2R81j.png',
        status: 'Jan 02, 2024',
        planCompanyName: 'The New India Assur...',
        planName: 'Suzuki Gixxer Insurance Policies',
        raised_date: 'June 21, 2023',
        ticket_id: 'BG340009209',
        expired: true));

    listOfTickets.add(TicketsPolicyModel(
        companyImage: 'https://iili.io/HO2R81j.png',
        status: 'Jan 02, 2024',
        planCompanyName: 'The New India Assur...',
        planName: 'Suzuki Gixxer Insurance Policies',
        raised_date: 'January 14, 2022',
        ticket_id: 'BG340009209',
        expired: true));

    listOfTickets.add(TicketsPolicyModel(
        companyImage: 'https://iili.io/HO2R81j.png',
        status: 'Jan 02, 2024',
        planCompanyName: 'The New India Assur...',
        planName: 'Suzuki Gixxer Insurance Policies',
        raised_date: 'May 11, 2023',
        ticket_id: 'BG340009209'));
  }

  getOpenTickets() {
    listOfOpenTickets.add(
      OpenTicketModel(
          status: 'In Work',
          planCompanyName: 'Concern',
          planName: 'Policy is not reflecting at parivahan site.',
          raised_date: 'May 11, 2023',
          ticket_id: 'BG340009209',
          isHaveTicketCount: true),
    );
    listOfOpenTickets.add(
      OpenTicketModel(
        status: 'In Queue',
        planCompanyName: 'Concern',
        planName: 'Policy is not reflecting at parivahan site.',
        raised_date: 'May 11, 2023',
        ticket_id: 'BG340009209',
      ),
    );
  }

  getHelpOptions() {
    helpOptionsList.add(FilterExpandModel(
        filterName: 'i_need_help_in_cancellation_of_the_policy'.tr,
        filterId: 0,
        isExpanded: false));
    helpOptionsList.add(FilterExpandModel(
        filterName: 'i_have_a_payment_related_issue'.tr,
        filterId: 1,
        isExpanded: true));
    helpOptionsList.add(FilterExpandModel(
        filterName: 'i_want_to_make_changes_in_my_policy_copy'.tr,
        filterId: 2,
        isExpanded: false));
    helpOptionsList.add(FilterExpandModel(
        filterName: 'i_have_a_claims_related_query'.tr,
        filterId: 3,
        isExpanded: false));
    helpOptionsList.add(FilterExpandModel(
        filterName: 'i_want_to_give_a_feedback'.tr,
        filterId: 4,
        isExpanded: false));
    helpOptionsList.add(FilterExpandModel(
        filterName: 'i_have_refund_related_issues'.tr,
        filterId: 5,
        isExpanded: false));
  }

  onHelpHomeRefresh() {
    Future.delayed(Duration(seconds: 2),
        () => helpHomeRefreshController.refreshCompleted());
  }

  onGetHelpRefresh() {
    Future.delayed(Duration(seconds: 2),
        () => getHelpRefreshController.refreshCompleted());
  }

  fetchOptionsList(index) {
    switch (index) {
      case 0:
        return FirstHelpOption(index: index);
      case 1:
        return SecondHelpOption(index: index);
      case 2:
        return ThirdHelpOption(index: index);
      case 3:
        return FourthHelpOption(index: index);
      case 4:
        return FifthHelpOption(index: index);
      case 5:
        return SixthHelpOption(index: index);
    }
  }
}

class ButtonFieldText {
  String text;
  int id;

  ButtonFieldText({required this.text, required this.id});
}
