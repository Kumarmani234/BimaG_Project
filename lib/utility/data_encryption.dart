import 'dart:convert';

import 'package:bima_g/utility/utils.dart';
import 'package:encrypt/encrypt.dart';

// var str =this.UserName+"|"+this.passCode.value;//+":"+this.enval;
// alert(str);
// var key = CryptoJS.enc.Utf8.parse(environment.SecretKey);
// var  iv = CryptoJS.enc.Utf8.parse(environment.SecretKey);
// var encrypted = CryptoJS.AES.encrypt(CryptoJS.enc.Utf8.parse(JSON.stringify(str)), key, {
//   keySize: 128 / 8,
//   iv:iv,
//   mode: CryptoJS.mode.CBC,
//   padding: CryptoJS.pad.Pkcs7
// });

class DataEncrypt {
  static String encryptData(String userName, String password) {
    Utils.printLog('========Inside encrypt data=======');
    String plainText = '"' + userName + '|' + password + '"';
    final secureKey = "4512631236589784";
    final key = Key.fromUtf8(secureKey);
    final iv = IV.fromUtf8(secureKey);
    final encrypter = Encrypter(AES(
      key,
      mode: AESMode.cbc,
    ));

    final encrypted = encrypter.encrypt(plainText, iv: iv);

    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    Utils.printLog('Plain Text: $plainText');
    // Utils.printLog('Decrypted Text: $decrypted');
    // print(encrypted.bytes);
    // Utils.printLog(encrypted.base16);
    // Utils.printLog(encrypted.base64);
    Utils.printLog('========Inside encryption done=======');
    return (encrypted.base64);
  }

  // var str ="MO:"+"8234233333"+"|"+"OTP:"+"66078"+"|"+"APP:"+"1"+"|"+"DID:"+"746746"+"|"+"P:"+"IOS";
  static String encryptSMS(
      {required String mobileNumber,
        required String appId,
      required String? deviceId,
      required String? verificationType,
      required String? platform}) {

    if (deviceId == null) {
      deviceId = "";
    }
    if (platform == null) {
      platform = "";
    }

    int randomOTP = Utils.getRandomNumber(length: 6);
    Utils.printLog('========Inside encrypt data=======');
    Utils.printLog('Random OTP $randomOTP');
    Utils.printLog('Device Id $deviceId');
    Utils.printLog('Platform $platform');

    String plainText = '"'  +'MO:'+mobileNumber + '|' + 'DID:' + deviceId + '|' + 'APP:' +appId.toString()+'|'/*+ 'DEVICEID:' + deviceId + '|' */+ 'P:' + platform  + '|' + 'verificationType:' +verificationType.toString() +  '"';
    final secureKey = "4512631236589784";
    final key = Key.fromUtf8(secureKey);
    final iv = IV.fromUtf8(secureKey);

    final encrypter = Encrypter(AES(
      key,
      mode: AESMode.cbc,
    ));

    final encrypted = encrypter.encrypt(plainText, iv: iv);

    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    Utils.printLog('Plain Text: $plainText');
    // Utils.printLog('Decrypted Text: $decrypted');
    // print(encrypted.bytes);
    // Utils.printLog(encrypted.base16);
    // Utils.printLog(encrypted.base64);
    Utils.printLog('========Inside encryption done=======');
    return (encrypted.base64);
  }

  static String getEncodedBase64ForCustomer(String mid) {
    Utils.printLog('========Inside encrypt data=======');
    String plainText =  mid + '|' + 'CustomerData';
    final secureKey = "4512631236589784";
    final key = Key.fromUtf8(secureKey);
    final iv = IV.fromUtf8(secureKey);
    final encrypter = Encrypter(AES(
      key,
      mode: AESMode.cbc,
    ));

    final encrypted = encrypter.encrypt(plainText, iv: iv);

    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    Utils.printLog('Plain Text: $plainText');
    // Utils.printLog('Decrypted Text: $decrypted');
    // print(encrypted.bytes);
    // Utils.printLog(encrypted.base16);
    // Utils.printLog(encrypted.base64);
    Utils.printLog('========Inside encryption done=======');
    return (encrypted.base64);
  }


  static String encryptRegisterDeviceId(
      {required String mobileNumber,
        required String? deviceId}) {

    if (deviceId == null) {
      deviceId = "";
    }


    Utils.printLog('========Inside encrypt data =======');
    Utils.printLog('Mobile Number $mobileNumber');
    Utils.printLog('Device Id $deviceId');

    String plainText = '"'+mobileNumber + '|' + deviceId+ '|' + 'LoginDevicesDetails' '"';
    final secureKey = "4512631236589784";
    final key = Key.fromUtf8(secureKey);
    final iv = IV.fromUtf8(secureKey);

    final encrypter = Encrypter(AES(
      key,
      mode: AESMode.cbc,
    ));

    final encrypted = encrypter.encrypt(plainText, iv: iv);

    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    Utils.printLog('Plain Text: $plainText');
    // Utils.printLog('Decrypted Text: $decrypted');
    // print(encrypted.bytes);
    // Utils.printLog(encrypted.base16);
    // Utils.printLog(encrypted.base64);
    Utils.printLog('========Inside encryption done=======');
    return (encrypted.base64);
  }




}
