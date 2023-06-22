// To parse this JSON data, do
//
//     final reqManageAddress = reqManageAddressFromJson(jsonString);

import 'dart:convert';

ReqManageAddress reqManageAddressFromJson(String str) => ReqManageAddress.fromJson(json.decode(str));

String reqManageAddressToJson(ReqManageAddress data) => json.encode(data.toJson());

class ReqManageAddress {
    int? addressId;
    int? addressType;
    String? streetAddress;
    int? pincodeId;

    ReqManageAddress({
        this.addressId,
        this.addressType,
        this.streetAddress,
        this.pincodeId,
    });

    factory ReqManageAddress.fromJson(Map<String, dynamic> json) => ReqManageAddress(
        addressId: json["addressId"],
        addressType: json["addressType"],
        streetAddress: json["streetAddress"],
        pincodeId: json["PincodeId"],
    );

    Map<String, dynamic> toJson() => {
        "addressId": addressId,
        "addressType": addressType,
        "streetAddress": streetAddress,
        "PincodeId": pincodeId,
    };
}
