import 'package:bima_g/app/modules/insurance_appbar/views/insurance_appbar_view.dart';
import 'package:bima_g/app/widgets/buttons.dart';
import 'package:bima_g/app/widgets/drop_down.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:bima_g/utility/ts.dart';
import 'package:bima_g/utility/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../utility/colors.dart';
import '../../../module_controllers.dart';
import '../../../widgets/checkboxes.dart';
import '../../../widgets/containers.dart';
import '../../../widgets/textfields.dart';
import '../controllers/payment_controller.dart';
part 'bank_details_view.dart';
part 'credit_debit_details_view.dart';
part 'upi_details_view.dart';
part 'wallet_details_view.dart';

class PaymentView extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Obx(() => InsuranceAppbarView(
              title: 'Choose Payment Mode',
              subTitle: paymentController.remainingSeconds.value == 0
                  ? 'Session Expired'
                  : 'Session will expire in ${Utils.formatedTime(time: paymentController.remainingSeconds.value)}',
            )),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 15.h,
          ),
          roundContainer(Column(
            children: [
              PaymentModeButton(
                  title: 'Credit / Debit Card',
                  iconPath: AssetPath.creditCard,
                  onClick: () => Get.to(CreditDebitDetailsView())),
              SizedBox(
                height: 15.h,
              ),
              PaymentModeButton(
                  title: 'Net Banking',
                  iconPath: AssetPath.net_banking,
                  onClick: () => Get.to(BankDetailsView())),
              SizedBox(
                height: 15.h,
              ),
              PaymentModeButton(
                  title: 'UPI / VPA / QR',
                  iconPath: AssetPath.upi,
                  onClick: () => Get.to(UpiDetailsView())),
              SizedBox(
                height: 15.h,
              ),
              PaymentModeButton(
                  title: 'Wallet',
                  iconPath: AssetPath.wallet,
                  onClick: () => Get.to(WalletDetailsView()))
            ],
          )),
          roundContainer(
              verticalPadding: 15,
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Proposer’s Detail',
                      style: Ts.semiBold17(AppColors.black),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'Email',
                      style: Ts.regular13(AppColors.grey4),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'contacttopsr@gmail.com',
                      style: Ts.semiBold15(AppColors.black),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'Mobile',
                      style: Ts.regular13(AppColors.grey4),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      '+91 7597960696',
                      style: Ts.semiBold15(AppColors.black),
                    ),
                  ],
                ),
              )),
          roundContainer(Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              children: [
                Obx(() => SquareCheckbox(
                  key: Key('check_box_key'),
                    onChange: () => paymentController.acceptedTerms.value =
                        !paymentController.acceptedTerms.value,
                    isChecked: paymentController.acceptedTerms.value)),

                SizedBox(width: 15.w,),

                Expanded(
                  child: Wrap(
                    children: [
                      Text(
                        'I agree to your ',
                        style: Ts.semiBold13(AppColors.grey5),
                      ),
                      Text(
                        'Terms & Conditions',
                        style: Ts.bold13(AppColors.primaryColor)
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                      Text(' & '),
                      Text('Privacy Policy',
                          style: Ts.bold13(AppColors.primaryColor)
                              .copyWith(decoration: TextDecoration.underline)),
                    ],
                  ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
