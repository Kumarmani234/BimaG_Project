// To parse this JSON data, do
//
//     final resVerifyVehicleDetails = resVerifyVehicleDetailsFromJson(jsonvar);

import 'dart:convert';

ResVerifyVehicleDetails resVerifyVehicleDetailsFromJson(String str) => ResVerifyVehicleDetails.fromJson(json.decode(str));

String resVerifyVehicleDetailsToJson(ResVerifyVehicleDetails data) => json.encode(data.toJson());

class ResVerifyVehicleDetails {
    int code;
    int subcode;
    dynamic message;
    Data data;

    ResVerifyVehicleDetails({
        required this.code,
        required this.subcode,
        this.message,
        required this.data,
    });

    factory ResVerifyVehicleDetails.fromJson(Map<String, dynamic> json) => ResVerifyVehicleDetails(
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
    var clientId;
    var rcNumber;
    var registrationDate;
    var ownerName;
    var fatherName;
    var presentAddress;
    var permanentAddress;
    var mobileNumber;
    var vehicleCategory;
    var vehicleChasiNumber;
    var vehicleEngineNumber;
    var makerDescription;
    var makerModel;
    var bodyType;
    var fuelType;
    var color;
    var normsType;
    var fitUpTo;
    var financer;
    var financed;
    var insuranceCompany;
    var insurancePolicyNumber;
    var insuranceUpto;
    var manufacturingDate;
    var registeredAt;
    var latestBy;
    bool lessInfo;
    var taxUpto;
    var taxPaidUpto;
    var cubicCapacity;
    var vehicleGrossWeight;
    var noCylinders;
    var seatCapacity;
    var sleeperCapacity;
    var standingCapacity;
    var wheelbase;
    var unladenWeight;
    var vehicleCategoryDescription;
    var puccNumber;
    var puccUpto;
    var permitNumber;
    var permitIssueDate;
    var permitValidFrom;
    var permitValidUpto;
    var permitType;
    var nationalPermitNumber;
    var nationalPermitUpto;
    var nationalPermitIssuedBy;
    var nonUseStatus;
    var nonUseFrom;
    var nonUseTo;
    var blacklistStatus;
    var nocDetails;
    var ownerNumber;
    var rcStatus;
    bool maskedName;
    var challanDetails;
    var variant;

    Data({
        required this.clientId,
        required this.rcNumber,
        required this.registrationDate,
        required this.ownerName,
        required this.fatherName,
        required this.presentAddress,
        required this.permanentAddress,
        required this.mobileNumber,
        required this.vehicleCategory,
        required this.vehicleChasiNumber,
        required this.vehicleEngineNumber,
        required this.makerDescription,
        required this.makerModel,
        required this.bodyType,
        required this.fuelType,
        required this.color,
        required this.normsType,
        required this.fitUpTo,
        required this.financer,
        required this.financed,
        required this.insuranceCompany,
        required this.insurancePolicyNumber,
        required this.insuranceUpto,
        required this.manufacturingDate,
        required this.registeredAt,
        required this.latestBy,
        required this.lessInfo,
        required this.taxUpto,
        required this.taxPaidUpto,
        required this.cubicCapacity,
        required this.vehicleGrossWeight,
        required this.noCylinders,
        required this.seatCapacity,
        required this.sleeperCapacity,
        required this.standingCapacity,
        required this.wheelbase,
        required this.unladenWeight,
        required this.vehicleCategoryDescription,
        required this.puccNumber,
        required this.puccUpto,
        required this.permitNumber,
        required this.permitIssueDate,
        required this.permitValidFrom,
        required this.permitValidUpto,
        required this.permitType,
        required this.nationalPermitNumber,
        required this.nationalPermitUpto,
        required this.nationalPermitIssuedBy,
        required this.nonUseStatus,
        required this.nonUseFrom,
        required this.nonUseTo,
        required this.blacklistStatus,
        required this.nocDetails,
        required this.ownerNumber,
        required this.rcStatus,
        required this.maskedName,
        required this.challanDetails,
        required this.variant,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        clientId: json["client_id"],
        rcNumber: json["rc_number"],
        registrationDate: json["registration_date"],
        ownerName: json["owner_name"],
        fatherName: json["father_name"],
        presentAddress: json["present_address"],
        permanentAddress: json["permanent_address"],
        mobileNumber: json["mobile_number"],
        vehicleCategory: json["vehicle_category"],
        vehicleChasiNumber: json["vehicle_chasi_number"],
        vehicleEngineNumber: json["vehicle_engine_number"],
        makerDescription: json["maker_description"],
        makerModel: json["maker_model"],
        bodyType: json["body_type"],
        fuelType: json["fuel_type"],
        color: json["color"],
        normsType: json["norms_type"],
        fitUpTo: json["fit_up_to"],
        financer: json["financer"],
        financed: json["financed"],
        insuranceCompany: json["insurance_company"],
        insurancePolicyNumber: json["insurance_policy_number"],
        insuranceUpto: json["insurance_upto"],
        manufacturingDate: json["manufacturing_date"],
        registeredAt: json["registered_at"],
        latestBy: json["latest_by"],
        lessInfo: json["less_info"],
        taxUpto: json["tax_upto"],
        taxPaidUpto: json["tax_paid_upto"],
        cubicCapacity: json["cubic_capacity"],
        vehicleGrossWeight: json["vehicle_gross_weight"],
        noCylinders: json["no_cylinders"],
        seatCapacity: json["seat_capacity"],
        sleeperCapacity: json["sleeper_capacity"],
        standingCapacity: json["standing_capacity"],
        wheelbase: json["wheelbase"],
        unladenWeight: json["unladen_weight"],
        vehicleCategoryDescription: json["vehicle_category_description"],
        puccNumber: json["pucc_number"],
        puccUpto: json["pucc_upto"],
        permitNumber: json["permit_number"],
        permitIssueDate: json["permit_issue_date"],
        permitValidFrom: json["permit_valid_from"],
        permitValidUpto: json["permit_valid_upto"],
        permitType: json["permit_type"],
        nationalPermitNumber: json["national_permit_number"],
        nationalPermitUpto: json["national_permit_upto"],
        nationalPermitIssuedBy: json["national_permit_issued_by"],
        nonUseStatus: json["non_use_status"],
        nonUseFrom: json["non_use_from"],
        nonUseTo: json["non_use_to"],
        blacklistStatus: json["blacklist_status"],
        nocDetails: json["noc_details"],
        ownerNumber: json["owner_number"],
        rcStatus: json["rc_status"],
        maskedName: json["masked_name"],
        challanDetails: json["challan_details"],
        variant: json["variant"],
    );

    Map<String, dynamic> toJson() => {
        "client_id": clientId,
        "rc_number": rcNumber,
        "registration_date": registrationDate,
        "owner_name": ownerName,
        "father_name": fatherName,
        "present_address": presentAddress,
        "permanent_address": permanentAddress,
        "mobile_number": mobileNumber,
        "vehicle_category": vehicleCategory,
        "vehicle_chasi_number": vehicleChasiNumber,
        "vehicle_engine_number": vehicleEngineNumber,
        "maker_description": makerDescription,
        "maker_model": makerModel,
        "body_type": bodyType,
        "fuel_type": fuelType,
        "color": color,
        "norms_type": normsType,
        "fit_up_to": fitUpTo,
        "financer": financer,
        "financed": financed,
        "insurance_company": insuranceCompany,
        "insurance_policy_number": insurancePolicyNumber,
        "insurance_upto": insuranceUpto,
        "manufacturing_date": manufacturingDate,
        "registered_at": registeredAt,
        "latest_by": latestBy,
        "less_info": lessInfo,
        "tax_upto": taxUpto,
        "tax_paid_upto": taxPaidUpto,
        "cubic_capacity": cubicCapacity,
        "vehicle_gross_weight": vehicleGrossWeight,
        "no_cylinders": noCylinders,
        "seat_capacity": seatCapacity,
        "sleeper_capacity": sleeperCapacity,
        "standing_capacity": standingCapacity,
        "wheelbase": wheelbase,
        "unladen_weight": unladenWeight,
        "vehicle_category_description": vehicleCategoryDescription,
        "pucc_number": puccNumber,
        "pucc_upto": puccUpto,
        "permit_number": permitNumber,
        "permit_issue_date": permitIssueDate,
        "permit_valid_from": permitValidFrom,
        "permit_valid_upto": permitValidUpto,
        "permit_type": permitType,
        "national_permit_number": nationalPermitNumber,
        "national_permit_upto": nationalPermitUpto,
        "national_permit_issued_by": nationalPermitIssuedBy,
        "non_use_status": nonUseStatus,
        "non_use_from": nonUseFrom,
        "non_use_to": nonUseTo,
        "blacklist_status": blacklistStatus,
        "noc_details": nocDetails,
        "owner_number": ownerNumber,
        "rc_status": rcStatus,
        "masked_name": maskedName,
        "challan_details": challanDetails,
        "variant": variant,
    };
}
