// To parse this JSON data, do
//
//     final resGetAddressByPincode = resGetAddressByPincodeFromJson(jsonString);

import 'dart:convert';

ResGetAddressByPincode resGetAddressByPincodeFromJson(String str) => ResGetAddressByPincode.fromJson(json.decode(str));

String resGetAddressByPincodeToJson(ResGetAddressByPincode data) => json.encode(data.toJson());

class ResGetAddressByPincode {
    ResGetAddressByPincode({
        required this.code,
        required this.subcode,
        this.message,
        required this.data,
    });

    int code;
    int subcode;
    dynamic message;
    List<PincodeList> data;

    factory ResGetAddressByPincode.fromJson(Map<String, dynamic> json) => ResGetAddressByPincode(
        code: json["code"],
        subcode: json["subcode"],
        message: json["message"],
        data: List<PincodeList>.from(json["data"].map((x) => PincodeList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "subcode": subcode,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class PincodeList {
    PincodeList({
        required this.id,
        required this.country,
        required this.state,
        required this.district,
        required this.cityVillageArea,
        required this.pincode,
        required this.taluka,
    });

    int id;
    String country;
    String state;
    String district;
    String cityVillageArea;
    String pincode;
    String taluka;

    factory PincodeList.fromJson(Map<String, dynamic> json) => PincodeList(
        id: json["id"],
        country: json["country"],
        state: json["state"],
        district: json["district"],
        cityVillageArea: json["cityVillageArea"],
        pincode: json["pincode"],
        taluka: json["taluka"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "country": country,
        "state": state,
        "district": district,
        "cityVillageArea": cityVillageArea,
        "pincode": pincode,
        "taluka": taluka,
    };
}
