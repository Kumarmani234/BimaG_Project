// ignore_for_file: must_be_immutable
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance/views/details_tab/city_tab_view.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance/views/details_tab/rto_tab_view.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance/views/details_tab/variant_tab_view.dart';
import 'package:bima_g/app/modules/four_wheeler_insurance/car_insurance/views/details_tab/year_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../insurance_appbar/views/insurance_appbar_view.dart';
import '../../../two_wheeler_insurance/two_wheeler_details/views/custom_components/custom_btn.dart';
import 'details_tab/manufacturer_tab_view.dart';
import 'details_tab/model_tab_view.dart';

class AskCarDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: InsuranceAppbarView(title: 'car_insurance'.tr),
        preferredSize: Size.fromHeight(80.h),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              carInsuranceController.selectedButton.value;
              return TopSlider(); //tabs
            }),
            SizedBox(height: 16.h),
            Obx(
              () {
                switch (carInsuranceController.selectedButton.value) {
                  case 'City':
                    return CityTabView(
                      cityController: carInsuranceController.cityController,
                    );
                  case 'RTO':
                    return RtoTabView(
                      RTOController: carInsuranceController.RTOController,
                      selectedCity: carInsuranceController.selectedCity.value,
                    );
                  case 'Manufacturer':
                    return ManufacturerTabView(
                      manuController: carInsuranceController.manuController,
                    );
                  case 'Model':
                    return ModelTabView(
                      modelController: carInsuranceController.modelController,
                    );
                  case 'Variant':
                    return VariantTabView(
                      variantController:
                          carInsuranceController.variantController,
                    );
                  default:
                    return YearTabView();
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
                  carInsuranceController.listTabs.length,
                  (index) => Builder(
                    builder: (context) => CustomButton(
                      onTabClick: () {
                        if (carInsuranceController.listTabs[index].tabStatus !=
                            3) {
                          return;
                        }
                        carInsuranceController.setSelectButtonByIndex(index);
                      },
                      text: carInsuranceController.listTabs[index].tabName,
                      status: carInsuranceController.listTabs[index].tabStatus,
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
