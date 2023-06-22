class WithdrawelDetailModel {
  WithdrawelDetailModel({
    required this.statusName,
    required this.date_n_time,
    this.status = 0,
  });

  String statusName;
  String date_n_time;
  int status;
}
