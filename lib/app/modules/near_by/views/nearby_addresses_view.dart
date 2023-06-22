part of 'near_by_view.dart';

class NearbyAddressesView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black.withOpacity(0.5),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  color: AppColors.white),
              margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.w, bottom: 10.h),
              child: ListView(
                key: Key('list_key'),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    margin: EdgeInsets.only(top:12.w, bottom: 12.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.w),
                        color: AppColors.white),
                    child: Obx(() => Column(
                      children: [
                        for (int i = 0;
                        i < nearByController.savedAddressList.length;
                        i++)
                          AddressView(
                            savedAddress: nearByController.savedAddressList[i],
                            onChange: () => nearByController.onClickMyAddress(i),
                          ),
                      ],
                    )),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  color: AppColors.white),
              margin: EdgeInsets.only(left: 12.w, right: 12.w),
              padding: EdgeInsets.all(6.w),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(6.w),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: InkWell(
                  onTap: ()=>nearByController.addNewAddress(),
                  child: Row(
                    key: Key('add_address_key'),
                    children: [
                      Text(
                        'add_new_Address'.tr,
                        style: Ts.regular15(AppColors.primaryColor),
                      ),
                      Spacer(),
                      Icon(
                        Icons.add_circle_outline,
                        color: AppColors.primaryColor,
                        size: 19,
                      )
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 50.h,)
          ],
        ),
      ),
    );
  }
}

class AddressView extends StatelessWidget {
  UserAddress savedAddress;
  final onChange;

  AddressView({required this.savedAddress, required this.onChange, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('AddressView : ${savedAddress.isSelected}');
    return Column(
      children: [
        ListTile(
          dense: true,
          title: Text(Utils.getAddressType(savedAddress.addressType ?? 1),
              style: Ts.semiBold17(AppColors.black)),
          subtitle: Text(
              savedAddress.streetAddress.toString().capitalize.toString() +
                  ' ' +
                  savedAddress.city.toString().capitalize.toString() +
                  ' ' +
                  savedAddress.pincode.toString(),
              style: Ts.regular13(AppColors.black)),
          trailing: RoundCheckBox(
            key: Key('rounded_check_box_key'),
              onChange: onChange, isChecked: savedAddress.isSelected),
        ),
        Divider()
      ],
    );
  }
}
