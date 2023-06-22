// ignore_for_file: invalid_return_type_for_catch_error

import 'dart:convert';
import 'package:bima_g/app/enums.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance_plan_selection/views/car_insurance_plan_selection_view.dart';
import 'package:bima_g/app/modules/health_insurance_module/health_insurance_plan_selection/views/health_insurance_plan_selection_view.dart';
import 'package:bima_g/app/modules/home_insurance_module/home_insurance_plan_selection/views/home_insurance_plan_selection_view.dart';
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_plan_selection/views/two_wheeler_plan_selection_view.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../module_controllers.dart';
import '../../two_wheeler_insurance/two_wheeler_details/model/ReqGetBikeQuoteDetails.dart';
import '../model/quote_list_model.dart';
import '../views/policy_quote_list_view.dart';

class PolicyQuoteListController extends GetxController {
  var policyType;

  RxList<QuoteListModel> listQuotesModel = <QuoteListModel>[].obs;
  ReqGetBikeQuoteDetails reqGetQuoteDetails = ReqGetBikeQuoteDetails();
  RefreshController policyQuoteRefreshController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    reqGetQuoteDetails = ReqGetBikeQuoteDetails(
        registrationNumber: '',
        filter: Filter(
          currentPolicyExpired: 1,
          isCommercial: 0,
          noClaimBonus: NoClaimBonus(
              currentApplicableNcb: true,
              previousYearNcb: true,
              lastPolicyClaim: true),
          policyCover: 1,
          sortStrategy: 1,
        ));
    print(jsonEncode(reqGetQuoteDetails));
    //policyType =
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  onPlanCompareClick(indexOfPlan) {
    listQuotesModel[indexOfPlan].isPlanSelectedForCompare =
        !listQuotesModel[indexOfPlan].isPlanSelectedForCompare;
    listQuotesModel.refresh();
    if (listQuotesModel[indexOfPlan].isPlanSelectedForCompare) {
      if (comparePlansController.listSelectedQuotes.length == 3) {
        HapticFeedback.mediumImpact();
        Get.snackbar('Plan Compare', 'You can compare only 3 Plans');
        listQuotesModel[indexOfPlan].isPlanSelectedForCompare =
            !listQuotesModel[indexOfPlan].isPlanSelectedForCompare;
      } else {
        comparePlansController.listSelectedQuotes
            .add(listQuotesModel[indexOfPlan]);
      }
    } else {
      //remove plan
      for (int i = 0;
          i < comparePlansController.listSelectedQuotes.length;
          i++) {
        if (comparePlansController.listSelectedQuotes[i].quoteId ==
            listQuotesModel[indexOfPlan].quoteId) {
          comparePlansController.listSelectedQuotes.removeAt(i);
        }
      }
    }
    print(
        'length of selected list : ${comparePlansController.listSelectedQuotes.length}');
    comparePlansController.listSelectedQuotes.refresh();
  }

  onPlanSaveClick(indexOfPlan) {
    HapticFeedback.mediumImpact();
    listQuotesModel[indexOfPlan].isPlanSaved =
        !listQuotesModel[indexOfPlan].isPlanSaved;
    listQuotesModel.refresh();
  }

  void fetchQuoteList({vehicle_num = '', vehicleType = 0}) {
    if (vehicleType == 1) {
      bikeInsuranceController.viewQuotesButtonStatus.value =
          ButtonStatus.Loading;
    } else {
      carInsuranceController.viewQuotesButtonStatus.value =
          ButtonStatus.Loading;
    }
    print(vehicle_num);
    listQuotesModel.clear();

    if (vehicle_num.toString().isNotEmpty) {
      reqGetQuoteDetails.registrationNumber =
          vehicle_num.toString().replaceAll('-', '');
    }

    if (vehicleType != 0) {
      reqGetQuoteDetails.vehilceType = vehicleType;
    }

    print(jsonEncode(reqGetQuoteDetails));
    apiClientProvider
        .getQuoteDetails(reqGetQuoteDetails.toJson())
        .then((value) async {
      if (vehicleType == 1) {
        bikeInsuranceController.viewQuotesButtonStatus.value =
            ButtonStatus.Active;
      } else {
        carInsuranceController.viewQuotesButtonStatus.value =
            ButtonStatus.Active;
      }
      if (await apiClientProvider.checkStatus(value)) {
        print('getQuoteDetails : ${value.body.toString()}');
        for (int i = 0; i < value.body['data'].length; i++) {
          dynamic data = value.body['data'][i];
          QuoteListModel quoteListModel = QuoteListModel(
              quoteId: data['enquiryId'],
              planImage: data['logo'],
              planIDV: data['idv'].toString(),
              claimSettled: '56',
              planOriginalPrice: '',
              insuranceCompany: data['insuranceCompany'],
              planDiscountedPrice:
                  data['grossPremium'].toString().replaceAll('INR ', ''),
              planDetailsList: [],
              isPlanSaved: false);
          listQuotesModel.add(quoteListModel);
          listQuotesModel.refresh();
        }
        Get.to(PolicyQuoteListView());
      }
    }).catchError((err) => print(err.toString()));
  }

  setPolicyType(PolicyType type) {
    policyType = type;
    print('policyType: ${type == PolicyType.carInsurance}');
  }

  onPolicyClick(QuoteListModel listQuotesModel) {
    {
      if (policyType == PolicyType.bikeInsurance) {
        twoWheelerPlanSelectionController.selectedEnquiryID =
            listQuotesModel.quoteId;
        twoWheelerPlanSelectionController.selectedInsuranceCompany =
            listQuotesModel.insuranceCompany;
        Get.to(TwoWheelerPlanSelectionView());
      } else if (policyType == PolicyType.carInsurance) {
        carInsurancePlanSelectionController.selectedEnquiryID =
            listQuotesModel.quoteId;
        carInsurancePlanSelectionController.selectedInsuranceCompany =
            listQuotesModel.insuranceCompany;
        Get.to(CarInaurancePlanSelectionView());
      } else if (policyType == PolicyType.healthInsurance) {
        Get.to(HealthInsurancePlanSelectionView());
      } else {
        Get.to(HomeInsurancePlanSelectionView());
      }
    }
  }

  onRefresh() {
    Future.delayed(Duration(seconds: 2),
        () => policyQuoteRefreshController.refreshCompleted());
  }
}
