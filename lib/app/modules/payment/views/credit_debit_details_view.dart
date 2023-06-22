part of 'payment_view.dart';

class CreditDebitDetailsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      bottomNavigationBar: BottomButton(
          onClick: () {}, text: 'Pay Now ₹${paymentController.payAmount}'),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Obx(() => InsuranceAppbarView(
              title: 'Enter Credit / Debit Card',
              subTitle: paymentController.remainingSeconds.value == 0
                  ? 'Session Expired'
                  : 'Session will expire in ${Utils.formatedTime(time: paymentController.remainingSeconds.value)}',
            )),
      ),
      body: roundContainer(
          verticalPadding: 20.h,
          Padding(
            padding: EdgeInsets.all(6.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BorderTextField(
                  key: Key('card_no_key'),
                    textInputType: TextInputType.number,
                    titleText: 'Enter your card number',
                    hintText: '1234 5678 9012',
                    maxLength: 19,
                    controller: TextEditingController(),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CardNumberFormatter(),
                    ]),

                SizedBox(
                  height: 15.h,
                ),

                BorderTextField(
                    key: Key('name_of_card_key'),
                    titleText: 'Name on the card',
                    hintText: 'Name on the card',
                    controller: TextEditingController()),

                SizedBox(
                  height: 15.h,
                ),
                //card details
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //month/mm
                    Expanded(
                        child: SmallDropDown(
                          key: Key('month_key'),
                      field_label: 'Month / MM',
                      dropdown_values: [
                        '1',
                        '2',
                        '3',
                        '4',
                        '5',
                        '6',
                        '7',
                        '8',
                        '9',
                        '10',
                        '11',
                        '12'
                      ],
                    )),

                    SizedBox(
                      width: 12.w,
                    ),

                    Expanded(
                        child: SmallDropDown(
                          key: Key('year_key'),
                          field_label: 'Year / YY',
                      dropdown_values: [
                        "23",
                        "24",
                        "25",
                        "26",
                        "27",
                        "28",
                        "29",
                        "30",
                        "31",
                        "32",
                        "33",
                        "34",
                        "35",
                        "36",
                        "37",
                        "38",
                        "39",
                        "40",
                        "41",
                        "42",
                        "43",
                        "44",
                        "45",
                        "46",
                        "47",
                        "48",
                        "49",
                        "50",
                        "51",
                        "52",
                        "53",
                        "54",
                        "55",
                        "56",
                        "57",
                        "58",
                        "59",
                        "60",
                        "61",
                        "62",
                        "63",
                        "64",
                        "65",
                        "66",
                        "67",
                        "68",
                        "69",
                        "70",
                        "71",
                        "72",
                        "73",
                        "74",
                        "75",
                        "76",
                        "77",
                        "78",
                        "79",
                        "80",
                        "81",
                        "82",
                        "83",
                        "84",
                        "85",
                        "86",
                        "87",
                        "88",
                        "89",
                        "90",
                        "91",
                        "92",
                        "93",
                        "94",
                        "95",
                        "96",
                        "97",
                        "98",
                        "99",
                        "100"
                      ],
                    )),

                    SizedBox(
                      width: 12.w,
                    ),

                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'CVV',
                          style: Ts.regular12(AppColors.grey5),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          height: 40.h,
                          padding: EdgeInsets.only(left: 3.w, right: 8.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.w),
                              border:
                                  Border.all(color: AppColors.grey4, width: 1)),
                          child: CupertinoTextField.borderless(
                            key: Key('cvv_key'),
                            maxLength: 3,
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            suffix: SvgPicture.asset(
                              AssetPath.cvv,
                              width: 16.w,
                            ),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),

                Text(
                  'By clicking on pay now i agree to the Terms & Conditions and confirm that the vehicle is a registered private two wheeler know more',
                  style: Ts.regular12(AppColors.grey5),
                ),

                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'As per IRDAI guidelines, you will be required to complete your KYC after payment for successful policy issuance',
                  style: Ts.regular12(AppColors.grey5),
                ),
              ],
            ),
          )),
    );
  }
}
