part of 'near_by_view.dart';

class NearbyCategoriesView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: nearByController.nearByCategories.length,
        padding: EdgeInsets.only(top: 10.h, left: 12.w),
        itemBuilder: (ctx, index)=>Padding(
          padding: EdgeInsets.only(right: 6.w),
          child : index == 0 ? RoundSquareButtons.buttonEnabled(onPressed: (){}, text: nearByController.nearByCategories[index])
           : RoundSquareButtons.buttonWhite(onPressed: (){}, text: nearByController.nearByCategories[index]),
        ),
      ),
    );
  }
}
