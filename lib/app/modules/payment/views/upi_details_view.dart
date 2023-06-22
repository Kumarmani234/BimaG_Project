part of 'payment_view.dart';

class UpiDetailsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomButton(
          onClick: () {}, text: 'Pay Now ₹${paymentController.payAmount}'),
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Obx(() => InsuranceAppbarView(
              title: 'Select UPI',
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
                Text('Pay using UPI App',
                    style: Ts.semiBold17(AppColors.black)),

                SizedBox(
                  height: 15.h,
                ),

                Obx(() => Column(
                      children: [
                        for (int i = 0;
                            i < paymentController.upiList.length;
                            i++)
                          CheckBoxWithImageIconBordered(
                            prefixIcon: SvgPicture.asset(AssetPath.wallet),
                            isSelected: paymentController.upiList[i].isSelected,
                            title: paymentController.upiList[i].bankName,
                            onClick: () {
                              for (int j = 0;
                                  j < paymentController.upiList.length;
                                  j++) {
                                paymentController.upiList[j].isSelected = false;
                              }
                              paymentController.upiList[i].isSelected = true;
                              paymentController.upiList.refresh();
                            },
                          )
                      ],
                    )),

                SizedBox(
                  height: 15.h,
                ),
                //Text('Select Other Bank', style: Ts.regular12(AppColors.grey5)),
                DropDown(
                  key: Key('enter_upi_key'),
                  field_label: 'Enter UPI ID',
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
