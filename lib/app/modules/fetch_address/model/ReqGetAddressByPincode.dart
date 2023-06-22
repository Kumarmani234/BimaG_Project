// To parse this JSON data, do
//
//     final reqGetAddressByPincode = reqGetAddressByPincodeFromJson(jsonString);

import 'dart:convert';

ReqGetAddressByPincode reqGetAddressByPincodeFromJson(String str) => ReqGetAddressByPincode.fromJson(json.decode(str));

String reqGetAddressByPincodeToJson(ReqGetAddressByPincode data) => json.encode(data.toJson());

class ReqGetAddressByPincode {
    ReqGetAddressByPincode({
        required this.pinCode,
    });

    String pinCode;

    factory ReqGetAddressByPincode.fromJson(Map<String, dynamic> json) => ReqGetAddressByPincode(
        pinCode: json["pinCode"],
    );

    Map<String, dynamic> toJson() => {
        "pinCode": pinCode,
    };
}
