class HealthTabsModel {
  bool isActive;
  String tabName;
  int tabId;
  HealthTabsModel({
    required this.tabName,
    required this.tabId,
    this.isActive = false,
  });
}
