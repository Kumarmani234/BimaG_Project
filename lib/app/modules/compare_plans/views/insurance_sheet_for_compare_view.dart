// ignore_for_file: must_be_immutable

import 'package:bima_g/utility/colors.dart';
import 'package:bima_g/utility/styles.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../policy_quote_list/model/quote_list_model.dart';

class InsuranceSheetForCompareView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 4.h, width: 40.w, color: AppColors.grey2)
            ],
          ),

          //SizedBox(height: 15.h,),

          Row(
            children: [
              Text(
                'Select Insurance',
                style: Ts.bold17(AppColors.black),
              ),
              Spacer(),
              IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.cancel_outlined))
            ],
          ),

          Expanded(
              child: SingleChildScrollView(
            child: Wrap(
              //spacing: 8.h,
              runSpacing: 8.h,
              children: [
                // for(int i=0;i<bikeInsuranceController.listQuotes.length * 2;i++)InstanceSheetItemView(quoteListModel: bikeInsuranceController.listQuotes[0])
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class InstanceSheetItemView extends StatelessWidget {
  QuoteListModel quoteListModel;
  InstanceSheetItemView({required this.quoteListModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.h),
          boxShadow: [Styles.shadow()]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 6.h,
          ),
          Expanded(
            child: Image.network('https://iili.io/HO2R81j.png'),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text('United india insurance', style: Ts.regular13(AppColors.black)),
          SizedBox(
            height: 4.h,
          )
        ],
      ),
    );
  }
}
