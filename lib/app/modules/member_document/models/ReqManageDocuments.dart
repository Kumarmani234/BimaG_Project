// To parse this JSON data, do
//
//     final reqManageDocuments = reqManageDocumentsFromJson(jsonString);

import 'dart:convert';

ReqManageDocuments reqManageDocumentsFromJson(String str) => ReqManageDocuments.fromJson(json.decode(str));

String reqManageDocumentsToJson(ReqManageDocuments data) => json.encode(data.toJson());

class ReqManageDocuments {
    String? documentUniqueId;
    int? documentStatus;
    String? documentTypeId;
    String? documentNumber;
    String? documentBase64;

    ReqManageDocuments({
        this.documentUniqueId,
        this.documentStatus,
        this.documentTypeId,
        this.documentNumber,
        this.documentBase64,
    });

    factory ReqManageDocuments.fromJson(Map<String, dynamic> json) => ReqManageDocuments(
        documentUniqueId: json["documentUniqueId"],
        documentStatus: json["documentStatus"],
        documentTypeId: json["documentTypeId"],
        documentNumber: json["documentNumber"],
        documentBase64: json["documentBase64"],
    );

    Map<String, dynamic> toJson() => {
        "documentUniqueId": documentUniqueId,
        "documentStatus": documentStatus,
        "documentTypeId": documentTypeId,
        "documentNumber": documentNumber,
        "documentBase64": documentBase64,
    };
}
