// To parse this JSON data, do
//
//     final reqManageVehicle = reqManageVehicleFromJson(jsonString);

import 'dart:convert';

ReqManageVehicle reqManageVehicleFromJson(String str) => ReqManageVehicle.fromJson(json.decode(str));

String reqManageVehicleToJson(ReqManageVehicle data) => json.encode(data.toJson());

class ReqManageVehicle {
    String? registrationNumber;
    String? type;
    String? model;
    String? make;
    String? registrationYear;
    String? variant;
    String? fuelType;
    String? policyExpiryDate;
    int? vehicleId;

    ReqManageVehicle({
        this.registrationNumber,
        this.type,
        this.model,
        this.make,
        this.registrationYear,
        this.variant,
        this.fuelType,
        this.policyExpiryDate,
        this.vehicleId
    });

    factory ReqManageVehicle.fromJson(Map<String, dynamic> json) => ReqManageVehicle(
        registrationNumber: json["registrationNumber"],
        type: json["type"],
        model: json["model"],
        make: json["make"],
        registrationYear: json["registrationYear"],
        variant: json["variant"],
        fuelType: json["fuelType"],
        policyExpiryDate: json["policyExpiryDate"],
        vehicleId: json["vehicleId"]
    );

    Map<String, dynamic> toJson() => {
        "registrationNumber": registrationNumber,
        "type": type,
        "model": model,
        "make": make,
        "registrationYear": registrationYear,
        "variant": variant,
        "fuelType": fuelType,
        "policyExpiryDate": policyExpiryDate,
        "vehicleId": vehicleId
    };
}
