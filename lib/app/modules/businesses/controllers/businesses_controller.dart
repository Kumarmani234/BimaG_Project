import 'package:bima_g/app/modules/businesses/model/business_item_list_model.dart';
import 'package:bima_g/app/modules/businesses/views/tabs/business_full_photo_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum BusinessListType { VERTICAL, HORIZONTAL }

class BusinessesController extends GetxController with StateMixin {
  String businessId = '';
  BusinessListItemModel businessListItemModel = BusinessListItemModel(
      name: 'Raj Girish Hospital',
      rating: '4.4',
      totalRating: '105',
      address: 'Gandhi Path, Vaishali Nagar, C1/27-29, ...',
      timing: 'Open 24 hours',
      phone: '9898989988',
      latitude: '35.567',
      longitude: '128.765',
      logo: 'https://picsum.photos/200/300');

  final tabIndex = 0.obs;

  final writeReviewRate = 3.0.obs;
  final sliverBackButtonColor = Colors.white.obs;

  List<String> listServices = [
    'Ambulance',
    'Emergency care',
    'Gastroenterology',
    'General check ups',
    'General surgery',
    'Laboratory',
    'Maternity Care'
  ];

  List<Widget> listPhotos = [
    Image.network('https://picsum.photos/200/300'),
    Image.network('https://picsum.photos/200'),
    Image.network('https://picsum.photos/id/237/200/300'),
    Image.network('https://picsum.photos/200/300'),
    Image.network('https://picsum.photos/200/300'),
    Image.network('https://picsum.photos/200'),
    Image.network('https://picsum.photos/id/237/200/300'),
    Image.network('https://picsum.photos/200/300')
  ];

  void setBusinessId(id) {
    this.businessId = id.toString();
  }

  @override
  void onInit() {
    super.onInit();
    change('', status: RxStatus.success());
  }

  onTabChange(index) => tabIndex.value = index;

  @override
  void onReady() {
    super.onReady();

    //Future.delayed(Duration(seconds: 2),()=>change('', status: RxStatus.error('error occurs')));
  }

  @override
  void onClose() {}

  void showBusinessFullPhotosDialog(BuildContext context, int imageIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: Get.height,
          width: Get.width,
          child: Dialog(
            elevation: 0,
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            child: BusinessFullPhotosTabView(imageIndex: imageIndex),
          ),
        );
      },
    );
  }
}
