// To parse this JSON data, do
//
//     final resGetLanguageLabels = resGetLanguageLabelsFromJson(jsonString);

import 'dart:convert';

ResGetLanguageLabels resGetLanguageLabelsFromJson(String str) => ResGetLanguageLabels.fromJson(json.decode(str));

String resGetLanguageLabelsToJson(ResGetLanguageLabels data) => json.encode(data.toJson());

class ResGetLanguageLabels {
  ResGetLanguageLabels({
    required this.code,
    required this.subcode,
    this.message,
    required this.data,
  });

  int code;
  int subcode;
  dynamic message;
  Map<String, String> data;

  factory ResGetLanguageLabels.fromJson(Map<String, dynamic> json) => ResGetLanguageLabels(
    code: json["code"],
    subcode: json["subcode"],
    message: json["message"],
    data: Map.from(json["data"]).map((k, v) => MapEntry<String, String>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "subcode": subcode,
    "message": message,
    "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}
