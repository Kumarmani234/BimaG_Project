class OpenTicketModel {
  OpenTicketModel({
    required this.planName,
    required this.planCompanyName,
    required this.raised_date,
    required this.ticket_id,
    required this.status,
    this.isHaveTicketCount = false,
  });

  String planName;
  String planCompanyName;
  String raised_date;
  String ticket_id;
  String status;
  bool isHaveTicketCount;
}
