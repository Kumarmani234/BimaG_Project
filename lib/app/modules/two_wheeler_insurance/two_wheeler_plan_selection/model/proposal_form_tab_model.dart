class ProposalFormTab {
  bool isActive;
  String tabName;
  int tabId;
  ProposalFormTab({
    required this.tabName,
    required this.tabId,
    this.isActive = false,
  });

  bool get isFilled => true;
}
