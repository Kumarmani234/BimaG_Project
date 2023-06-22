// ignore_for_file: must_be_immutable

part of '../../../profile/views/profile_basic_details_form.dart';

class ViewPlanDetails extends StatelessWidget {
  const ViewPlanDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      bottomNavigationBar: Container(
          height: 110.h,
          decoration: BoxDecoration(
              color: AppColors.white, boxShadow: [Styles.upperShadow()]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                Expanded(
                    child: IconButtonRound(
                  title: 'Download PDF',
                  icon: Icon(
                    Icons.file_copy_outlined,
                    color: AppColors.primaryColor,
                  ),
                  onClick: () {},
                )),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                    child: IconButtonRound(
                  color: AppColors.black,
                  title: 'get_help'.tr,
                  icon: SvgPicture.asset(AssetPath.nav_help),
                  onClick: () {},
                )),
              ],
            ),
          )),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: InsuranceAppbarView(
          title: 'view_plans'.tr,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share_outlined,
                size: 20.w,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70.h,
              decoration: BoxDecoration(
                  color: Colors.white, boxShadow: [Styles.bottomShadow()]),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Image.network('https://iili.io/HO2R81j.png'),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'United India Insurance ',
                          style: Ts.semiBold14(AppColors.black),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'United India Insurance ',
                          style: Ts.regular12(AppColors.grey4),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            roundContainer(
              Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Policy Details',
                      style: Ts.bold17(AppColors.black),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TitleValue(
                      title: 'Plan Term',
                      value: '1 Year',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TitleValue(
                      title: 'Cover',
                      value: '₹ 15,00,000',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TitleValue(
                      title: 'Booking Date',
                      value: '23-Dec-2022',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TitleValue(
                      title: 'Your Premium',
                      value: '₹389 Yearly',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TitleValue(
                      title: 'Status',
                      value: 'Policy Issued',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TitleValue(
                      title: 'Booking ID',
                      value: '515620069',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TitleValue(
                      title: 'Proposer',
                      value: 'Pushpendra Singh Rathor',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TitleValue(
                      title: 'Policy No.',
                      value: 'PBC/000000595296',
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
              ),
            ),
            roundContainer(
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Transaction Details',
                      style: Ts.bold17(AppColors.black),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TitleValue(
                      title: 'Transaction Date',
                      value: '23 Dec 2022, 11:55 AM',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TitleValue(
                      title: 'Paid Using',
                      value: 'UPI',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TitleValue(
                      title: 'Amount',
                      value: '389',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TitleValue(
                      title: 'Product ',
                      value: 'Personal Accident',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TitleValue(
                      title: 'Transaction Status',
                      value: 'Successful',
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}

class TitleValue extends StatelessWidget {
  String title, value;
  TitleValue({required this.title, required this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: Ts.regular12(AppColors.grey4),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            value,
            style: Ts.semiBold14(AppColors.black),
          ),
        ],
      ),
    );
  }
}
