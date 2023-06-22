// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'dart:typed_data';

import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/utility/encrypt_shared_pref.dart';
import 'package:bima_g/utility/utils.dart';
import 'package:cropperx/cropperx.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicUpdateController extends GetxController {
  final cropperKey = GlobalKey(debugLabel: 'cropperKey');
  final ImagePicker picker = ImagePicker();
  final originalImageBytes = Rxn<Uint8List>();
  final selectedImageFile = Rx<File?>(null);

  RxList<int> croppedImageBytes = <int>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImageFile.value = File(pickedFile.path);
    }
  }

  Future<void> getImageFromCamera() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedFile != null) {

      selectedImageFile.value = File(pickedFile.path);
    }
  }

  onChooseFile() async {
    if(selectedImageFile.value == null){
      Get.snackbar('Profile', 'Please select profile image');
      return;
    }
    var a = await Cropper.crop(
      cropperKey: cropperKey,
    );
    if (a != null) {
      if (kIsWeb) {
        // Handle cropped image bytes for web
      } else {
        final builder = BytesBuilder();
        builder.add(a);
        croppedImageBytes.value = builder.toBytes();
        String base64 = await Utils.encodeBase64Image(selectedImageFile.value!);
        apiClientProvider.manageProfileImage(base64).then((value) async {
          print('manageProfileImage : ${value.body}');
          Get.back();
          bool success = await apiClientProvider.checkStatus(value);
          if(success){
            profileController.getProfileDetails(updateAPI: true);

          }
        });

      }
    }
  }
}
