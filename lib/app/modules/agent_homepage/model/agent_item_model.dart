class AgentItemModel {
  int id;
  int status;
  String title;
  String subtitle;
  String imgUrl;

  AgentItemModel({
    this.status = 1,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imgUrl,
  });
}

/* status

0: total,
1: success/earn
2: pending
3: fial
*/
