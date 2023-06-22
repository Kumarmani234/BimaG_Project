import 'dart:convert';

import 'package:bima_g/app/data/models/ResNameIdList.dart';
import 'package:bima_g/app/enums.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/fetch_address/controllers/fetch_address_controller.dart';
import 'package:bima_g/app/modules/profile_address/model/ReqManageAddress.dart';
import 'package:bima_g/app/modules/profile_address/model/ResGetAddress.dart';
import 'package:bima_g/app/modules/profile_address/views/add_new_address_form_view.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../utility/encrypt_shared_pref.dart';
import '../../../../utility/globals.dart';
import '../../../../utility/utils.dart';
import '../../../widgets/dialogs.dart';

/*{
    "addressId":130,
    "addressType":1,  /*    Home = 1,
        Work = 2,
        Billing = 3,
        Shipping = 4,
        Mailing = 5,
        Other = 6 */
    "streetAddress":"7146 Goreway Dr",
    "PincodeId":38726
}*/

class ProfileAddressController extends GetxController {
  Rx<ApiStatus> getAddressStatus = ApiStatus.Loading.obs;
  RxList<ResNameIdList> addressTypeList = <ResNameIdList>[].obs;
  RxList<UserAddress> addressMemberList = <UserAddress>[].obs;

  ResNameIdList selectedAddressType = ResNameIdList();
  Rx<ButtonStatus> saveButtonStatus = ButtonStatus.Active.obs;

  int editAddressId = 0;

  RefreshController addressRefreshController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    addAddressType();
    fetchAddress();
    userName = await sharedPrefs.getString(SharedPrefs.firstName) +
        ' ' +
        await sharedPrefs.getString(SharedPrefs.lastName);
  }

  @override
  void onClose() {}

  Future<RxList<UserAddress>> fetchAddress() async {
    getAddressStatus.value = ApiStatus.Loading;
    await apiClientProvider.getAddress().then((response) async {
      getAddressStatus.value = ApiStatus.Completed;
      // bool success = await apiClientProvider.checkStatus(response,
      //     wantToShowDialog: false);
      Utils.printLog(jsonEncode(response.body));
      getAddressStatus.value = ApiStatus.EmptyData;
      if (response.body['code'] == 1) {
        addressMemberList.value =
            ResGetAddress.fromJson(response.body).data!.userAddresses ?? [];
        addressMemberList.refresh();

        return addressMemberList;
      }
    });
    return addressMemberList;
  }

  void addAddressType() {
    addressTypeList.add(ResNameIdList(name: 'Home', id: '1'));
    addressTypeList.add(ResNameIdList(name: 'Work', id: '2'));
    addressTypeList.add(ResNameIdList(name: 'Billing', id: '3'));
    addressTypeList.add(ResNameIdList(name: 'Shipping', id: '4'));
    addressTypeList.add(ResNameIdList(name: 'Mailing', id: '5'));
    addressTypeList.add(ResNameIdList(name: 'Other', id: '6'));

    selectedAddressType = addressTypeList[0];
    addressTypeList.refresh();
  }

  void addEditAddress() {
    if (saveButtonStatus.value == ButtonStatus.Loading) {
      return;
    }
    saveButtonStatus.value = ButtonStatus.Loading;
    print(
        'editAddressId : $editAddressId ------ ${selectedAddressType.id.toString()}');
    ReqManageAddress reqManageAddress = ReqManageAddress(
        addressId: editAddressId,
        addressType: int.parse(selectedAddressType.id.toString()),
        pincodeId: fetchAddressController.selectedPincode,
        streetAddress: fetchAddressController.streetAddressCon.text);
    print(jsonEncode(reqManageAddress));
    apiClientProvider
        .manageAddress(reqManageAddress.toJson())
        .then((response) async {
      saveButtonStatus.value = ButtonStatus.Active;

      // bool success = await apiClientProvider.checkStatus(response);
      if (response.body['code'] == 1) {
        fetchAddress();
        Get.back();
      }
    });
  }

  onEditAddress(UserAddress addressMemberList) async {
    print(jsonEncode(addressMemberList));
    editAddressId = addressMemberList.addressId ?? 0;
    for (int i = 0; i < addressTypeList.length; i++) {
      if (addressTypeList[i].id == addressMemberList.addressType.toString()) {
        selectedAddressType = addressTypeList[i];
      }
    }
    Get.delete<FetchAddressController>();
    fetchAddressController = Get.put(FetchAddressController());
    Get.to(AddNewAddressFormView());
    await Future.delayed(Duration(milliseconds: 300), () async {
      fetchAddressController.pincodeCon.text =
          addressMemberList.pincode.toString();
      fetchAddressController.streetAddressCon.text =
          addressMemberList.streetAddress ?? '';
      fetchAddressController.selectedPincode = addressMemberList.pincodeId;
    });
  }

  deleteAssets() {
    Dialogs.showAlertDialog('Delete Address',
        subTitle: 'Are you sure you want to delete address ?',
        leftButtonText: 'Cancel',
        rightButtonText: 'Delete', onRightButtonClick: () {
      print('on delete button clicked');
      Get.back();
    });
  }

  onRefresh() {
    Future.delayed(Duration(seconds: 2),
        () => addressRefreshController.refreshCompleted());

    fetchAddress();
  }
}
