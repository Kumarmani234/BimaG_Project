import 'dart:convert';
/*
import 'package:socialapp/utils/pref.dart';
import 'package:socialapp/utils/globals.dart' as globals;*/

class LanguageLabels{
  static void setGlobalLanguageLabels() async {
   /* String currentLang = await Pref.getString(Pref.currentAppLanguage);
    globals.currentLangCode = currentLang;
    if(currentLang == "en"){
      globals.languageLabelsString = await Pref.getString(Pref.languageLabelEnglish);

    }else if(currentLang == "hi"){
      globals.languageLabelsString = await Pref.getString(Pref.languageLabelHindi);

    }else if(currentLang == "rj"){
      globals.languageLabelsString = await Pref.getString(Pref.languageLabelRajasthani);
      //globals.languageLabelsString = await Pref.getString(Pref.languageLabelHindi);
    }else if(currentLang == "gu"){
      globals.languageLabelsString = await Pref.getString(Pref.languageLabelGujarati);
      //globals.languageLabelsString = await Pref.getString(Pref.languageLabelHindi);
    }else if(currentLang == "telugu"){
      globals.languageLabelsString = await Pref.getString(Pref.languageLabelTelugu);
      //globals.languageLabelsString = await Pref.getString(Pref.languageLabelHindi);
    }else if(currentLang == "kannada"){
      globals.languageLabelsString = await Pref.getString(Pref.languageLabelKannada);
      //globals.languageLabelsString = await Pref.getString(Pref.languageLabelHindi);
    }else if(currentLang == "malayalam"){
      globals.languageLabelsString = await Pref.getString(Pref.languageLabelMalayalam);
      //globals.languageLabelsString = await Pref.getString(Pref.languageLabelHindi);
    }else if(currentLang == "tamil"){
      globals.languageLabelsString = await Pref.getString(Pref.languageLabelTamil);
      //globals.languageLabelsString = await Pref.getString(Pref.languageLabelHindi);
    }else if(currentLang == "bengali"){
      globals.languageLabelsString = await Pref.getString(Pref.languageLabelBengali);
      //globals.languageLabelsString = await Pref.getString(Pref.languageLabelHindi);
    }else if(currentLang == "udia"){
      globals.languageLabelsString = await Pref.getString(Pref.languageLabelUdia);
      //globals.languageLabelsString = await Pref.getString(Pref.languageLabelHindi);
    }else if(currentLang == "punjabi"){
      globals.languageLabelsString = await Pref.getString(Pref.languageLabelPubjabi);
      //globals.languageLabelsString = await Pref.getString(Pref.languageLabelHindi);
    }else if(currentLang == "marathi"){
      globals.languageLabelsString = await Pref.getString(Pref.languageLabelMarathi);
      //globals.languageLabelsString = await Pref.getString(Pref.languageLabelHindi);
    }else{
      globals.currentLangCode = "hi";
      globals.languageLabelsString = await Pref.getString(Pref.languageLabelHindi);
    }*/
  }


  static String getStringLabels(String label, {String def = ""}){
    try{
      /*var map = jsonDecode(globals.languageLabelsString!);
      return map[label] ?? def;*/
      return def;
    }catch(_){
      return def;
    }
  }

  /*static void setGlobalExtendedLanguageLabels(String currentLang) async {
    print("setGlobalExtendedLanguageLabels - $currentLang");

    //String currentLang = await Pref.getString(Pref.currentExtendedLanguage);
    if(currentLang == "en"){
      globals.extendedLangString = await Pref.getString(Pref.languageLabelEnglish);

    }else if(currentLang == "hi"){
      globals.extendedLangString = await Pref.getString(Pref.languageLabelHindi);

    }else if(currentLang == "gu"){
      //globals.languageLabelsString = await Pref.getString(Pref.languageLabelGujarati);
      globals.extendedLangString = await Pref.getString(Pref.languageLabelGujarati);

    }else if(currentLang == "rj"){
      //globals.languageLabelsString = await Pref.getString(Pref.languageLabelGujarati);
      globals.extendedLangString = await Pref.getString(Pref.languageLabelRajasthani);

    }else{
      globals.extendedLangString = await Pref.getString(Pref.languageLabelHindi);
    }
  }


  static String getSpecificLanguage(String label) {
    var map = jsonDecode(globals.extendedLangString!);
    return map[label] ?? "";
  }*/
}