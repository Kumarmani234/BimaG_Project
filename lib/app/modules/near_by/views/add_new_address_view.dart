part of 'near_by_view.dart';

class AddNewAddressView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: InsuranceAppbarView(
          title: 'add_new_Address'.tr,
          elevation: 0,
        ),
      ),
      body: Stack(
        children: [
          nearByController.getGoogleMap(),
          SearchBarView(
            onChanged: (val) {},
            controller: nearByController.searchNearbyCon,
            hintText: 'search_for_area'.tr,
          ),
          Align(
            child: BottomButton(
              text: 'enter_complete_address'.tr,
              onClick: () {
                CustomBottomSheet(
                        title: 'enter_address_details'.tr,
                        isScrollControlled: true)
                    .showBottomSheet(Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FetchAddressView(),
                      SizedBox(
                        height: 20.h,
                      ),
                      RoundSquareButtons.buttonEnabled(
                          onPressed: () {}, text: 'save_address'.tr)
                    ],
                  ),
                ));
              },
            ),
            alignment: Alignment.bottomCenter,
          )
        ],
      ),
    );
  }
}
