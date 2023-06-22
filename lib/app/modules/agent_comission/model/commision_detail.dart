class CommissionDetailModel {
  String title;
  String subtitle;
  String suffixText;
  String imgPath;
  int status;
  int id;

  CommissionDetailModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.suffixText,
    required this.imgPath,
    this.status = 1,
  });
}

/* status

0: total,
1: success/earn
2: pending
3: fial
*/
