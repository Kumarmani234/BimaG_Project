part of 'payment_view.dart';

class BankDetailsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomButton(
          onClick: () {}, text: 'Pay Now ₹${paymentController.payAmount}'),
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Obx(() => InsuranceAppbarView(
              title: 'Select Banks',
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
          roundContainer(Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Popular Banks', style: Ts.semiBold17(AppColors.black)),

                SizedBox(
                  height: 15.h,
                ),

                Obx(() => Column(
                      children: [
                        for (int i = 0;
                            i < paymentController.banksList.length;
                            i++)
                          CheckBoxWithImageIconBordered(
                            prefixIcon: SvgPicture.asset(AssetPath.wallet),
                            isSelected:
                                paymentController.banksList[i].isSelected,
                            title: paymentController.banksList[i].bankName,
                            onClick: () {
                              for (int j = 0;
                                  j < paymentController.banksList.length;
                                  j++) {
                                paymentController.banksList[j].isSelected =
                                    false;
                              }
                              paymentController.banksList[i].isSelected = true;
                              paymentController.banksList.refresh();
                            },
                          )
                      ],
                    )),

                SizedBox(
                  height: 15.h,
                ),
                //Text('Select Other Bank', style: Ts.regular12(AppColors.grey5)),
                DropDown(
                  key: Key('select_other_bank_key'),
                  field_label: 'Select Other Bank',
                  selectedValue: 'Axis',
                  dropdown_values: ['Axis', 'ICICI', 'IDFC', 'Bank of Baroda'],
                ),

                //SizedBox(height: 15.h,),
                Text(
                  'By clicking on pay now i agree to the Terms & Conditions and confirm that the vehicle is a registered private two wheeler know more\n\nAs per IRDAI guidelines, you will be required to complete your KYC after payment for successful policy issuance',
                  style: Ts.regular12(AppColors.grey5),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
