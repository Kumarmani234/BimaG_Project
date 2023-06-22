class InsurePlanModel {
  bool isSelected;
  String title;
  String subtitle;
  String priceTime;
  int tabId;
  InsurePlanModel({
    this.isSelected = false,
    required this.title,
    required this.subtitle,
    required this.priceTime,
    required this.tabId,
  });
}
