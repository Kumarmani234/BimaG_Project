class HomeProposalTabs {
  bool isActive;
  String tabName;
  int tabId;
  HomeProposalTabs({
    required this.tabName,
    required this.tabId,
    this.isActive = false,
  });

  bool get isFilled => true;
}
