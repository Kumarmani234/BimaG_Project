part of '../businesses_view.dart';
class BusinessServicesTabView extends GetView {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: businessesController.listServices.length,
      padding: EdgeInsets.all(15.w),
      itemBuilder: (ctx, index)=>Container(
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: AppColors.white
        ),
        padding: EdgeInsets.all(15.w),
        child: Text(businessesController.listServices[index]),
      ),
    );
  }
}
