// To parse this JSON data, do
//
//     final resGetVehicles = resGetVehiclesFromJson(jsonString);

import 'dart:convert';

ResGetVehicles resGetVehiclesFromJson(String str) => ResGetVehicles.fromJson(json.decode(str));

String resGetVehiclesToJson(ResGetVehicles data) => json.encode(data.toJson());

class ResGetVehicles {
    int code;
    int subcode;
    dynamic message;
    Data data;

    ResGetVehicles({
        required this.code,
        required this.subcode,
        this.message,
        required this.data,
    });

    factory ResGetVehicles.fromJson(Map<String, dynamic> json) => ResGetVehicles(
        code: json["code"],
        subcode: json["subcode"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "subcode": subcode,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    List<Vehicle> vehicles;
    Pagination pagination;

    Data({
        required this.vehicles,
        required this.pagination,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        vehicles: List<Vehicle>.from(json["vehicles"].map((x) => Vehicle.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "vehicles": List<dynamic>.from(vehicles.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
    };
}

class Pagination {
    int totalRecords;
    bool nextPage;

    Pagination({
        required this.totalRecords,
        required this.nextPage,
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

class Vehicle {
    int vehicleId;
    String registrationNumber;
    int type;
    int make;
    int model;
    int variant;
    int fuelType;
    String registrationYear;
    DateTime policyExpiryDate;
    String vehicleCompanyName;
    String vehicleVarientName;
    String vehicleModelName;
    String fuelTypeName;

    Vehicle({
        required this.vehicleId,
        required this.registrationNumber,
        required this.type,
        required this.make,
        required this.model,
        required this.variant,
        required this.fuelType,
        required this.registrationYear,
        required this.policyExpiryDate,
        required this.vehicleCompanyName,
        required this.vehicleVarientName,
        required this.vehicleModelName,
        required this.fuelTypeName,
    });

    factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        vehicleId: json["vehicleId"],
        registrationNumber: json["registrationNumber"],
        type: json["type"],
        make: json["make"],
        model: json["model"],
        variant: json["variant"],
        fuelType: json["fuelType"],
        registrationYear: json["registrationYear"],
        policyExpiryDate: DateTime.parse(json["policyExpiryDate"]),
        vehicleCompanyName: json["vehicleCompanyName"],
        vehicleVarientName: json["vehicleVarientName"],
        vehicleModelName: json["vehicleModelName"],
        fuelTypeName: json["fuelTypeName"],
    );

    Map<String, dynamic> toJson() => {
        "vehicleId": vehicleId,
        "registrationNumber": registrationNumber,
        "type": type,
        "make": make,
        "model": model,
        "variant": variant,
        "fuelType": fuelType,
        "registrationYear": registrationYear,
        "policyExpiryDate": policyExpiryDate.toIso8601String(),
        "vehicleCompanyName": vehicleCompanyName,
        "vehicleVarientName": vehicleVarientName,
        "vehicleModelName": vehicleModelName,
        "fuelTypeName": fuelTypeName,
    };
}
