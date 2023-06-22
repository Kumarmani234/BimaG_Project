// To parse this JSON data, do
//
//     final reqVerifyVehicleDetails = reqVerifyVehicleDetailsFromJson(jsonString);

import 'dart:convert';

ReqVerifyVehicleDetails reqVerifyVehicleDetailsFromJson(String str) => ReqVerifyVehicleDetails.fromJson(json.decode(str));

String reqVerifyVehicleDetailsToJson(ReqVerifyVehicleDetails data) => json.encode(data.toJson());

class ReqVerifyVehicleDetails {
    String registrationNumber;

    ReqVerifyVehicleDetails({
        required this.registrationNumber,
    });

    factory ReqVerifyVehicleDetails.fromJson(Map<String, dynamic> json) => ReqVerifyVehicleDetails(
        registrationNumber: json["RegistrationNumber"],
    );

    Map<String, dynamic> toJson() => {
        "RegistrationNumber": registrationNumber,
    };
}
