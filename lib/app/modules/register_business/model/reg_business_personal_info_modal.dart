class RegisterBusinessPerInfoModel {
  bool isSelected;
  String assetImage, title, subtitle;
  int id;
  RegisterBusinessPerInfoModel({
    this.isSelected = false,
    this.assetImage = '',
    this.title = '',
    this.subtitle = '',
    required this.id,
  });
}
