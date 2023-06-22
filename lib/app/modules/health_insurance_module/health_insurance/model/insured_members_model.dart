class InsuredMembersModel {
  String memberType, age;
  bool isSelected;
  bool isChild;

  int id, childCount;

  InsuredMembersModel({
    required this.id,
    required this.memberType,
    this.isSelected = false,
    this.isChild = false,
    this.age = '',
    this.childCount = 1,
  });
}
