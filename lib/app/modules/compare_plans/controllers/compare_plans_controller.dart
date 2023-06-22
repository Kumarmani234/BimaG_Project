import 'package:get/get.dart';
import '../../policy_quote_list/model/quote_list_model.dart';
import '../model/tabs_complare_plan_model.dart';

class ComparePlansController extends GetxController {
  RxList<QuoteListModel> listSelectedQuotes = <QuoteListModel>[].obs;
  RxList<TabsComparePlanModel> tabsForComparePlan =
      <TabsComparePlanModel>[].obs;

  Rx<int> currentComparePlanTabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    tabsForComparePlan.add(TabsComparePlanModel(
        tabName: 'Own Damage Only', tabId: 0, isActive: true));
    tabsForComparePlan.add(TabsComparePlanModel(
        tabName: 'Comprehensive Cover', tabId: 1, isActive: false));
    tabsForComparePlan.add(TabsComparePlanModel(
        tabName: 'Third-Party Cover', tabId: 2, isActive: false));
  }

  @override
  void onClose() {}

  removeSelectedPlan(int index) {
    /*for(int i=0;i<bikeInsuranceController.listQuotes.length;i++){
      if(bikeInsuranceController.listQuotes[i].quoteId == listSelectedQuotes[index].quoteId){
        bikeInsuranceController.listQuotes[i].isPlanSelectedForCompare = false;
      }
    }
    listSelectedQuotes.removeAt(index);
    listSelectedQuotes.refresh();
    bikeInsuranceController.listQuotes.refresh();*/
  }
}
