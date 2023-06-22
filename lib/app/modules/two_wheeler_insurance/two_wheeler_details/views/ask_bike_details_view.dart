// ignore_for_file: must_be_immutable
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_details/views/tabs/city_selection_tab_view.dart';
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_details/views/tabs/manufacturer_selection_tab_view.dart';
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_details/views/tabs/model_selection_tab_view.dart';
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_details/views/tabs/rto_selection_tab_view.dart';
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_details/views/tabs/variant_selection_tab_view.dart';
import 'package:bima_g/app/modules/two_wheeler_insurance/two_wheeler_details/views/tabs/year_selection_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../module_controllers.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';
import 'custom_components/custom_btn.dart';

class AskBikeDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(title: 'bike_insurance'.tr),
        preferredSize: Size.fromHeight(80.h),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              bikeInsuranceController.selectedButton.value;
              return TopSlider(); //tabs
            }),
            SizedBox(height: 16.h),
            Obx(
              () {
                switch (bikeInsuranceController.selectedButton.value) {
                  case 'City':
                    return CitySelectionTabView(
                      cityController: bikeInsuranceController.cityController,
                    );
                  case 'RTO':
                    return RtoSelectionTabView(
                      RTOController: bikeInsuranceController.RTOController,
                      selectedCity: bikeInsuranceController.selectedCity.value,
                    );
                  case 'Manufacturer':
                    return ManufacturerSelectionTabView(
                      manuController: bikeInsuranceController.manuController,
                    );
                  case 'Model':
                    return ModelSelectionTabView(
                      modelController: bikeInsuranceController.modelController,
                    );
                  case 'Variant':
                    return VariantSelectionTabView(
                      variantController:
                          bikeInsuranceController.variantController,
                    );
                  default:
                    return YearSelectionTabView();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget TopSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.none,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          height: 36.h,
          child: Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  bikeInsuranceController.listTabs.length,
                  (index) => Builder(
                    builder: (context) => CustomButton(
                      onTabClick: () {
                        if (bikeInsuranceController.listTabs[index].tabStatus !=
                            3) {
                          return;
                        }
                        bikeInsuranceController.setSelectButtonByIndex(index);
                      },
                      text: bikeInsuranceController.listTabs[index].tabName,
                      status: bikeInsuranceController.listTabs[index].tabStatus,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
