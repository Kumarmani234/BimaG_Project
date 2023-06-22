import 'dart:io';
import 'package:bima_g/app/enums.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/member_document/models/ReqManageDocuments.dart';
import 'package:bima_g/app/modules/member_document/models/ResGetDocumentTypeList.dart';
import 'package:bima_g/app/modules/member_document/models/ResGetDocuments.dart';
import 'package:bima_g/app/modules/member_document/views/tabsForm/add_new_document_form_view.dart';
import 'package:bima_g/utility/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../widgets/dialogs.dart';
import '../models/member_document_model.dart';
import '../views/member_document_preview_screen/aadhaar_card_preview.dart';
import '../views/member_document_preview_screen/driving_license_preview.dart';
import '../views/member_document_preview_screen/pan_card_preview.dart';
import '../views/member_document_preview_screen/vehicle_rc_preview.dart';

class MemberDocumentController extends GetxController {
  final count = 0.obs;

  RxList<DocumentModel> DocumentList = <DocumentModel>[].obs;
  RxList<Document> myDocumentList = <Document>[].obs;

  RxList<File> previewFiles = <File>[].obs;
  RxList<DocTypes> docTypeList = <DocTypes>[].obs;
  Rx<DocTypes> selectedDocType = DocTypes().obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController documentNoController = TextEditingController();

  String editDocUniqueID = '';

  Rx<ApiStatus> docListApiStatus = ApiStatus.Loading.obs;

  RefreshController docRefreshController =
      RefreshController(initialRefresh: false);

  @override
  void dispose() {
    documentNoController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    //addDocuments();
    getDocumentsTypes();
    getDocuments();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> addDocuments() async {
    if (memberDocumentController.formKey.currentState!.validate()) {
      if (memberDocumentController.previewFiles.isEmpty) {
        Get.snackbar('Document', 'Please upload document');
        return;
      }

      String base64Img = await Utils.encodeBase64Image(
          memberDocumentController.previewFiles.first);
      String docUniqueID =
          selectedDocType.value.documentTypeName!.replaceAll(' ', '') +
              '_' +
              Utils.randomText() +
              '_' +
              '${DateTime.now().day}' +
              '${DateTime.now().month}' +
              '${DateTime.now().year}';
      print(docUniqueID);

      ReqManageDocuments reqManageDocuments = ReqManageDocuments(
          documentBase64: base64Img,
          documentNumber: memberDocumentController.documentNoController.text,
          documentStatus: 1,
          documentTypeId: selectedDocType.value.documentTypeId.toString(),
          documentUniqueId:
              editDocUniqueID.isNotEmpty ? editDocUniqueID : docUniqueID);

      print('reqManageDocuments : ${reqManageDocuments.toJson()}');

      apiClientProvider
          .manageDocuments(reqManageDocuments.toJson())
          .then((response) async {
        // bool success = await apiClientProvider.checkStatus(response);
        if (response.body['code'] == 1) {
          getDocuments();
          Get.back();
        }
      });
    }
  }

  Future<void> openFilePicker() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      previewFiles.clear();
      previewFiles.addAll(files);
    } else {}
  }

  void deleteFile(File file) {
    previewFiles.remove(file);
    file.delete();
  }

  deleteMemberDocument() {
    Dialogs.showAlertDialog('Delete Member Document',
        subTitle: 'Are you sure you want to delete member document ?',
        leftButtonText: 'Cancel',
        rightButtonText: 'Delete', onRightButtonClick: () {
      print('on delete button clicked');
      Get.back();
    });
  }

  void onPolicyDocumentTap(String documentType) {
    if (documentType == 'Aadhaar Card') {
      Get.to(() => AadhaarCardPreview());
    } else if (documentType == 'Driving License') {
      Get.to(() => DrivingLicensePreview());
    } else if (documentType == 'PAN Card') {
      Get.to(() => PanCardPreview());
    } else if (documentType == 'Vehicles RC') {
      Get.to(() => VehicleRcPreview());
    }
  }

  void getDocuments() {
    docListApiStatus.value = ApiStatus.Loading;
    apiClientProvider.getDocuments().then((response) async {
      docListApiStatus.value = ApiStatus.Completed;
      // bool success = await apiClientProvider.checkStatus(response);
      if (response.body['code'] == 1) {
        ResGetDocuments resGetDocuments =
            ResGetDocuments.fromJson(response.body);
        myDocumentList.value = resGetDocuments.data!.documents ?? [];

        if (myDocumentList.isNotEmpty) {
          for (int i = 0; i < myDocumentList.length; i++) {
            String imageUrl = await Utils.createFileFromString(
                memberDocumentController.myDocumentList[i].documentBase64
                    .toString());
            print(imageUrl);
            myDocumentList[i].documentBase64 = imageUrl;
          }
          myDocumentList.refresh();
        } else {
          docListApiStatus.value = ApiStatus.EmptyData;
        }
      }
    });
  }

  void getDocumentsTypes() {
    apiClientProvider.getDocumentTypeList().then((response) async {
      // bool success = await apiClientProvider.checkStatus(response);
      if (response.body['code'] == 1) {
        docTypeList.value =
            ResGetDocumentTypeList.fromJson(response.body).data ?? [];
        selectedDocType.value = docTypeList[0];
        docTypeList.refresh();
      }
    });
  }

  onEditDocument(Document myDocumentList) async {
    editDocUniqueID = myDocumentList.documentUniqueId ?? '';
    for (int i = 0; i < docTypeList.length; i++) {
      if (docTypeList[i].documentTypeId == myDocumentList.documentTypeId) {
        selectedDocType.value = docTypeList[i];
      }
    }
    documentNoController.text = myDocumentList.documentNumber ?? '';
    previewFiles.clear();

    previewFiles.add(File(myDocumentList.documentBase64 ?? ''));
    Get.to(AddNewDocumentFormView());
  }

  addNewDocument() {
    editDocUniqueID = '';
    documentNoController.text = '';
    previewFiles.clear();
    Get.to(AddNewDocumentFormView());
  }

  onRefresh() {
    Future.delayed(Duration(seconds: 2));
    docRefreshController.refreshCompleted();

    getDocuments();
  }
}
