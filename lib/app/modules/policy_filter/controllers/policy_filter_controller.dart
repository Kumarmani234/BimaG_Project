import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/policy_filter/model/claim_button_model.dart';
import 'package:bima_g/app/modules/policy_filter/views/health/cover_view.dart';
import 'package:bima_g/app/modules/policy_filter/views/health/premium_view.dart';
import 'package:bima_g/app/modules/policy_filter/views/home/property_age_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../enums.dart';
import '../model/filter_expand_model.dart';
import '../model/nearby_garage_model.dart';
import '../views/health/policy_benefits_view.dart';
import '../views/health/room_rent_type_view.dart';
import '../views/home/policy_term.dart';
import '../views/two_wheeler/cover_on_expiring_policy_view.dart';
import '../views/two_wheeler/current_policy_expired_view.dart';
import '../views/two_wheeler/insured_value_view.dart';
import '../views/two_wheeler/no_claim_bonus_view.dart';
import '../views/two_wheeler/selected_garages_view.dart';

class PolicyFilterController extends GetxController {
  RxList<FilterExpandModel> filterList = <FilterExpandModel>[].obs;
  RxList<NearByGarageModel> nearByGarageList = <NearByGarageModel>[].obs;
  RxList<NearByGarageModel> coverTypeList = <NearByGarageModel>[].obs;
  RxList<NearByGarageModel> premiumTypeList = <NearByGarageModel>[].obs;
  RxList<NearByGarageModel> policyTermTypeList = <NearByGarageModel>[].obs;
  RxList<NearByGarageModel> propertyAgeList = <NearByGarageModel>[].obs;

  TextEditingController garageSearchCon = TextEditingController();

  //insured value
  Rx<int> insuredValue = 10000.obs,
      selectedCurrentPolicyExpiredOption = 1.obs,
      selectedCoverOfExpiringPolicy = 1.obs,
      selectedRoomRentType = 1.obs,
      selectedPolicyBenefits = 1.obs;

  //no claim bonus
  Rx<bool> currentApplicableNcb = true.obs;
  Rx<bool> claimsInLastPolicy = false.obs;
  Rx<bool> prevYearNcb = false.obs;

  //define by nensi
  Rx<bool> claimAble = false.obs;
  Rx<bool> ClaimDisable = false.obs;
  RxList<ClaimButtonModel> NCBSelectionList = <ClaimButtonModel>[].obs;
  Rx<ClaimButtonModel>? selectedNCB =
      ClaimButtonModel(id: 0, text: '0%', isButtonAble: true).obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    print('on ready caller : 32');

    if (policyQuoteListController.policyType == PolicyType.bikeInsurance) {
      filterList.add(FilterExpandModel(
          filterName: 'Insured value (IDV)', filterId: 0, isExpanded: true));
      filterList
          .add(FilterExpandModel(filterName: 'No claim bonus', filterId: 0));
      filterList
          .add(FilterExpandModel(filterName: 'Selected Garage', filterId: 0));
      filterList.add(FilterExpandModel(
          filterName: 'Has your Current policy expired?', filterId: 0));
      filterList.add(FilterExpandModel(
          filterName: 'Which cover did you have on your expiring policy?',
          filterId: 0));
    } else if (policyQuoteListController.policyType ==
        PolicyType.carInsurance) {
      filterList.add(FilterExpandModel(
          filterName: 'Insured value (IDV)', filterId: 0, isExpanded: true));
      filterList
          .add(FilterExpandModel(filterName: 'No claim bonus', filterId: 0));
      filterList
          .add(FilterExpandModel(filterName: 'Selected Garage', filterId: 0));
      filterList.add(FilterExpandModel(
          filterName: 'Has your Current policy expired?', filterId: 0));
      filterList.add(FilterExpandModel(
          filterName: 'Which cover did you have on your expiring policy?',
          filterId: 0));
    } else if (policyQuoteListController.policyType ==
        PolicyType.healthInsurance) {
      filterList.add(FilterExpandModel(
          filterName: 'Cover', filterId: 0, isExpanded: true));
      filterList
          .add(FilterExpandModel(filterName: 'Room rent type', filterId: 0));
      filterList
          .add(FilterExpandModel(filterName: 'Policy benefits', filterId: 0));
      filterList.add(
          FilterExpandModel(filterName: 'Premium (pre month)', filterId: 0));
    } else if (policyQuoteListController.policyType ==
        PolicyType.homeInsurance) {
      filterList.add(FilterExpandModel(
          filterName: 'Policy Term', filterId: 0, isExpanded: true));
      filterList
          .add(FilterExpandModel(filterName: 'Property Age', filterId: 0));
    }

    //cover types
    coverTypeList.add(
        NearByGarageModel(id: 0, garageName: 'Recommended', isSelected: true));
    coverTypeList.add(NearByGarageModel(
        id: 0, garageName: 'Below ₹3 lakh', isSelected: false));
    coverTypeList.add(
        NearByGarageModel(id: 0, garageName: '₹3-5 lakh', isSelected: false));
    coverTypeList.add(
        NearByGarageModel(id: 0, garageName: '₹5-6 lakh', isSelected: false));
    coverTypeList.add(
        NearByGarageModel(id: 0, garageName: '₹1 crore', isSelected: false));

