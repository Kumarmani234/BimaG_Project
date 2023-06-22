import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app/data/models/ResNameIdList.dart';
import 'dart:io' as Io;

class Utils {
  /* Get random number for order id */
  static int getRandomNumber({int? length}) {
    Random random = new Random();
    int randomNumber = 0;
    if (length != null) {
      randomNumber = random.nextInt(900000);
    } else {
      randomNumber = random.nextInt(90000);
    }
    return randomNumber;
  }

  static void printLog(String text) {
    debugPrint(text);
  }

  static void printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => debugPrint(match.group(0)));
  }

  static bool validateMobileNoIndia(String value) {
    String pattern =
        "(?:(?:\\+|0{0,2})91(\\s*[\\- ]\\s*)?|[0 ]?)?[6789]\\d{9}|(\\d[ -]?){10}\\d";
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static Future<bool> isInternetAvailable() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static String formatedTime({required int time}) {
    int sec = time % 60;
    int min = (time / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return minute + 'm ' + second + 's';
  }

  static String encodeBase64(String data) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(data);
    return encoded;
  }

  static String decodeBase64String(String data) {
    var decodedBytes = base64Decode(data);
    return utf8.decode(decodedBytes);
  }

  static String dbDate(DateTime date) {
    String strDate = '';
    strDate = date.month.toString() + '/';
    strDate += date.day.toString() + '/';
    strDate += date.year.toString();
    print('strDate : $strDate');
    return strDate;
  }

  static String getRelation(int type) {
    if (type == 1) {
      return 'Spouse';
    } else if (type == 2) {
      return 'Parent';
    } else if (type == 3) {
      return 'Child';
    } else if (type == 4) {
      return 'Sibling';
    } else if (type == 5) {
      return 'Grandparent';
    } else if (type == 6) {
      return 'Grandchild';
    } else if (type == 7) {
      return 'Cousin';
    } else if (type == 8) {
      return 'AuntUncle';
    } else if (type == 9) {
      return 'NieceNephew';
    } else if (type == 10) {
      return 'Friend';
    } else if (type == 11) {
      return 'Colleague';
    } else if (type == 12) {
      return 'Acquaintance';
    } else {
      return '';
    }
  }

  static String getDocument(int type) {
    if (type == 1) {
      return 'Aadhaar Card';
    } else if (type == 2) {
      return 'Pan Card';
    } else if (type == 3) {
      return 'Driving License';
    } else if (type == 4) {
      return 'Vehicles RC';
    } else {
      return '';
    }
  }

  /*   RelationShipType List:
       Spouse = 1,
        Parent = 2,
        Child = 3,
        Sibling = 4,
        Grandparent = 5,
        Grandchild = 6,
        Cousin = 7,
        AuntUncle = 8,
        NieceNephew = 9,
        Friend = 10,
        Colleague = 11,
        Acquaintance = 12,*/

  static List<ResNameIdList> getRelationsList() {
    List<ResNameIdList> list = [];
    list.add(ResNameIdList(id: '1', name: 'Spouse'));
    list.add(ResNameIdList(id: '2', name: 'Parent'));
    list.add(ResNameIdList(id: '3', name: 'Child'));
    list.add(ResNameIdList(id: '4', name: 'Sibling'));
    list.add(ResNameIdList(id: '5', name: 'Grandparent'));
    list.add(ResNameIdList(id: '6', name: 'Grandchild'));
    list.add(ResNameIdList(id: '7', name: 'Cousin'));
    list.add(ResNameIdList(id: '8', name: 'AuntUncle'));
    list.add(ResNameIdList(id: '9', name: 'NieceNephew'));
    list.add(ResNameIdList(id: '10', name: 'Friend'));
    list.add(ResNameIdList(id: '11', name: 'Colleague'));
    list.add(ResNameIdList(id: '12', name: 'Acquaintance'));
    return list;
  }

  static List<ResNameIdList> getDocumentList() {
    List<ResNameIdList> list = [];
    list.add(ResNameIdList(id: '1', name: 'Aadhaar Card'));
    list.add(ResNameIdList(id: '2', name: 'Pan Card'));
    list.add(ResNameIdList(id: '3', name: 'Driving License'));
    list.add(ResNameIdList(id: '4', name: 'Vehicles RC'));
    return list;
  }

  static String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  static String fetchCityFromAddress(String str) {
    String cityName = '';
    List<String> listAddress = str.split(',');
    print('length of listAddress : ${listAddress.length}');
    if (listAddress.length > 3) {
      if (listAddress[2].isNotEmpty) {
        return cityName = listAddress[2];
      } else {
        return cityName = listAddress[3];
      }
    }
    return str;
  }

  static Future<void> launchURL(String URL) async {
    try {
      final Uri _url = Uri.parse(URL);
      if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $_url');
      }
    } catch (_) {}
  }

  static String getAddressType(int type) {
    print('ADDRess ');
    if (type == 1) {
      return 'Home';
    } else if (type == 2) {
      return 'Work';
    } else if (type == 3) {
      return 'Billing';
    } else if (type == 4) {
      return 'Shipping';
    } else if (type == 5) {
      return 'Mailing';
    } else if (type == 6) {
      return 'Other';
    }
    return '';
  }

  static Future<String> encodeBase64Image(File file) async {
    final bytes = Io.File(file.path).readAsBytesSync();

    String img64 = base64Encode(bytes);
    //Utils.printLog(img64);
    return img64;
  }

  /*Future<String> createFileFromString(String base64Str) async {
    Uint8List decodedbytes = base64.decode(base64Str);
    String decodedpath = '';
    if(base64Str.contains('image/png') || base64Str.contains('image/jpg') || base64Str.contains('image/jpeg')){
      File decodedimgfile = await File("image.jpg").writeAsBytes(decodedbytes);
      decodedpath = decodedimgfile.path;
    }
    return decodedpath;
  }*/

  static String randomText() {
    int length = 10;
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    String randText = String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    return randText;
  }

  static Future<String> createFileFromString(encodedStr) async {
    Uint8List bytes = base64.decode(encodedStr.toString().replaceAll('data:image/png;base64,', ''));
    print('bytes  : 270');
    String dir = (await getApplicationDocumentsDirectory()).path;
    print('dir : $dir');

    File file = File(
        "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".png");
    print('filepath : ${file.path}');
    await file.writeAsBytes(bytes);

    return file.path;
  }
}
