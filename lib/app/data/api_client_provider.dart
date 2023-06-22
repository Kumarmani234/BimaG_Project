import 'dart:convert';

import 'package:bima_g/utility/encrypt_shared_pref.dart';
import 'package:bima_g/utility/utils.dart';
import 'package:get/get.dart';

import '../modules/policies/views/offline_policies_view.dart';
import '../widgets/dialogs.dart';

class ApiClientProvider extends GetConnect {
  static const String CheckPhoneExists = 'mobile/CheckPhoneExists';
  static const String ValidateOTP = 'mobile/ValidateOTP';
  static const String SignUpUser = 'mobile/SignUpUser';
  static const String GetAuthenticationDetails =
      'mobile/GetAuthenticationDetails';
  static const String Policies = 'mobile/Policies';
  static const String GetQuoteDetails = 'mobile/GetQuoteDetails';
  static const String CreatePolicy = 'mobile/CreatePolicy';
  static const String GetLanguageLabels = 'mobile/GetLanguageLabels';
  static const String GetAddressByPincode = 'mobile/GetAddressByPincode';
  static const String VerifyPhoneNumber = 'mobile/VerifyPhoneNumber';
  static const String VerifyVehicleDetails = 'mobile/VerifyVehicleDetails';
  static const String Cities = 'mobile/Cities';
  static const String GetVehicleCompanyList = 'mobile/GetVehicleCompanyList';
  static const String GetVehicleModelList = 'mobile/GetVehicleModelList';
  static const String GetVehicleVariantList = 'mobile/GetVehicleVariantList';
  static const String States = 'mobile/States';
  static const String Districts = 'mobile/Districts';
  static const String GetCityRTO = 'mobile/GetCityRTO';
  static const String GetPolicyCities = 'mobile/GetPolicyCities';
  static const String ManageFamilyMembers = 'mobile/ManageFamilyMembers';
  static const String GetFamilyMembers = 'mobile/GetFamilyMembers';
  static const String ManageVehicle = 'mobile/ManageVehicle';
  static const String GetVehicles = 'mobile/GetVehicles';
  static const String ManageProperty = 'mobile/ManageProperty';
  static const String GetProperties = 'mobile/GetProperties';
  static const String GetDocumentTypeList = 'mobile/GetDocumentTypeList';
  static const String GetAddress = 'mobile/GetAddress';
  static const String ManageAddress = 'mobile/ManageAddress';
  static const String GetDocuments = 'mobile/GetDocuments';
  static const String ManageDocuments = 'mobile/ManageDocuments';

  static const String GetAppVersion = 'mobile/GetAppVersion';
  static const String ManageProfileImage = 'mobile/ManageProfileImage';
  static const String GetUserProfile = 'mobile/GetUserProfile';
  static const String EditUserProfile = 'mobile/EditUserProfile';
  static const String ForgotPassword = 'mobile/ForgotPassword';

  static const String InsuranceSlider = 'mobile/InsuranceSlider';



  Future<bool> checkStatus(Response<dynamic> data,
      {wantToShowDialog = true}) async {
    bool internetAvailable = await Utils.isInternetAvailable();
    if (!internetAvailable) {
      Dialogs.showInfoDialog('No Internet Connection');
      return false;
    }

    //print('checkStatus : ${jsonEncode(data.body)}');
    print('api : ${data.request!.url.path}');
    int statusCode = data.statusCode ?? 0;
    print(' my status code ' + statusCode.toString());
    if (statusCode == 401) {
      //unauthorized
      //logout it
      //need to ask regenrate or relogin
      Dialogs.showLogoutDialog();
      return false;
    }

    if (statusCode == 500) {
      Dialogs.showInfoDialog('Internal Server Error');
      return false;
    }
    if (data.status.connectionError) {
      if (await Utils.isInternetAvailable()) {
        Dialogs.showInfoDialog('No Internet Connection');
      } else {
        Dialogs.showInfoDialog('Something went wrong');
      }
      return false;
    }

    int responseCode = data.body['code'];

    if (data.body['code'] == 0) {
      if (wantToShowDialog) {}
      Dialogs.showInfoDialog(data.body['message']);
      return false;
    }

    return true;
  }

  @override
  void onInit() {
    //staging uat
    httpClient.baseUrl = 'https://api.bimag.in/portalapi/api/';
    //production
    //httpClient.baseUrl = 'https://stagingadmin.myrajasthanclub.com/api/';
    httpClient.timeout = Duration(seconds: 120);
    httpClient.addRequestModifier<dynamic>((request) async {
      String login_token = await sharedPrefs.getString(SharedPrefs.loginToken);
      print('logintoken=>' + login_token);
      // Set the header
      request.headers['Authorization'] = "Bearer $login_token";
      request.headers['Content-Type'] = "application/json";
      request.headers['Accept'] = "application/json";
      return request;
    });

    super.onInit();
  }