    //near by garages
    nearByGarageList.add(NearByGarageModel(
        id: 0, garageName: 'K M Auto Garage', isSelected: true));
    nearByGarageList
        .add(NearByGarageModel(id: 0, garageName: 'SHRI RAM AUTO GARAGE'));
    nearByGarageList
        .add(NearByGarageModel(id: 0, garageName: 'Shree umiya auto garage'));
    nearByGarageList
        .add(NearByGarageModel(id: 0, garageName: 'Audi Ahmedabad'));
    nearByGarageList
        .add(NearByGarageModel(id: 0, garageName: 'H H GARAGE TYRE & BATTERY'));
    nearByGarageList
        .add(NearByGarageModel(id: 0, garageName: 'Vishwakarma Auto Garage'));
    nearByGarageList
        .add(NearByGarageModel(id: 0, garageName: 'Khodiyar Auto Garage'));

    //policy term type list - home insurance
    policyTermTypeList.add(NearByGarageModel(id: 0, garageName: 'Recommended'));
    policyTermTypeList.add(NearByGarageModel(id: 0, garageName: '1 Year'));
    policyTermTypeList.add(NearByGarageModel(id: 0, garageName: '3 Years'));
    policyTermTypeList.add(NearByGarageModel(id: 0, garageName: '5 Years'));
    policyTermTypeList.add(NearByGarageModel(id: 0, garageName: '10 Years'));

    //premium type list for health
    premiumTypeList.add(NearByGarageModel(
        id: 0, garageName: 'No preference', isSelected: true));
    premiumTypeList.add(NearByGarageModel(id: 0, garageName: 'Below 1000'));
    premiumTypeList.add(NearByGarageModel(id: 0, garageName: '1000 - 3000'));
    premiumTypeList.add(NearByGarageModel(id: 0, garageName: '> 3000'));

    propertyAgeList.add(NearByGarageModel(
        id: 0, garageName: 'No preference', isSelected: true));
    propertyAgeList.add(NearByGarageModel(id: 0, garageName: 'Below 5 Years'));
    propertyAgeList.add(NearByGarageModel(id: 0, garageName: '5 - 10 Years'));
    propertyAgeList.add(NearByGarageModel(id: 0, garageName: '> 10 Years'));

    //define by nensi
    NCBSelectionList.add(
        ClaimButtonModel(id: 0, text: '0%', isButtonAble: true));
    NCBSelectionList.add(
        ClaimButtonModel(id: 1, text: '20%', isButtonAble: false));
    NCBSelectionList.add(
        ClaimButtonModel(id: 2, text: '25%', isButtonAble: false));
    NCBSelectionList.add(
        ClaimButtonModel(id: 3, text: '35%', isButtonAble: false));
    NCBSelectionList.add(
        ClaimButtonModel(id: 4, text: '45%', isButtonAble: false));
    NCBSelectionList.add(
        ClaimButtonModel(id: 5, text: '50%', isButtonAble: false));
  }

  //define by nensi
  void onPreviousClaimSelect(index) {
    for (int j = 0; j < NCBSelectionList.length; j++) {
      NCBSelectionList[j].isButtonAble = false;
    }
    NCBSelectionList[index].isButtonAble = true;
    selectedNCB!.value = NCBSelectionList[index];
    NCBSelectionList.refresh();
  }

  @override
  void onClose() {}

  @override
  void dispose() {
    super.dispose();
  }

  onClickPolicyTerm(index) {
    HapticFeedback.mediumImpact();
    for (int i = 0; i < policyTermTypeList.length; i++) {
      policyTermTypeList[i].isSelected = false;
    }
    policyTermTypeList[index].isSelected = true;
    policyTermTypeList.refresh();
  }

  onClickPropertyAge(index) {
    HapticFeedback.mediumImpact();
    for (int i = 0; i < policyFilterController.propertyAgeList.length; i++) {
      policyFilterController.propertyAgeList[i].isSelected = false;
    }
    policyFilterController.propertyAgeList[index].isSelected = true;
    policyFilterController.propertyAgeList.refresh();
  }

  fetchFilterList(index) {
    if (policyQuoteListController.policyType == PolicyType.bikeInsurance) {
      switch (index) {
        case 0:
          return InsuredValueView();
        case 1:
          return NoClaimBonusView();
        case 2:
          return SelectedGaragesView();
        case 3:
          return CurrentPolicyExpiredView();
        case 4:
          return CoverOnExpiringPolicyView();
      }
    } else if (policyQuoteListController.policyType ==
        PolicyType.carInsurance) {
      switch (index) {
        case 0:
          return InsuredValueView();
        case 1:
          return NoClaimBonusView();
        case 2:
          return SelectedGaragesView();
        case 3:
          return CurrentPolicyExpiredView();
        case 4:
          return CoverOnExpiringPolicyView();
      }
    } else if (policyQuoteListController.policyType ==
        PolicyType.healthInsurance) {
      switch (index) {
        case 0:
          return CoverView();
        case 1:
          return RoomRentTypeView();
        case 2:
          return PolicyBenefitsView();
        case 3:
          return PremiumView();
      }
    } else {
      switch (index) {
        case 0:
          return PolicyTerm();
        case 1:
          return PropertyAgeView();
      }
    }
  }
}
