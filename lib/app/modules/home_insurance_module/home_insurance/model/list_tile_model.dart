class ListTileModel {
  String title;
  String subtitle;
  bool isSelected;
  int id;
  String imageUrl;

  ListTileModel(
      {required this.title,
      required this.subtitle,
      this.isSelected = false,
      required this.id,
      required this.imageUrl});
}
