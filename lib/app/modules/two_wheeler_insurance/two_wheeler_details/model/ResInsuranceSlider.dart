// To parse this JSON data, do
//
//     final resInsuranceSlider = resInsuranceSliderFromJson(jsonString);

import 'dart:convert';

ResInsuranceSlider resInsuranceSliderFromJson(String str) => ResInsuranceSlider.fromJson(json.decode(str));

String resInsuranceSliderToJson(ResInsuranceSlider data) => json.encode(data.toJson());

class ResInsuranceSlider {
    int? code;
    int? subcode;
    dynamic message;
    InsuranceSlider? data;

    ResInsuranceSlider({
        this.code,
        this.subcode,
        this.message,
        this.data,
    });

    factory ResInsuranceSlider.fromJson(Map<String, dynamic> json) => ResInsuranceSlider(
        code: json["code"],
        subcode: json["subcode"],
        message: json["message"],
        data: json["data"] == null ? null : InsuranceSlider.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "subcode": subcode,
        "message": message,
        "data": data?.toJson(),
    };
}

class InsuranceSlider {
    String? subTitle;
    String? title;
    List<String>? image;

    InsuranceSlider({
        this.subTitle,
        this.title,
        this.image,
    });

    factory InsuranceSlider.fromJson(Map<String, dynamic> json) => InsuranceSlider(
        subTitle: json["subTitle"],
        title: json["title"],
        image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "subTitle": subTitle,
        "title": title,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
    };
}
