import 'dart:async';

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/near_by/views/near_by_view.dart';
import 'package:bima_g/app/modules/profile_address/model/ResGetAddress.dart';
import 'package:bima_g/app/modules/profile_address/views/add_new_address_form_view.dart';
import 'package:bima_g/utility/encrypt_shared_pref.dart';
import 'package:bima_g/utility/globals.dart';
import 'package:bima_g/utility/location_access.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class NearByController extends GetxController with StateMixin {
  //TODO: Implement NearByController

  TextEditingController searchNearbyCon = TextEditingController();
  TextEditingController searchAreaCon = TextEditingController();
  RxList<String> nearByCategories = <String>[].obs;
  RxList<UserAddress> savedAddressList = <UserAddress>[].obs;

  Rx<UserAddress>? savedAddress = UserAddress().obs;

  Rx<bool> addressExpanded = false.obs;

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  Rx<CameraPosition> _cameraPosition = CameraPosition(
    target: LatLng(currentLatitude, currentLongitude),
    zoom: 14.4746,
  ).obs;

  RxSet<Marker> _markers = <Marker>{}.obs;


  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void onInit() {
    change('',status: RxStatus.success());
    //change('',status: RxStatus.error('error occurs'));
    //change('',status: RxStatus.empty());

    super.onInit();
    fetchMyAddresses();
    fetchLocation();
    nearByCategories.clear();
    nearByCategories.add('All');
    nearByCategories.add('Covered');
    nearByCategories.add('Garages');
    nearByCategories.add('Hospitals');
    nearByCategories.add('Banks');

    //Future.delayed(Duration(seconds: 2),()=>change('',status: RxStatus.success()));
  }

  @override
  void onReady() {
    super.onReady();


  }

  @override
  void onClose() {}

  Widget getGoogleMap(){
    print('70-getGoogleMap');
    return Obx(() => GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _cameraPosition.value,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          //_controller.complete(controller);
        },
        onTap: changePinLocation ,
        markers: _markers,
        gestureRecognizers: Set()
          ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
          ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
          ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
          ..add(Factory<VerticalDragGestureRecognizer>(
                  () => VerticalDragGestureRecognizer())),

        zoomControlsEnabled: false
    ));
  }

  Future<void> changeCameraPosition(CameraPosition cameraPosition) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void fetchLocation() async {
    await LocationDataAccess().getLocationData();
    print('99 - nearby - $currentLatitude : $currentLongitude');
    _cameraPosition.value = CameraPosition(
      target: LatLng(currentLatitude, currentLongitude),
      zoom: 14.4746,
    );

    _markers.add(
        Marker(
          icon: BitmapDescriptor.defaultMarker,
          markerId: MarkerId('Home'),
          position: LatLng(currentLatitude, currentLongitude)
        )
    );

    _controller.future.then((mapController) => mapController.animateCamera(CameraUpdate.newLatLngZoom(LatLng(currentLatitude, currentLongitude), 14)));
  }


  void changePinLocation(LatLng latLng) {
    print('ontap called');
    _markers.clear();
    _markers.add(
        Marker(
            icon: BitmapDescriptor.defaultMarker,
            markerId: MarkerId('Home'),
            position: latLng
        )
    );
    _markers.refresh();
  }

  Future<void> fetchMyAddresses() async {
    savedAddressList.clear();
    String pincode = await sharedPrefs.getString(SharedPrefs.savedPincode);
    String addType = await sharedPrefs.getString(SharedPrefs.savedAddressType);

    savedAddressList.value =  await profileAddressController.fetchAddress();
    print('savedAddressList : ${savedAddressList.length}');
    if(savedAddressList.isEmpty){
      savedAddress!.value = UserAddress(
        addressId: 0,
        city: await sharedPrefs.getString(SharedPrefs.savedCity),
        streetAddress: await sharedPrefs.getString(SharedPrefs.savedStreetAddress),
        pincode: int.parse(pincode),
        addressType: addType.isNotEmpty ? int.parse(addType) : 1,
      );
    }else{
      String savedAddressId = await sharedPrefs.getString(SharedPrefs.savedAddressId);
      print('savedAddressId : $savedAddressId');
      if(savedAddressId.isNotEmpty){
        for(int i=0;i<savedAddressList.length;i++){
          savedAddressList[i].isSelected = false;
          print(savedAddressList[i].addressId.toString() + '----------' + savedAddressId);
          if(savedAddressList[i].addressId.toString() == savedAddressId){
            savedAddressList[i].isSelected = true;
            savedAddress!.value = savedAddressList[i];
          }
        }
      }else{
        savedAddressList[0].isSelected = true;
        savedAddress!.value = savedAddressList[0];
        await sharedPrefs.setString(SharedPrefs.savedAddressId, savedAddressList[0].addressId.toString());
      }

      savedAddressList.refresh();
    }

   /* savedAddressList.add(SavedAddress(state: 'Gujarat', addressType: 'Home', pincode: '382481', village: 'Sola', streetAddress: '302, Shayona Tilak, Sola', city: 'Ahmedabad', isSelected: true));
    savedAddressList.add(SavedAddress(state: 'Gujarat', addressType: 'Office', pincode: '382481', village: 'Sola', streetAddress: '302, Shayona Tilak, Sola', city: 'Ahmedabad'));
    savedAddressList.add(SavedAddress(state: 'Gujarat', addressType: 'Old Home', pincode: '382481', village: 'Sola', streetAddress: '302, Shayona Tilak, Sola', city: 'Ahmedabad'));
    savedAddress!.value = savedAddressList[0];*/
  }

  Future<void> onClickMyAddress(index) async {
    for(int j=0;j<savedAddressList.length;j++){
      savedAddressList[j].isSelected = false;
    }
    savedAddressList[index].isSelected = true;
    savedAddress!.value = savedAddressList[index];
    await sharedPrefs.setString(SharedPrefs.savedAddressId, savedAddressList[index].addressId.toString());
    savedAddressList.refresh();
  }

  addNewAddress() {
    Get.to(AddNewAddressFormView())!.then((value) => fetchMyAddresses());
  }

  onExpandAddressClick() {
    addressExpanded.value = !addressExpanded.value;
  }
}
