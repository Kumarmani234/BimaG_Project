part of 'businesses_view.dart';

class TitleRatingView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          Styles.bottomLightShadow()
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(businessesController.businessListItemModel.name, style: Ts.bold13(AppColors.black),),

          Row(
            children: [
              Text(businessesController.businessListItemModel.rating+'  ', style: Ts.regular12(AppColors.grey4),),
              StarRating(
                onRatingChanged: (val){},
                rating: double.parse(businessesController.businessListItemModel.rating),
                color: AppColors.accentColor,
                starSize: 15.w,
              ),

              Text('  ('+businessesController.businessListItemModel.totalRating+')', style: Ts.regular12(AppColors.grey4),),
            ],
          ),

          //Text(businessesController.businessListItemModel.address, maxLines: 1, style: Ts.regular12(AppColors.grey4),),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  height: 25.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.w),
                      color: AppColors.green.withOpacity(0.1)
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text('Covered in your policies', style: Ts.medium11(AppColors.green),),
                ),

                SizedBox(width: 10.w,),

                Container(
                  height: 25.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.w),
                      color: AppColors.green.withOpacity(0.1)
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(businessesController.businessListItemModel.timing, style: Ts.medium11(AppColors.green),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
