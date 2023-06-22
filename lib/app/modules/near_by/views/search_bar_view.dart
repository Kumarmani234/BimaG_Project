// ignore_for_file: must_be_immutable

part of 'near_by_view.dart';

class SearchBarView extends GetView {
  String hintText;
  final controller;
  final onChanged;
  SearchBarView(
      {required this.controller,
      required this.hintText,
      required this.onChanged,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(top: 8.h, left: 12.w, right: 12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.h),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: SvgPicture.asset(
              AssetPath.map_search,
              width: 18.w,
            ),
          ),
          Expanded(
              child: CupertinoTextField.borderless(
            controller: controller,
            placeholder: hintText,
            maxLength: 30,
            placeholderStyle: Ts.regular15(AppColors.grey3),
            style: Ts.regular15(AppColors.black),
            onChanged: onChanged,
          ))
        ],
      ),
    );
  }
}
