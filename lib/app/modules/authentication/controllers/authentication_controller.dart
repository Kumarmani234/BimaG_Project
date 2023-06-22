import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bima_g/app/enums.dart';
import 'package:bima_g/app/module_controllers.dart';
import 'package:bima_g/app/modules/authentication/model/ReqCheckPhoneExists.dart';
import 'package:bima_g/app/modules/authentication/model/ReqGetAuthenticationDetails.dart';
import 'package:bima_g/app/modules/authentication/model/ReqSignUpUser.dart';
import 'package:bima_g/app/modules/authentication/model/ReqVerifyPhoneNumber.dart';
import 'package:bima_g/app/modules/authentication/model/ResCheckPhoneExists.dart';
import 'package:bima_g/app/modules/authentication/model/ResGetAuthenticationDetails.dart';
import 'package:bima_g/app/modules/authentication/model/ResSignUpUser.dart';
import 'package:bima_g/app/modules/authentication/views/verifying_number_loading_view.dart';
import 'package:bima_g/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:bima_g/app/widgets/dialogs.dart';
import 'package:bima_g/main.dart';
import 'package:bima_g/utility/app_constants.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:truecaller_sdk/truecaller_sdk.dart';
import '../../../../utility/data_encryption.dart';
import '../../../../utility/encrypt_shared_pref.dart';
import '../../../../utility/utils.dart';
import '../../../routes/app_pages.dart';
import '../../profile/controllers/profile_controller.dart';
import '../../profile/views/profile_basic_details_form.dart';
import '../model/SystemInfoModel.dart';
import '../views/ask_mobile_view.dart';

class AuthenticationController extends GetxController {
  String userSelectedNumber = '';

  Rx<bool> acceptedTerms = false.obs,
      visibilityOfOtp = false.obs,
      loginPassVisibility = false.obs;
  Rx<ButtonStatus> askMobileButtonStatus = ButtonStatus.InActive.obs;
  final GlobalKey<FormState> mobileFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  Rx<TextEditingController> mobileNumCon = TextEditingController().obs;
  Rx<TextEditingController> passwordCon = TextEditingController().obs;
  Rx<TextEditingController> otpCon = TextEditingController().obs;

  RxBool isPasswordVisible = true.obs;

  Rx<int> otpCounter = 0.obs;
  Timer? timer, apiTimer;
  int periodicApiTime =
      0; // for sms verification increase after call api everytime
  StreamSubscription? streamSubscription;

  //AccessToken? _fbAccessToken;
  Map<String, dynamic>? facebookUserData;

  SystemInfoModel systemInfoModel = new SystemInfoModel();
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  bool varifyingPhoneNumber = true;

  @override
  void onInit() {
    super.onInit();
    print('onINit state :');
    initPlatformState();
  }

  @override
  void onReady() {
    super.onReady();
    print('onReady state :');
  }

  @override
  // void onClose() {
  //   if (streamSubscription != null) {
  //     streamSubscription!.cancel();
  //   }
  //   timer!.cancel();
  //   apiTimer!.cancel();
  // }

  verifySim() async {
    if (Platform.isAndroid) {
      const platform = MethodChannel('com.bimag.payg/sim_verification');
      try {
        final result = await platform.invokeMethod('getSimNumber');
        print('getSimNumber : ${result.toString()}');
        if (result.toString() != 'null') {
          mobileNumCon.value.text = result.toString().replaceAll('+91', '');
          userSelectedNumber = result.toString().replaceAll('+91', '');
          if (mobileNumCon.value.text.length > 0) {
            askMobileButtonStatus.value = ButtonStatus.Active;
          }
        }
      } on PlatformException catch (e) {}
    }
    return;
  }

