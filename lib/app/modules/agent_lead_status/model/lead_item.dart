class AgentLeadItemModel {
  AgentLeadItemModel({
    required this.username,
    required this.email,
    this.userImage,
    required this.policy,
    required this.date,
    required this.location,
    this.status = 1,
    this.isHaveStatus = true,
  });

  String username;
  String email;
  final userImage;
  String policy;
  int status;
  bool isHaveStatus;
  String date;
  String location;
}
