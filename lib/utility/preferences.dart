import 'package:bima_g/app/modules/languages/locale/language_en.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Pref{
  static String currentLanguage = "currentLanguage";
  static String isLanguageSelected = "isLanguageSelected";
}

class PrefController extends GetxController {

  final box = GetStorage();
  /*bool getBool(str){
    return box.read(str) ?? false;
  }

  String getString(str){
    return box.read(str) ?? '';
  }

  int getInt(str){
    return box.read(str) ?? 0;
  }

  double getDouble(str){
    return box.read(str) ?? 0.0;
  }

  void setBool(key,val) => box.write(key, val);

  void setString(key,val) => box.write(key, val);

  void setInt(key,val) => box.write(key, val);

  void setDouble(key,val) => box.write(key, val);*/

  void removeKey(key) => box.remove(key);

  //set current language
  String getCurrentLanguage() => box.read(Pref.currentLanguage) ?? 'def_en';
  void setCurrentLanguage(val) => box.write(Pref.currentLanguage, val);

  void setDefaultLang(value) => box.write('def_en', value);
  void setEnglishLang(value) => box.write('en', value);
  void setHindiLang(value) => box.write('hi', value);
  void setGujaratiLang(value) => box.write('gu', value);
  void setRajasthaniLang(value) => box.write('rj', value);
  void setTeluguLang(value) => box.write('telugu', value);
  void setMarathiLang(value) => box.write('marathi', value);
  void setPunjabiLang(value) => box.write('punjabi', value);
  void setKannadaLang(value) => box.write('kannada', value);
  void setMalayalamLang(value) => box.write('malayalam', value);
  void setBengaliLang(value) => box.write('bengali', value);
  void setUdiyaLang(value) => box.write('udiya', value);
  void setTamilLang(value) => box.write('tamil', value);

  String getDefaultLanguage() => box.read('def_en') ?? DefaultLanguage.defaultLang.toString();
  String getEnglishLanguage() => box.read('en') ?? '';
  String getHindiLanguage() => box.read('hi') ?? '';
  String getGujaratiLanguage(val) => box.read('gu') ?? '';
  String getRajasthaniLanguage(val) => box.read('rj') ?? '';
  String getTeluguLanguage(val) => box.read('telugu') ?? '';
  String getMarathiLanguage(val) => box.read('marathi') ?? '';
  String getPunjabiLanguage(val) => box.read('punjabi') ?? '';
  String getKannadaLanguage(val) => box.read('kannada') ?? '';
  String getMalayalamLanguage(val) => box.read('malayalam') ?? '';
  String getBengaliLanguage(val) => box.read('bengali') ?? '';
  String getUdiyaLanguage(val) => box.read('udiya') ?? '';
  String getTamilLanguage(val) => box.read('tamil') ?? '';
}