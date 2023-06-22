// To parse this JSON data, do
//
//     final resGetAddress = resGetAddressFromJson(jsonString);

import 'dart:convert';

ResGetAddress resGetAddressFromJson(String str) => ResGetAddress.fromJson(json.decode(str));

String resGetAddressToJson(ResGetAddress data) => json.encode(data.toJson());

class ResGetAddress {
    int? code;
    int? subcode;
    dynamic message;
    Data? data;

    ResGetAddress({
        this.code,
        this.subcode,
        this.message,
        this.data,
    });

    factory ResGetAddress.fromJson(Map<String, dynamic> json) => ResGetAddress(
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
    List<UserAddress>? userAddresses;
    Pagination? pagination;

    Data({
        this.userAddresses,
        this.pagination,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userAddresses: json["userAddresses"] == null ? [] : List<UserAddress>.from(json["userAddresses"]!.map((x) => UserAddress.fromJson(x))),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "userAddresses": userAddresses == null ? [] : List<dynamic>.from(userAddresses!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
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

class UserAddress {
    int? addressId;
    int? addressType;
    String? streetAddress;
    String? city;
    String? district;
    String? state;
    int? pincodeId;
    int? pincode;
    bool isSelected;

    UserAddress({
        this.addressId,
        this.addressType,
        this.streetAddress,
        this.city,
        this.district,
        this.state,
        this.pincodeId,
        this.pincode,
        this.isSelected = false,
    });

    factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
        addressId: json["addressId"],
        addressType: json["addressType"],
        streetAddress: json["streetAddress"],
        city: json["city"],
        district: json["district"],
        state: json["state"],
        pincodeId: json["pincodeId"],
        pincode: json["pincode"],
    );

    Map<String, dynamic> toJson() => {
        "addressId": addressId,
        "addressType": addressType,
        "streetAddress": streetAddress,
        "city": city,
        "district": district,
        "state": state,
        "pincodeId": pincodeId,
        "pincode": pincode,
    };
}
