class PolicyOptionModel{
  int id;
  String optionName;
  bool isSelected;
  PolicyOptionModel({this.isSelected = false, required this.id, required this.optionName});
}