class HealthProppsalTab {
  bool isActive;
  String tabName;
  int tabId;
  HealthProppsalTab({
    required this.tabName,
    required this.tabId,
    this.isActive = false,
  });

  bool get isFilled => true;
}
