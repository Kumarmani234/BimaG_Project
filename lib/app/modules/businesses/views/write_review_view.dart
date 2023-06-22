part of 'businesses_view.dart';

class WriteReviewView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: InsuranceAppbarView(
          title: 'Raj Girish Hospital',
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h,),

          roundContainer(Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 27.h,
                    backgroundImage: Image.network('https://picsum.photos/id/237/200/300').image,
                  ),
                  SizedBox(width: 10.w,),
                  Text('Sunil Choudhary', style: Ts.bold14(AppColors.black),)
                ],
              ),

              SizedBox(height: 10.w,),

              Container(
                width: Get.width,
                alignment: Alignment.center,
                child: Obx(() => StarRating(
                    starCount: 5,
                    starSize: 45.w,
                    rating: businessesController.writeReviewRate.value,
                    spacing: 20,
                    color: AppColors.accentColor,
                    onRatingChanged: (rate)=>businessesController.writeReviewRate.value = rate
                )),
              ),

              SizedBox(height: 10.w,),

              BorderTextField(
                hintText: 'Write your review here',
                titleText: '',
                maxLength: 300,
                minLine: 3,
                maxLine: 6,
                borderColor: AppColors.grey1,
                controller: TextEditingController(),
                textInputType: TextInputType.text,
              ),

            ],
          )),

          Spacer(),

          BottomButton(text: 'Post')
        ],
      ),
    );
  }
}
