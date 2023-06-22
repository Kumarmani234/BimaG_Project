class InsurerItemModel {
  InsurerItemModel({
    required this.username,
    required this.email,
    this.userImage,
    required this.pending,
    required this.total,
    required this.date,
    required this.location,
    // this.expired = false,
  });

  String username;
  String email;
  final userImage;
  int pending;
  int total;
  String date;
  String location;
  // bool expired;
}
