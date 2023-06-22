// To parse this JSON data, do
//
//     final reqGetBikeQuoteDetails = reqGetBikeQuoteDetailsFromJson(jsonString);

import 'dart:convert';

ReqGetBikeQuoteDetails reqGetBikeQuoteDetailsFromJson(String str) => ReqGetBikeQuoteDetails.fromJson(json.decode(str));

String reqGetBikeQuoteDetailsToJson(ReqGetBikeQuoteDetails data) => json.encode(data.toJson());

class ReqGetBikeQuoteDetails {
    String? registrationNumber;
    Filter? filter;
    int? vehilceType;

    ReqGetBikeQuoteDetails({
        this.registrationNumber,
        this.filter,
        this.vehilceType
    });

    factory ReqGetBikeQuoteDetails.fromJson(Map<String, dynamic> json) => ReqGetBikeQuoteDetails(
        registrationNumber: json["registrationNumber"],
        vehilceType: json["vehilceType"],
        filter: json["filter"] == null ? null : Filter.fromJson(json["filter"]),
    );

    Map<String, dynamic> toJson() => {
        "registrationNumber": registrationNumber,
        "vehilceType": vehilceType,
        "filter": filter?.toJson(),
    };
}

class Filter {
    int? isCommercial;
    int? sortStrategy;
    NoClaimBonus? noClaimBonus;
    int? currentPolicyExpired;
    int? policyCover;

    Filter({
        this.isCommercial,
        this.sortStrategy,
        this.noClaimBonus,
        this.currentPolicyExpired,
        this.policyCover,
    });

    factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        isCommercial: json["isCommercial"],
        sortStrategy: json["sortStrategy"],
        noClaimBonus: json["noClaimBonus"] == null ? null : NoClaimBonus.fromJson(json["noClaimBonus"]),
        currentPolicyExpired: json["currentPolicyExpired"],
        policyCover: json["policyCover"],
    );

    Map<String, dynamic> toJson() => {
        "isCommercial": isCommercial,
        "sortStrategy": sortStrategy,
        "noClaimBonus": noClaimBonus?.toJson(),
        "currentPolicyExpired": currentPolicyExpired,
        "policyCover": policyCover,
    };
}

class NoClaimBonus {
    bool? currentApplicableNcb;
    bool? previousYearNcb;
    bool? lastPolicyClaim;

    NoClaimBonus({
        this.currentApplicableNcb,
        this.previousYearNcb,
        this.lastPolicyClaim,
    });

    factory NoClaimBonus.fromJson(Map<String, dynamic> json) => NoClaimBonus(
        currentApplicableNcb: json["currentApplicableNCB"],
        previousYearNcb: json["previousYearNCB"],
        lastPolicyClaim: json["lastPolicyClaim"],
    );

    Map<String, dynamic> toJson() => {
        "currentApplicableNCB": currentApplicableNcb,
        "previousYearNCB": previousYearNcb,
        "lastPolicyClaim": lastPolicyClaim,
    };
}
