part of '../businesses_view.dart';

class BusinessInfoTabView extends GetView {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 10.h,),

          roundContainer(Column(
            children: [
              Row(
                children: [
                  Icon(Icons.pin_drop_outlined),
                  SizedBox(width: 10.w,),
                  Expanded(child: Text('CP-7, Sirsi Rd, RIICO Industrial Area, Bindayaka, Jaipur, Rajasthan 302012'))
                ],
              ),
              
              SizedBox(height: 15.h,),

              ClipRRect(
                borderRadius: BorderRadius.circular(10.w),
                child: Container(
                  height: 110.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  child: nearByController.getGoogleMap(),
                ),
              )
            ],
          )),
          
          roundContainer(Row(
            children: [
              SvgPicture.asset(AssetPath.business_clock, width: 24.w,),
              SizedBox(width: 10.w,),
              Text('Open 24 Hours',style: Ts.regular13(AppColors.black),)
            ],
          )),

          roundContainer(Row(
            children: [
              SvgPicture.asset(AssetPath.business_phone, width: 24.w),
              SizedBox(width: 10.w,),
              Text('+91 897 354 9874',style: Ts.regular13(AppColors.black),)
            ],
          )),

          roundContainer(Row(
            children: [
              SvgPicture.asset(AssetPath.business_tab, width: 24.w),
              SizedBox(width: 10.w,),
              Text('www.rajgirish.com',style: Ts.regular13(AppColors.black),)
            ],
          )),

        ],
      ),
    );
  }
}

