part of 'businesses_view.dart';

class BusinessBottomButtonView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          Styles.upperShadow()
        ]
      ),
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButtonRound(
            title: 'Share',
            icon: Icon(Icons.share, color: AppColors.primaryColor, size: 12.w,),
            onClick: (){},
          ),

          IconButtonRound(
            title: 'Call',
            icon: Icon(Icons.call, color: AppColors.primaryColor, size: 12.w,),
            onClick: (){},
          ),

          IconButtonRound(
            title: 'Directions',
            icon: SvgPicture.asset(AssetPath.navigation_arrow, width: 12.w),
            onClick: (){},
          )
        ],
      ),
    );
  }
}
