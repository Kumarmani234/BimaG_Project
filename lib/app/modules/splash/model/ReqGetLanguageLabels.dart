// To parse this JSON data, do
//
//     final reqGetLanguageLabels = reqGetLanguageLabelsFromJson(jsonString);

import 'dart:convert';

ReqGetLanguageLabels reqGetLanguageLabelsFromJson(String str) => ReqGetLanguageLabels.fromJson(json.decode(str));

String reqGetLanguageLabelsToJson(ReqGetLanguageLabels data) => json.encode(data.toJson());

class ReqGetLanguageLabels {
  ReqGetLanguageLabels({
    required this.languageKey,
  });

  String languageKey;

  factory ReqGetLanguageLabels.fromJson(Map<String, dynamic> json) => ReqGetLanguageLabels(
    languageKey: json["languageKey"],
  );

  Map<String, dynamic> toJson() => {
    "languageKey": languageKey,
  };
}
