// To parse this JSON data, do
//
//     final resNameIdList = resNameIdListFromJson(jsonString);

import 'dart:convert';

ResNameIdList resNameIdListFromJson(String str) => ResNameIdList.fromJson(json.decode(str));

String resNameIdListToJson(ResNameIdList data) => json.encode(data.toJson());

class ResNameIdList {
    String? name;
    String? id;

    ResNameIdList({
        this.name,
        this.id,
    });

    factory ResNameIdList.fromJson(Map<String, dynamic> json) => ResNameIdList(
        name: json["name"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
    };
}
