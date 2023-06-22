class TabsComparePlanModel{
  bool isActive;
  String tabName;
  int tabId;
  TabsComparePlanModel({
    required this.tabName,
    required this.tabId,
    this.isActive = false,
  });
}