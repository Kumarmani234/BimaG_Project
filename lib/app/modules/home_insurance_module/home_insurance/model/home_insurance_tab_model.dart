class HomeTabModel {
  bool isActive;
  String tabName;
  int tabId;
  HomeTabModel({
    required this.tabName,
    required this.tabId,
    this.isActive = false,
  });
}
