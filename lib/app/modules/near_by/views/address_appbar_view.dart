part of 'near_by_view.dart';

class AddressAppbarView extends GetView {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 3,
      leading: Padding(
        padding: EdgeInsets.only(left: 15.w),
        child: SvgPicture.asset(AssetPath.map_pin),
      ),
      leadingWidth: 35.w,
      title:Text(''),
      // Obx(() => Column(
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: [
      //     Text(nearByController.savedAddress != null ? Utils.getAddressType(nearByController.savedAddress!.value.addressType ?? 1) : '', style: Ts.semiBold17(AppColors.black)),
      //     Text(nearByController.savedAddress != null ? (nearByController.savedAddress!.value.streetAddress!.capitalize.toString() + ', ' + nearByController.savedAddress!.value.city.toString().capitalize.toString() + ' - ' + nearByController.savedAddress!.value.pincode.toString()) : '', style: Ts.regular13(AppColors.black)),
      //   ],
      // )),
      actions: [
        IconButton(
          key: Key('drop_down_key'),
            onPressed: ()=>nearByController.onExpandAddressClick(), icon: Obx(() => RotatedBox(
          quarterTurns: nearByController.addressExpanded.value ? 90 : 0,
          child: SvgPicture.asset(AssetPath.down_arrow),
        ))
        )
      ],
      centerTitle: false,
    );
  }
}
