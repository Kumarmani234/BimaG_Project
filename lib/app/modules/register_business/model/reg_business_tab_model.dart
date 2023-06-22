class RegisterBusinessTabModel {
  bool isActive;
  String tabName;
  int tabId;
  RegisterBusinessTabModel({
    required this.tabName,
    required this.tabId,
    this.isActive = false,
  });
}