  /*@override
  Future<Response<dynamic>> getProfile() => get(getprofile);*/

  @override
  Future<Response<dynamic>> checkPhoneExists(body) =>
      post(CheckPhoneExists, body);

  @override
  Future<Response<dynamic>> getLanguageLabels(req) =>
      get(GetLanguageLabels, query: req);

  @override
  Future<Response<dynamic>> getAddressByPincode(req) =>
      get(GetAddressByPincode, query: req);

  @override
  Future<Response<dynamic>> getAuthenticationDetails(body) =>
      post(GetAuthenticationDetails, body);

  @override
  Future<Response<dynamic>> signUpUser(body) => post(SignUpUser, body);

  @override
  Future<Response<dynamic>> verifyPhoneNumber(body) =>
      post(VerifyPhoneNumber, body);

  @override
  Future<Response<dynamic>> verifyVehicleDetails(req) =>
      get(VerifyVehicleDetails, query: req);

  @override
  Future<Response<dynamic>> getQuoteDetails(body) =>
      post(GetQuoteDetails, body);

  @override
  Future<Response<dynamic>> cities(district) =>
      get(Cities, query: {"districtName": district});

  @override
  Future<Response<dynamic>> getVehicleCompanyList(name, type) =>
      post(GetVehicleCompanyList, {"name": name, "type": type});

  @override
  Future<Response<dynamic>> getVehicleModelList(id, {name = ''}) =>
      post(GetVehicleModelList, {"Id": id, "Name": name});

  @override
  Future<Response<dynamic>> getVehicleVariantList(id, {name = ''}) =>
      post(GetVehicleVariantList, {"Id": id, "Name": name});

  @override
  Future<Response<dynamic>> states() => get(States);

  @override
  Future<Response<dynamic>> districts(stateName) =>
      get(Districts, query: {"stateName": stateName});

  @override
  Future<Response<dynamic>> getPolicyCities(cityName) =>
      get(GetPolicyCities, query: {"cityName": cityName});

  @override
  Future<Response<dynamic>> getCityRTO(cityName) =>
      get(GetCityRTO, query: {"cityName": cityName});

  @override
  Future<Response<dynamic>> manageFamilyMembers(data) =>
      post(ManageFamilyMembers, data);

  @override
  Future<Response<dynamic>> getFamilyMembers() => get(GetFamilyMembers);

  @override
  Future<Response<dynamic>> manageDocuments(data) =>
      post(ManageDocuments, data);

  @override
  Future<Response<dynamic>> getDocuments() => post(GetDocuments, {});

  @override
  Future<Response<dynamic>> getVehicles() => get(GetVehicles);

  @override
  Future<Response<dynamic>> getProperties() => get(GetProperties);

  @override
  Future<Response<dynamic>> manageVehicle(data) => post(ManageVehicle, data);

  @override
  Future<Response<dynamic>> manageProperty(data) => post(ManageProperty, data);

  @override
  Future<Response<dynamic>> getAddress() => get(GetAddress);

  @override
  Future<Response<dynamic>> manageAddress(data) => post(ManageAddress, data);

  @override
  Future<Response<dynamic>> getDocumentTypeList() => get(GetDocumentTypeList);

  @override
  Future<Response<dynamic>> getAppVersion(platform) =>
      get(GetAppVersion, query: {"platform": platform});

  @override
  Future<Response<dynamic>> manageProfileImage(data) =>
      post(ManageProfileImage, {"ProfileImage": data.toString()});

  @override
  Future<Response<dynamic>> getUserProfile() => get(GetUserProfile);

  @override
  Future<Response<dynamic>> editUserProfile(data) =>
      post(EditUserProfile, data);

  @override
  Future<Response<dynamic>> forgotPassword(phone, password) =>
      post(ForgotPassword, {"phoneNumber": phone, "password": password});

  @override
  Future<Response<dynamic>> createPolicy(data) => post(CreatePolicy, data);

  @override
  Future<Response<dynamic>> insuranceSlider(insuranceTypeId) =>
      get(InsuranceSlider, query: {"insuranceTypeId": insuranceTypeId.toString()});
}

//requests
/*LoginReq loginReq = LoginReq(
    username: phoneCon.text,
    password: passCon.text,
    country_code: '+91'
);*/
