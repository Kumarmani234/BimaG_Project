class SystemInfoModel {
  SystemInfoModel({
    this.merchantKeyId,
    this.geoLocation,
    this.deviceId,
    this.deviceModel,
    this.mobileNo,
    this.deviceType,
    this.appVersion,
  });

  String? merchantKeyId;
  String? geoLocation;
  String? deviceId;
  String? deviceModel;
  String? mobileNo;
  String? deviceType;
  String? appVersion;

  Map<String, dynamic> toMap() {
    return {
      "merchantKeyId": merchantKeyId,
      "deviceId": deviceId,
      "deviceModel": deviceModel,
      "mobileNo": mobileNo,
      "deviceType": deviceType,
      "appVersion": appVersion,
      "geoLocation": geoLocation,
    };
  }

  static SystemInfoModel fromMap(Map<String, dynamic> map) {
    return SystemInfoModel(
        merchantKeyId: map["merchantKeyId"],
        deviceId: map["deviceId"],
        deviceModel: map["deviceModel"],
        mobileNo: map["mobileNo"],
        deviceType: map["deviceType"],
        appVersion: map["appVersion"],
        geoLocation: map["geoLocation"]);
  }
}
