class TicketsPolicyModel {
  TicketsPolicyModel({
    required this.planName,
    required this.planCompanyName,
    required this.companyImage,
    required this.raised_date,
    required this.ticket_id,
    required this.status,
    this.expired = false,
  });

  String planName;
  String planCompanyName;
  String companyImage;
  String raised_date;
  String ticket_id;
  String status;
  bool expired;
}
