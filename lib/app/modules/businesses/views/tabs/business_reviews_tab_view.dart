part of '../businesses_view.dart';

class BusinessReviewsTabView extends GetView {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: roundContainer(
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //title
                  Row(
                    children: [
                      Text('Overall review summary', style: Ts.bold14(AppColors.black),),
                      Spacer(),
                      SvgPicture.asset(AssetPath.edit_pencil, width: 14.w,),
                      SizedBox(width: 6.w,),
                      InkWell(
                        onTap: ()=>Get.to(WriteReviewView()),
                          child: Text('Write a review', style: Ts.bold14(AppColors.primaryColor),)),
                    ],
                  ),

                  SizedBox(height: 10.h,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          /*salesPageController.overAllRating.isNaN
                            ? Text(
                          "${0.toStringAsFixed(0)}",
                          style: TextStyle(
                              fontSize: 32.sp,
                              color: AppColors.black,
                              fontWeight:
                              FontWeight.w400),
                        )
                            : */Text(
                            "4.4",
                            style: TextStyle(
                                fontSize: 48.sp,
                                color: AppColors.black,
                                fontWeight:
                                FontWeight.w600),
                          ),
                          IgnorePointer(
                            child: StarRating(
                              onRatingChanged: (val){},
                              rating:4.4,
                              color: AppColors.accentColor,
                              starSize: 15.w,
                            ),
                          ),
                          Text(
                            "105 Reviews",
                            style: Ts.regular12(AppColors.grey4),
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          chartRow(
                              context,
                              '5',
                              3
                          ),
                          chartRow(
                              context,
                              '4',
                              3
                          ),
                          chartRow(
                              context,
                              '3',
                              3
                          ),
                          chartRow(
                              context,
                              '2',
                              3
                          ),
                          chartRow(
                              context,
                              '1',
                              3
                          ),
                          SizedBox(height: 8)
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),

          ListView.builder(
            itemCount: 10,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (ctx, index)=>roundContainer(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.white,
                      backgroundImage: Image.network('https://picsum.photos/id/237/200/300').image,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),

                    Text(
                      'Anonymous',
                      style: Ts.medium13(AppColors.black),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        IgnorePointer(
                          child: StarRating(
                            onRatingChanged: (rate){},
                            color: AppColors.accentColor,
                            rating: 4.4,
                            starSize: 12.w,
                            starCount: 5,
                          ),
                        ),

                        Text('a year ago', style: Ts.regular12(AppColors.grey4),)
                      ],
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    'Nice doctors...Nice staff..It is located on the main road Named Sirsi Road so easily spotable..General',
                    style:Ts.regular13(AppColors.grey5),
                  ),
                ),
              ],
            ), verticalPadding: 6.0),
          )
          
        ],
      ),
    );
  }
}

Widget chartRow(BuildContext context, String label, int pct) {
  return Padding(
    padding: EdgeInsets.only(bottom: 2.h),
    child: Row(
      children: [
        SizedBox(
          width: 16.w,
        ),
        Text('$label',
            textAlign: TextAlign.start, style: Ts.bold13(AppColors.grey4)),
        SizedBox(
          width: 4.w,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(),
          child: Stack(alignment: AlignmentDirectional.centerStart, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  height: 4.h,
                  width: MediaQuery.of(context).size.width * 0.55,
                  decoration: BoxDecoration(
                      color: AppColors.grey1,
                      borderRadius: BorderRadius.circular(0)),
                  child: Text(
                    '',
                    style: Ts.semiBold13(AppColors.primaryColor),
                  ),
                ),
              ],
            ),
            Container(
              height: 4.h,
              width: MediaQuery.of(context).size.width * (pct / 100) * 0.55,
              decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.circular(0)),
              child: Text(''),
            ),
          ]),
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(
          '$pct',
          style: Ts.bold13(AppColors.grey4),
        ),
      ],
    ),
  );
}
