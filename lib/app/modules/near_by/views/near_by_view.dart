import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/profile_address/model/ResGetAddress.dart';
import 'package:bima_g/app/widgets/bottomsheet.dart';
import 'package:bima_g/utility/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../utility/asset_paths.dart';
import '../../../../utility/colors.dart';
import '../../../../utility/ts.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/checkboxes.dart';
import '../../businesses/views/businesses_view.dart';
import '../../fetch_address/views/fetch_address_view.dart';
import '../../insurance_appbar/views/insurance_appbar_view.dart';
import '../controllers/near_by_controller.dart';
part 'search_bar_view.dart';
part 'address_appbar_view.dart';
part 'nearby_categories_view.dart';
part 'nearby_addresses_view.dart';
part 'add_new_address_view.dart';

class NearByView extends GetView<NearByController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AddressAppbarView(),
        preferredSize: Size.fromHeight(70.h),
      ),
      body: nearByController.obx(
        (state) => Stack(
          children: [
            nearByController.getGoogleMap(),
            Column(
              children: [
                SearchBarView(
                  controller: nearByController.searchNearbyCon,
                  hintText: 'search_nearby'.tr,
                  onChanged: (val) {},
                ),
                NearbyCategoriesView()
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BusinessListView(),
            ),
            Obx(
              () => nearByController.addressExpanded.value
                  ? NearbyAddressesView()
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}
