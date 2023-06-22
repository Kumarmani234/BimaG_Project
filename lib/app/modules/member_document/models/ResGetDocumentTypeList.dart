// To parse this JSON data, do
//
//     final resGetDocumentTypeList = resGetDocumentTypeListFromJson(jsonString);

import 'dart:convert';

ResGetDocumentTypeList resGetDocumentTypeListFromJson(String str) => ResGetDocumentTypeList.fromJson(json.decode(str));

String resGetDocumentTypeListToJson(ResGetDocumentTypeList data) => json.encode(data.toJson());

class ResGetDocumentTypeList {
    int? code;
    int? subcode;
    dynamic message;
    List<DocTypes>? data;

    ResGetDocumentTypeList({
        this.code,
        this.subcode,
        this.message,
        this.data,
    });

    factory ResGetDocumentTypeList.fromJson(Map<String, dynamic> json) => ResGetDocumentTypeList(
        code: json["code"],
        subcode: json["subcode"],
        message: json["message"],
        data: json["data"] == null ? [] : List<DocTypes>.from(json["data"]!.map((x) => DocTypes.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "subcode": subcode,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class DocTypes {
    int? documentTypeId;
    String? documentTypeName;

    DocTypes({
        this.documentTypeId,
        this.documentTypeName,
    });

    factory DocTypes.fromJson(Map<String, dynamic> json) => DocTypes(
        documentTypeId: json["documentTypeId"],
        documentTypeName: json["documentTypeName"],
    );

    Map<String, dynamic> toJson() => {
        "documentTypeId": documentTypeId,
        "documentTypeName": documentTypeName,
    };
}
