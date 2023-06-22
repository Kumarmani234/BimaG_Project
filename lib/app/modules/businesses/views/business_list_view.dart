// ignore_for_file: must_be_immutable

part of 'businesses_view.dart';

class BusinessListView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: businessList.length,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 12.h, left: 12.w),
        itemBuilder: (ctx, index) => (BusinessItem(
          businessListItemModel: businessList[index],
        )),
      ),
    );
  }
}

class BusinessItem extends StatelessWidget {
  BusinessListItemModel businessListItemModel;
  BusinessItem({required this.businessListItemModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.mediumImpact();
        businessesController.setBusinessId('1');
        Get.toNamed(Routes.BUSINESSES);
      },
      child: Container(
        margin: EdgeInsets.only(right: 12.w),
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.h), color: AppColors.white),
        width: Get.width * 0.9,
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  businessListItemModel.name,
                  style: Ts.bold13(AppColors.black),
                ),
                Row(
                  children: [
                    Text(
                      businessListItemModel.rating + '  ',
                      style: Ts.regular12(AppColors.grey4),
                    ),
                    StarRating(
                      onRatingChanged: (val) {},
                      rating: double.parse(businessListItemModel.rating),
                      color: AppColors.accentColor,
                      starSize: 15.w,
                    ),
                    Text(
                      '  (' + businessListItemModel.totalRating + ')',
                      style: Ts.regular12(AppColors.grey4),
                    ),
                  ],
                ),
                Text(
                  businessListItemModel.address,
                  maxLines: 1,
                  style: Ts.regular12(AppColors.grey4),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 25.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.w),
                            color: AppColors.green.withOpacity(0.1)),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          'Covered in your policies',
                          style: Ts.medium11(AppColors.green),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        height: 25.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.w),
                            color: AppColors.green.withOpacity(0.1)),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          businessListItemModel.timing,
                          style: Ts.medium11(AppColors.green),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),

            //logo, call, direction
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 30.h,
                        backgroundImage:
                            Image.network('https://picsum.photos/200/300')
                                .image,
                      ),
                      SvgPicture.asset(
                        AssetPath.map_pin_hospital,
                        width: 16.w,
                      )
                    ],
                    alignment: Alignment.topRight,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AssetPath.business_call,
                      width: 32.w,
                    ),
                    SizedBox(
                      width: 8.h,
                    ),
                    SvgPicture.asset(
                      key:Key('business_call_key'),
                      AssetPath.business_direction,
                      width: 32.w,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
