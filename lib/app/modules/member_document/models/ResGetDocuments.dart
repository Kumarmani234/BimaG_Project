// To parse this JSON data, do
//
//     final resGetDocuments = resGetDocumentsFromJson(jsonString);

import 'dart:convert';

ResGetDocuments resGetDocumentsFromJson(String str) => ResGetDocuments.fromJson(json.decode(str));

String resGetDocumentsToJson(ResGetDocuments data) => json.encode(data.toJson());

class ResGetDocuments {
    int? code;
    int? subcode;
    dynamic message;
    Data? data;

    ResGetDocuments({
        this.code,
        this.subcode,
        this.message,
        this.data,
    });

    factory ResGetDocuments.fromJson(Map<String, dynamic> json) => ResGetDocuments(
        code: json["code"],
        subcode: json["subcode"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "subcode": subcode,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    List<Document>? documents;
    Pagination? pagination;

    Data({
        this.documents,
        this.pagination,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        documents: json["documents"] == null ? [] : List<Document>.from(json["documents"]!.map((x) => Document.fromJson(x))),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "documents": documents == null ? [] : List<dynamic>.from(documents!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
    };
}

class Document {
    int? documentTypeId;
    String? documentUniqueId;
    String? documentTypeName;
    String? documentBase64;
    int? documentStatus;
    DateTime? whenCreated;
    String? documentNumber;
    int? verified;

    Document({
        this.documentTypeId,
        this.documentUniqueId,
        this.documentTypeName,
        this.documentBase64,
        this.documentStatus,
        this.whenCreated,
        this.documentNumber,
        this.verified,
    });

    factory Document.fromJson(Map<String, dynamic> json) => Document(
        documentTypeId: json["documentTypeId"],
        documentUniqueId: json["documentUniqueId"],
        documentTypeName: json["documentTypeName"],
        documentBase64: json["documentBase64"],
        documentStatus: json["documentStatus"],
        whenCreated: json["whenCreated"] == null ? null : DateTime.parse(json["whenCreated"]),
        documentNumber: json["documentNumber"],
        verified: json["verified"],
    );

    Map<String, dynamic> toJson() => {
        "documentTypeId": documentTypeId,
        "documentUniqueId": documentUniqueId,
        "documentTypeName": documentTypeName,
        "documentBase64": documentBase64,
        "documentStatus": documentStatus,
        "whenCreated": whenCreated?.toIso8601String(),
        "documentNumber": documentNumber,
        "verified": verified,
    };
}

class Pagination {
    int? totalRecords;
    bool? nextPage;

    Pagination({
        this.totalRecords,
        this.nextPage,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalRecords: json["totalRecords"],
        nextPage: json["nextPage"],
    );

    Map<String, dynamic> toJson() => {
        "totalRecords": totalRecords,
        "nextPage": nextPage,
    };
}