  startCounter() {
    otpCounter.value = 30;
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (otpCounter.value == 0) {
        timer!.cancel();
      } else {
        otpCounter.value--;
      }
    });
  }

  Rx<GoogleSignInAccount>? _currentUser;
  Rx<String> contactText = ''.obs;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  /*trueCallerSignIn() async {

    ComingSoon();
    return;

    //Step 1: Initialize the SDK with SDK_OPTION_WITHOUT_OTP
    TruecallerSdk.initializeSDK(sdkOptions: TruecallerSdkScope.SDK_OPTION_WITHOUT_OTP);

    //Step 2: Check if SDK is usable on that device, otherwise fall back to any other alternative
    bool isUsable = await TruecallerSdk.isUsable;

    //Step 3: If isUsable is true, you can call getProfile to show consent screen to verify user's number
    isUsable ? TruecallerSdk.getProfile : Get.snackbar('Login', 'Truecaller not installed on your device', snackStyle: SnackStyle.FLOATING);

    //OR you can also replace Step 2 and Step 3 directly with this
    TruecallerSdk.isUsable.then((isUsable) {
      isUsable ? TruecallerSdk.getProfile : print("***Not usable***");
    });

    //Step 4: Be informed about the TruecallerSdk.getProfile callback result(success, failure, verification)
    streamSubscription = TruecallerSdk.streamCallbackData.listen((truecallerSdkCallback) {
      switch (truecallerSdkCallback.result) {
        case TruecallerSdkCallbackResult.success:
          String firstName = truecallerSdkCallback.profile!.firstName;
          String? lastName = truecallerSdkCallback.profile!.lastName;
          String phNo = truecallerSdkCallback.profile!.phoneNumber;
          print('firstName : $firstName');
          print('lastName : $lastName');
          print('phNo : $phNo');
          break;
        case TruecallerSdkCallbackResult.failure:
          int errorCode = truecallerSdkCallback.error!.code;
          print('error code truecaller : $errorCode');
          break;
        case TruecallerSdkCallbackResult.verification:
          print("Verification Required!!");
          break;
        default:
          print("Invalid result");
      }
    });
  }*/

  googleSignIn() async {
    ComingSoon();
    return;

    if (await _googleSignIn.isSignedIn()) {
      await _googleSignIn.disconnect();
    }
    print('google login  proceed');
    try {
      await _googleSignIn.signIn().then((GoogleSignInAccount? account) {
        print('onCurrentUserChanged : ${account!.email}');
      });
    } catch (error) {
      print('95====>' + error.toString());
    }
  }

  facebookSignIn() async {
    ComingSoon();
    return;
    //_checkIfIsLogged();

    print('facebook login ');
    final fb = FacebookLogin();

// Log in
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

    //print('----'+jsonEncode(res));

// Check result status
    switch (res.status) {
      case FacebookLoginStatus.success:
        // Logged in

        // Send access token to server for validation and auth
        final FacebookAccessToken accessToken = res.accessToken!;
        print('Access token: ${accessToken.token}');

        // Get profile data
        final profile = await fb.getUserProfile();
        print('Hello, ${profile!.name}! You ID: ${profile.userId}');

        // Get user profile image url
        final imageUrl = await fb.getProfileImageUrl(width: 100);
        print('Your profile image: $imageUrl');

        // Get email (since we request email permission)
        final email = await fb.getUserEmail();
        // But user can decline permission
        if (email != null) print('And your email is $email');

        break;
      case FacebookLoginStatus.cancel:
        // User cancel log in
        break;
      case FacebookLoginStatus.error:
        // Log in failed
        print('Error while log in: ${res.error}');
        break;
    }
  }

  String prettyPrint(Map json) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String pretty = encoder.convert(json);
    return pretty;
  }

  onOtpSend() async {
    if (askMobileButtonStatus != ButtonStatus.Active) {
      return;
    }
    askMobileButtonStatus.value = ButtonStatus.Loading;

    if (loginPassVisibility.value) {
      //need to login
      print('passowrd : ${Utils.encodeBase64(passwordCon.value.text)}');
      apiClientProvider
          .getAuthenticationDetails(ReqGetAuthenticationDetails(
                  phoneNumber: mobileNumCon.value.text,
                  password: Utils.encodeBase64(passwordCon.value.text))
              .toJson())
          .then((getAuthenticationDetailsRes) async {
        askMobileButtonStatus.value = ButtonStatus.Active;
        if (getAuthenticationDetailsRes.body['code'] == 0) {
          Dialogs.showInfoDialog('login'.tr,
              subTitle: getAuthenticationDetailsRes.body['message']);
          return;
        }

        //navigate is to dashboard if success
        //print(jsonEncode(getAuthenticationDetailsRes.body));
        ResGetAuthenticationDetails resGetAuthenticationDetails =
            ResGetAuthenticationDetails.fromJson(
                getAuthenticationDetailsRes.body);

        await sharedPrefs.setString(SharedPrefs.loginToken,
            resGetAuthenticationDetails.data.accessToken.toString());
        await sharedPrefs.setString(SharedPrefs.userName,
            resGetAuthenticationDetails.data.userName.toString());
        await sharedPrefs.setString(SharedPrefs.firstName,
            resGetAuthenticationDetails.data.firstName.toString());
        await sharedPrefs.setString(SharedPrefs.lastName,
            resGetAuthenticationDetails.data.lastName.toString());
        await sharedPrefs.setString(SharedPrefs.phoneNumber,
            resGetAuthenticationDetails.data.phoneNumber.toString());
        await sharedPrefs.setString(
            SharedPrefs.dob, resGetAuthenticationDetails.data.dob.toString());
        await sharedPrefs.setString(SharedPrefs.gender,
            resGetAuthenticationDetails.data.gender.toString());
        await sharedPrefs.setString(SharedPrefs.loginToken,
            resGetAuthenticationDetails.data.accessToken.toString());
        await sharedPrefs.setString(SharedPrefs.uniqueUserId,
            resGetAuthenticationDetails.data.uniqueUserId.toString());
        await sharedPrefs.setString(SharedPrefs.pincodeId,
            resGetAuthenticationDetails.data.pincodeId.toString());
        await sharedPrefs.setString(SharedPrefs.streetAddress,
            resGetAuthenticationDetails.data.streetAddress.toString());
        await sharedPrefs.setString(SharedPrefs.IS_LOGGED_IN, 'true');

        Utils.printLog(
            'first name : ${await sharedPrefs.getString(SharedPrefs.firstName)}');
        apiClientProvider.onInit();
        profileController.onReady();
        Get.offAllNamed(Routes.DASHBOARD);
        Get.delete<AuthenticationController>();
        authenticationController = Get.put(AuthenticationController());
        // profileController.getProfileDetails();
      });

      return;
    }

    if (!Utils.validateMobileNoIndia(mobileNumCon.value.text)) {
      Get.snackbar('login'.tr, 'invalid_entered_number'.tr);
      print('INVALID ENTERED NUMBER');

      return;
    }

    print('else----');
    //verifyMobileNumbFromSMS();

    apiClientProvider
        .checkPhoneExists(
            ReqCheckPhoneExists(phoneNumber: mobileNumCon.value.text).toJson())
        .then((value) {
      askMobileButtonStatus.value = ButtonStatus.Active;
      print('checkPhoneExists : ' + jsonEncode(value.body));
      ResCheckPhoneExists resCheckPhoneExists =
          ResCheckPhoneExists.fromJson(value.body);
      print('message : ' + resCheckPhoneExists.message);
      if (resCheckPhoneExists.code == 1) {
        //register as a new user
        profileController.MobileController.value.text =
            '+91 ' + mobileNumCon.value.text;
        Dialogs.showAlertDialog(
            'Your number is not assocate with us. please register your number.',
            rightButtonText: 'Register',
            leftButtonText: 'Cancel', onRightButtonClick: () {
          Get.back();
          verifyMobileNumbFromSMS(fromForgotPassword: false);
        });
        //Get.to(ProfileBasicDetailsFormView());
      } else {
        //visible password field
        print('otp sent');
        loginPassVisibility.value = true;
      }
    });
  }

  onVerifyOtp() async {
    await sharedPrefs.setString(SharedPrefs.IS_LOGGED_IN, 'true');
    Get.offAllNamed(Routes.DASHBOARD);
  }

  Future<void> initPlatformState() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    Map<String, dynamic> deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        String model = deviceData['model'];

        systemInfoModel.deviceId = deviceData['androidId'];
        systemInfoModel.deviceModel = model;
        systemInfoModel.deviceType = "Android";
        systemInfoModel.appVersion = '1.0';

        Utils.printLog('deviceId: ${deviceData['androidId']}');
        Utils.printLog('model: ${model}');
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        String model = deviceData['model'];
        String sdkVersion = _deviceData['systemVersion'] ?? '';

        systemInfoModel.deviceId = deviceData['identifierForVendor'];
        systemInfoModel.deviceModel = '${model}-${sdkVersion}';
        systemInfoModel.deviceType = "iOS";
        systemInfoModel.appVersion = '1.0';
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }
    _deviceData = deviceData;
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Future<void> verifyMobileNumbFromSMS({fromForgotPassword = false}) async {
    bool sendDirect = false;
    Map<Permission, PermissionStatus> statuses =
        await [Permission.sms].request();
    PermissionStatus? smsStatus = statuses[Permission.sms];
    if (smsStatus != null && smsStatus.isGranted) {
      sendDirect = true;
    } else {
      sendDirect = false;
    }
    processSMS(sendDirect, fromForgotPassword: fromForgotPassword);
  }

  void processSMS(bool sendDirect, {fromForgotPassword = false}) async {
    String encryptedMessage = DataEncrypt.encryptSMS(
        mobileNumber: authenticationController.mobileNumCon.value.text
            .replaceAll('+91 ', '')
            .toString(),
        //mobileNumber: '6352714264',
        appId: 'BimaG',
        deviceId: systemInfoModel.deviceId,
        platform: systemInfoModel.deviceType,
        verificationType:
            fromForgotPassword ? 'ForgetPassword' : 'Registration');
    Utils.printLog('--encryptedMessage--' + encryptedMessage);

    List<String> recipients = [];
    recipients.add(AppConstant.RECIPIENT_MOBILE_NUMBER);

    sendSMSToServer(recipients, encryptedMessage, sendDirect).then((response) {
      if (response != null) {
        Utils.printLog('-----$response');
        if (response == 'cancelled') {
          Get.to(VerifyingNumberLoadingView());
          Utils.printLog("Sorry, Unable to verify");
          Get.back();
        } else {
          varifyingPhoneNumber = true;
          Get.to(VerifyingNumberLoadingView());
          callPeriodicApi(fromForgotPassword: fromForgotPassword);
        }

        //verify number from api
        //verifyOTP(loginMobileCon.text.toString(), "");
      } else {
        Get.to(VerifyingNumberLoadingView());
        Future.delayed(Duration(seconds: 2), () {
          Utils.printLog("Sorry, Unable to verify");
          Get.back();
        });
      }
      // startCounter();
      // Get.to(OtpVerificationView());
    });
  }

  callPeriodicApi({fromForgotPassword = false}) {
    apiTimer = Timer.periodic(
        Duration(seconds: 5),
        (Timer t) =>
            verifyPhoneNumberAPI(fromForgotPassword: fromForgotPassword));
  }

  verifyPhoneNumberAPI({fromForgotPassword = false}) {
    print(periodicApiTime.toString());
    if (periodicApiTime > 5) {
      periodicApiTime = 0;
      apiTimer!.cancel();
      Get.back();
      return;
    }
    periodicApiTime++;

    //forgot pass
    //on send sms
    //"verificationType":1 //1 : Registration 2: ForgotPassword

    print(
        "verify phone  : ${authenticationController.mobileNumCon.value.text.replaceAll('+91 ', '')}");
    print(ReqVerifyPhoneNumber(
            phoneNumber: authenticationController.mobileNumCon.value.text
                .replaceAll('+91 ', ''),
            verificationType: fromForgotPassword ? 2 : 1)
        .toJson());
    apiClientProvider
        .verifyPhoneNumber(ReqVerifyPhoneNumber(
                phoneNumber: authenticationController.mobileNumCon.value.text
                    .replaceAll('+91 ', ''),
                verificationType: fromForgotPassword ? 2 : 1)
            .toJson())
        .then((responseVerifyPhoneNumber) {
      print(
          'verifyPhoneNumber : ' + jsonEncode(responseVerifyPhoneNumber.body));
      if (responseVerifyPhoneNumber.body['code'] == 1) {
        Get.back();
        apiTimer!.cancel();
        periodicApiTime = 0;
        if (!fromForgotPassword) {
          profileController.UserNameController.value.clear();
          profileController.LastNameController.value.clear();
          profileController.EmailController.value.clear();
          profileController.BirthDateController.value.clear();
          profileController.passwordCon.clear();
          profileController.confirmPasswordCon.clear();
          fetchAddressController.pincodeCon.clear();
          fetchAddressController.streetAddressCon.clear();
          Get.to(ProfileBasicDetailsFormView());
        } else {
          Get.to(ForgotPasswordView(
              phone: authenticationController.mobileNumCon.value.text
                  .replaceAll('+91 ', '')));
        }
      }
    });
  }

  Future<String?> sendSMSToServer(
      List<String> recipients, String encryptedMessage, bool sendDirect) async {
    try {
      String result = await sendSMS(
        message: encryptedMessage,
        recipients: recipients,
        sendDirect: sendDirect,
      );

      print(result);
      return result;
    } catch (error) {
      print(error.toString());
      print(error.toString());
    }
    return null;
  }

  /*onSubmitBasicDetails() {
    print(Utils.encodeBase64(profileController.passwordCon.text));
    if(!kDebugMode){
      Get.toNamed(Routes.DASHBOARD);
    }else{
      if (profileController.profileFormKey.currentState!.validate()) {

        if(varifyingPhoneNumber){
          verifyMobileNumbFromSMS();
          return;
        }

        //39420 - pincodeId
        //09/13/1995
        print('dob : ${Utils.dbDate(profileController.selectedDate.value!)}');
        String dobs  = Utils.dbDate(profileController.selectedDate.value!);

        ReqSignUpUser reqSignUpUser = ReqSignUpUser(
            phoneNumber: profileController.MobileController.value.text.replaceAll('+91 ', ''),
            countryCode: '+91', name: profileController.UserNameController.value.text + ' ' +profileController.LastNameController.value.text,
            firstName: profileController.UserNameController.value.text,
            lastName: profileController.LastNameController.value.text,
            userEmail: profileController.EmailController.value.text,
            streetAddress: fetchAddressController.streetAddressCon.text,
            pincodeId: 39420,
            gender: profileController.genderValue!.value.key,
            dob: '$dobs',
            passcode: Utils.encodeBase64(profileController.passwordCon.text)
        );

        print(jsonEncode(reqSignUpUser));
        apiClientProvider.signUpUser(reqSignUpUser.toJson()).then((value) => print(jsonEncode(value.body)));
      }
    }
  }*/

  onSubmitBasicDetails() {
    if (profileController.profileFormKey.currentState!.validate()) {
      //39420 - pincodeId
      //09/13/1995
      print('dob : ${Utils.dbDate(profileController.selectedDate.value!)}');
      String dobs123 = Utils.dbDate(profileController.selectedDate.value!);
      print('dobcs  ' + dobs123);
      print('address id : ${fetchAddressController.selectedPincode}');

      ReqSignUpUser reqSignUpUser = ReqSignUpUser(
          phoneNumber: authenticationController.mobileNumCon.value.text
              .replaceAll('+91 ', ''),
          countryCode: '+91',
          userName: profileController.UserNameController.value.text +
              ' ' +
              profileController.LastNameController.value.text,
          firstName: profileController.UserNameController.value.text,
          lastName: profileController.LastNameController.value.text,
          userEmail: profileController.EmailController.value.text,
          streetAddress: fetchAddressController.streetAddressCon.text,
          pincodeId: fetchAddressController.selectedPincode ?? 0,
          gender: profileController.selectedBasicProfileGender,
          dob: dobs123.toString(),
          passcode: Utils.encodeBase64(profileController.passwordCon.text));
      print(jsonEncode(reqSignUpUser.toJson()));
      apiClientProvider.signUpUser(reqSignUpUser.toJson()).then((value) async {
        // bool success = await apiClientProvider.checkStatus(value);
        if (value.body['code'] == 1) {
          //paste data here
          ResSignUpUser resGetAuthenticationDetails =
              ResSignUpUser.fromJson(value.body);
          await sharedPrefs.setString(SharedPrefs.loginToken,
              resGetAuthenticationDetails.data!.accessToken.toString());
          await sharedPrefs.setString(SharedPrefs.userName,
              resGetAuthenticationDetails.data!.userName.toString());
          await sharedPrefs.setString(SharedPrefs.firstName,
              resGetAuthenticationDetails.data!.firstName.toString());
          await sharedPrefs.setString(SharedPrefs.lastName,
              resGetAuthenticationDetails.data!.lastName.toString());
          await sharedPrefs.setString(SharedPrefs.phoneNumber,
              resGetAuthenticationDetails.data!.phoneNumber.toString());
          await sharedPrefs.setString(SharedPrefs.dob,
              resGetAuthenticationDetails.data!.dob.toString());
          await sharedPrefs.setString(SharedPrefs.gender,
              resGetAuthenticationDetails.data!.gender.toString());
          await sharedPrefs.setString(SharedPrefs.loginToken,
              resGetAuthenticationDetails.data!.accessToken.toString());
          await sharedPrefs.setString(SharedPrefs.uniqueUserId,
              resGetAuthenticationDetails.data!.uniqueUserId.toString());
          await sharedPrefs.setString(SharedPrefs.IS_LOGGED_IN, 'true');
          apiClientProvider.onInit();

          profileController.onReady();
          Get.offAllNamed(Routes.DASHBOARD);
          homepageController.appBarTitle = 'welcome';
          Get.delete<AuthenticationController>();
          authenticationController = Get.put(AuthenticationController());
          profileController.getProfileDetails();
          /*Get.delete<AuthenticationController>();
          authenticationController = Get.put(AuthenticationController());
          homepageController.appBarTitle = 'welcome';
          profileController.getProfileDetails();
          Get.offAllNamed(Routes.DASHBOARD);*/
        }
      });
    }
  }

  void showVerifyingBottomSheet() {
    bool isLoadingApis = true;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12.h),
                topLeft: Radius.circular(12.h))),
        context: Get.context!,
        builder: (ctx) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(40.0),
                  child: CupertinoActivityIndicator(
                    radius: 20,
                  ),
                ),
                Text('Verifing')
              ],
            ));

    apiClientProvider
        .verifyPhoneNumber(ReqVerifyPhoneNumber(
            phoneNumber: authenticationController.mobileNumCon.value.text
                .replaceAll('+91 ', '')))
        .then((responseVerifyPhoneNumber) {
      print(
          'verifyPhoneNumber : ' + jsonEncode(responseVerifyPhoneNumber.body));
      Get.back();
    });
  }

  navigateToTermsConditions() {
    //https://bimag.in/terms-of-use
    Utils.launchURL('https://bimag.in/terms-of-use');
  }

  navigateToPrivacyPolicy() {
    //https://bimag.in/privacy-policy
    Utils.launchURL('https://bimag.in/privacy-policy');
  }

  onLoginClick() {
    if (!acceptedTerms.value) {
      HapticFeedback.mediumImpact();
      Get.snackbar(
          'Login', 'Please accept terms & conditions and our privacy policy');
      return;
    }

    Get.to(AskMobileView());
    verifySim();
    /*Get.delete<AuthenticationController>();
    authenticationController =
        Get.put(AuthenticationController());*/
  }

  onForgotPassClick() {
    verifyMobileNumbFromSMS(fromForgotPassword: true);
    //Get.to(ForgotPasswordView());
  }
}
