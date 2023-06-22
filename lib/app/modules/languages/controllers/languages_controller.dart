import 'dart:convert';
import 'dart:ui';

import 'package:bima_g/app/modules/languages/locale/language_en.dart';
import 'package:bima_g/utility/asset_paths.dart';
import 'package:get/get.dart';

import '../../../module_controllers.dart';
import '../../../routes/app_pages.dart';
import '../../splash/model/ReqGetLanguageLabels.dart';
import '../../splash/model/ResGetLanguageLabels.dart';

class LanguageViewModel {
  bool isSelected;
  String assetImage, title, subtitle, langCode;
  LanguageViewModel({
    this.isSelected = false,
    this.assetImage = '',
    this.title = '',
    this.subtitle = '',
    required this.langCode,
  });
}

class LanguagesController extends GetxController {
  RxList<LanguageViewModel> listLanguages = <LanguageViewModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
//en,hi,gu,mr,ka,ml,ta,be,pn,te
    listLanguages.add(LanguageViewModel(
        isSelected: true,
        title: 'English',
        subtitle: 'English',
        assetImage: AssetPath.lang_eng,
        langCode: 'en'));
    listLanguages.add(LanguageViewModel(
        isSelected: false,
        title: 'हिन्दी',
        subtitle: 'Hindi',
        assetImage: AssetPath.lang_hindi,
        langCode: 'hi'));
    listLanguages.add(LanguageViewModel(
        isSelected: false,
        title: 'ગુજરાતી',
        subtitle: 'Gujarati',
        assetImage: AssetPath.lang_guj,
        langCode: 'gu'));
    listLanguages.add(LanguageViewModel(
        isSelected: false,
        title: 'राजस्थानी',
        subtitle: 'Rajasthani',
        assetImage: AssetPath.lang_raj,
        langCode: 'rj'));
    listLanguages.add(LanguageViewModel(
        isSelected: false,
        title: 'తెలుగు',
        subtitle: 'Telugu',
        assetImage: AssetPath.lang_telugu,
        langCode: 'te'));
    listLanguages.add(LanguageViewModel(
        isSelected: false,
        title: 'मराठी',
        subtitle: 'Marathi',
        assetImage: AssetPath.lang_marathi,
        langCode: 'mr'));
    listLanguages.add(LanguageViewModel(
        isSelected: false,
        title: 'ਪੰਜਾਬੀ',
        subtitle: 'Punjabi',
        assetImage: AssetPath.lang_panjabi,
        langCode: 'pn'));
    listLanguages.add(LanguageViewModel(
        isSelected: false,
        title: 'ಕನ್ನಡ',
        subtitle: 'Kannada',
        assetImage: AssetPath.lang_kannada,
        langCode: 'ka'));
    listLanguages.add(LanguageViewModel(
        isSelected: false,
        title: 'മലയാളം',
        subtitle: 'Malayalam',
        assetImage: AssetPath.lang_malayalam,
        langCode: 'ml'));
    listLanguages.add(LanguageViewModel(
        isSelected: false,
        title: 'বাংলা',
        subtitle: 'Bengali',
        assetImage: AssetPath.lang_bengali,
        langCode: 'be'));
    listLanguages.add(LanguageViewModel(
        isSelected: false,
        title: 'ଓଡ଼ିଆ',
        subtitle: 'Udiya',
        assetImage: AssetPath.lang_udiya,
        langCode: 'or'));
    listLanguages.add(LanguageViewModel(
        isSelected: false,
        title: 'தமிழ்',
        subtitle: 'Tamil',
        assetImage: AssetPath.lang_tamil,
        langCode: 'ta'));
  }

  @override
  Future<void> onReady() async {
    super.onReady();

    for (int i = 0; i < listLanguages.length; i++) {
      listLanguages[i].isSelected = false;
      if (listLanguages[i].langCode == prefController.getCurrentLanguage()) {
        listLanguages[i].isSelected = true;
      }
    }
    Get.clearTranslations();
    print('current translation : ${prefController.getCurrentLanguage()}');
    if (prefController.getCurrentLanguage() == 'def_en') {
      listLanguages[0].isSelected = true;
      Map<String, Map<String, String>> guData = {
        'def_en': getJsonFromString(DefaultLanguage.defaultLang.toString()),
      };

      Get.addTranslations(guData);

      Get.updateLocale(Locale('def_en', ''));
    } else {
      fetchCurrentLanguage();
    }
  }

  @override
  void onClose() {}

  Future<void> onChangeLanguage(ind) async {
    for (int i = 0; i < listLanguages.length; i++) {
      listLanguages[i].isSelected = false;
    }
    listLanguages[ind].isSelected = true;
    listLanguages.refresh();
    fetchLanguageAndUpdate(listLanguages[ind].langCode);
  }

  Future<void> fetchLanguageAndUpdate(langCode) async {
    isLoading.value = true;

    try {
      ReqGetLanguageLabels reqGetLanguageLabels =
          ReqGetLanguageLabels(languageKey: langCode);
      Response<dynamic> langResponse = await apiClientProvider
          .getLanguageLabels(reqGetLanguageLabels.toJson());
      ResGetLanguageLabels resGetLanguageLabels =
          ResGetLanguageLabels.fromJson(langResponse.body);

      if (resGetLanguageLabels.code == 1) {
        if (langCode == 'en') {
          prefController.setEnglishLang(jsonEncode(resGetLanguageLabels.data));
        } else if (langCode == 'hi') {
          prefController.setHindiLang(jsonEncode(resGetLanguageLabels.data));
        }

        Get.clearTranslations();

        final responseHi = {
          'hello': 'नमस्ते',
          'continue': 'जारी रखना',
          'choose_your_language': 'अपनी भाषा चुनें',
          'choose_your_language_info':
              'हमारे एप्लिकेशन का उपयोग जारी रखने के लिए कृपया नीचे अपनी पसंदीदा भाषा चुनें।',
        };

        final responseGu = {
          "continue": "ચાલુ રાખો",
          'choose_your_language': 'તમારી ભાષા પસંદ કરો',
          'choose_your_language_info':
              'અમારી એપ્લિકેશનનો ઉપયોગ ચાલુ રાખવા માટે કૃપા કરીને નીચે તમારી પસંદીદા ભાષા પસંદ કરો.'
        };

        Map<String, Map<String, String>> guData = {
          'def_en': getJsonFromString(DefaultLanguage.defaultLang.toString()),
          langCode: resGetLanguageLabels.data
        };

        Get.addTranslations(guData);

        Get.updateLocale(Locale(langCode, ''));
        prefController.setCurrentLanguage(langCode);
      }
    } catch (_) {
      Get.clearTranslations();
      Map<String, Map<String, String>> guData = {
        'def_en': getJsonFromString(DefaultLanguage.defaultLang.toString()),
      };

      Get.addTranslations(guData);

      print(
          'catch.199 ---- current Language : ${prefController.getCurrentLanguage()}');
      Get.updateLocale(Locale('def_en', ''));
      prefController.setCurrentLanguage('def_en');
    }

    isLoading.value = false;
  }

  Future<void> fetchCurrentLanguage() async {
    String langCode = await prefController.getCurrentLanguage();
    String langDATA = '';
    print('current language : ${prefController.getEnglishLanguage()}');
    if (langCode == 'en') {
      langDATA = await prefController.getEnglishLanguage();
    } else if (langCode == 'hi') {
      langDATA = await prefController.getHindiLanguage();
    } else {
      langDATA = DefaultLanguage.defaultLang.toString();
    }

    Get.clearTranslations();
    langDATA = langDATA.replaceAll('",', '"@');
    var dataSp = langDATA.split('@');
    Map<String, String> mapData = Map();
    dataSp.forEach(
        (element) => mapData[element.split(':')[0]] = element.split(':')[1]);

    Map<String, Map<String, String>> guData = {
      'def_en': getJsonFromString(DefaultLanguage.defaultLang.toString()),
      langCode: mapData
    };

    Get.addTranslations(guData);

    Get.updateLocale(Locale(langCode, ''));
    prefController.setCurrentLanguage(langCode);
    print('current Language : ${prefController.getCurrentLanguage()}');
  }

  Map<String, String> getJsonFromString(String rawText) {
    rawText = rawText.replaceAll('\"s', "s");
    // Will find, for exemple, the text: "{isUserActive:"
    final regexMapKeyWithOpenBracket = RegExp('(?<={)(.*?):+');
    // Will find, for exemple, the text: ", userCourses:"
    final regexMapKeyWithCommaAndSpace = RegExp(r'(?<=, )([^\]]*?):');

    final regexOnlyKeyInLine = RegExp(r'^.+:$');

    final splitedSentences = rawText
        .replaceAllMapped(regexMapKeyWithCommaAndSpace,
            (Match match) => '\n${match.text.trim()}\n')
        .replaceAllMapped(regexMapKeyWithOpenBracket,
            (Match match) => '\n${match.text.trim()}\n')
        .replaceAll(RegExp(r'}(?=,|]|}|$|\s+)'), '\n}\n')
        .replaceAll(RegExp(r'(?<=(,|:|^|\[)\s?){'), '\n{\n')
        .replaceAll(RegExp('\\[\\s?\\]'), '\n[\n]\n')
        .replaceAll(RegExp('\\{\\s?\\}'), '\n{\n}\n')
        .replaceAll('[', '\n[\n')
        .replaceAll(']', '\n]\n')
        .replaceAll(',', '\n,\n')
        .split('\n')
      ..removeWhere((element) => element.replaceAll(' ', '').isEmpty);

    final List<String> correctLines = [];
    for (String line in splitedSentences) {
      final isMapKey = regexOnlyKeyInLine.hasMatch(line);

      if (isMapKey) {
        final lineWithoutFinalTwoDots = line.substring(0, line.length - 1);
        final lineWithQuaot = _putQuotationMarks(lineWithoutFinalTwoDots);

        correctLines.add('$lineWithQuaot:');
      } else {
        String l = line.trim();

        final hasCommaInFinal = l.endsWith(',') && l.length > 1;
        if (hasCommaInFinal) l = l.substring(0, l.length - 1);

        // If it falls in this else, it is a value of a key or a map structure
        final isNumber = double.tryParse(l) != null || int.tryParse(l) != null;
        final isBolean = l == 'false' || l == 'true';
        final isStructureCaracter =
            ['{', '}', '[', ']', ','].any((e) => e == l);
        final isNull = l == 'null';
        if (isStructureCaracter || isNumber || isBolean || isNull) {
          if (hasCommaInFinal) {
            correctLines.add('$l,');
          } else {
            correctLines.add(l);
          }
          continue;
        }

        // If you got to this point, i'm sure it's a value string, so lets add a double quote
        final lineWithQuaot = _putQuotationMarks(l);
        if (hasCommaInFinal) {
          correctLines.add('$lineWithQuaot,');
        } else {
          correctLines.add(lineWithQuaot);
        }
      }
    }

    final Map<String, String> decoded = {};
    (jsonDecode(correctLines.join('')) as Map)
        .cast<String, String>()
        .forEach((key, value) {
      decoded[key] = value;
    });

    return decoded;
  }

  onContinue() {
    Get.toNamed(Routes.INFO_SLIDERS);
  }
}

extension MatchExtension on Match {
  String get text => input.substring(start, end);
}

String _putQuotationMarks(String findedText) {
  if (!findedText.startsWith('\'') && !findedText.startsWith('"')) {
    findedText = findedText[0] + findedText.substring(1);
  }
  if (!findedText.endsWith('\'')) {
    final lastIndex = findedText.length - 1;
    findedText = findedText.substring(0, lastIndex) + findedText[lastIndex];
  }
  return '"$findedText"';
}
