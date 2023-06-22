import 'package:bima_g/app/enums.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:get/get.dart';

import '../model/sort_by_item_model.dart';

class SortByController extends GetxController {
  RxList<SortByItemModel> sortByItems = <SortByItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    print('on ready mode sort by');
    if (policyQuoteListController.policyType == PolicyType.bikeInsurance) {
      sortByItems.clear();
      sortByItems
          .add(SortByItemModel(sortBy: 'By relevance', isSelected: true));
      sortByItems.add(SortByItemModel(sortBy: 'IDV high to low'));
      sortByItems.add(SortByItemModel(sortBy: 'Claim Settled high to low'));
      sortByItems.add(SortByItemModel(sortBy: 'Premium low to high'));
    } else if (policyQuoteListController.policyType ==
        PolicyType.healthInsurance) {
      sortByItems.clear();
      sortByItems
          .add(SortByItemModel(sortBy: 'By relevance', isSelected: true));
      sortByItems.add(SortByItemModel(sortBy: 'Premium low to high'));
      sortByItems.add(SortByItemModel(sortBy: 'Cashless hospitals network'));
      sortByItems
          .add(SortByItemModel(sortBy: 'Highest claim settlement ratio'));
    } else if (policyQuoteListController.policyType ==
        PolicyType.homeInsurance) {
      sortByItems.clear();
      sortByItems
          .add(SortByItemModel(sortBy: 'By relevance', isSelected: true));
      sortByItems.add(SortByItemModel(sortBy: 'Premium low to high'));
    } else if (policyQuoteListController.policyType ==
        PolicyType.carInsurance) {
      sortByItems.clear();
      sortByItems
          .add(SortByItemModel(sortBy: 'By relevance', isSelected: true));
      sortByItems.add(SortByItemModel(sortBy: 'IDV high to low'));
      sortByItems.add(SortByItemModel(sortBy: 'Claim Settled high to low'));
      sortByItems.add(SortByItemModel(sortBy: 'Premium low to high'));
    }
  }

  @override
  void onClose() {}
}
