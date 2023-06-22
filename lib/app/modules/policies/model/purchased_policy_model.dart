class PurchasedPolicyModel {
  PurchasedPolicyModel(
      {required this.planName,
      required this.planCompanyName,
      required this.companyImage,
      required this.productName,
      required this.sumInjured,
      required this.date,
      this.expired = false});

  String planName;
  String planCompanyName;
  String companyImage;
  String productName;
  String sumInjured;
  String date;
  bool expired;
}
