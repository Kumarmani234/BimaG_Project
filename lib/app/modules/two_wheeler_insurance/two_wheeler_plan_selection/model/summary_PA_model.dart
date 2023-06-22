class SummaryPAModel {
  String title;
  String price;
  int id;
  bool isChecked;

  SummaryPAModel({
    required this.title,
    required this.price,
    required this.id,
    this.isChecked = false,
  });
}
