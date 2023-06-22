class FilterExpandModel{
  bool isExpanded;
  String filterName;
  int filterId;

  FilterExpandModel({
    this.isExpanded = false,
    required this.filterName,
    required this.filterId
  });
}