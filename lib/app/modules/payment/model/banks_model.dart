class BankModel{
  int id;
  String bankName, bankIcon;
  bool isSelected;

  BankModel({
     this.id = 0,
     required this.bankName,
     this.bankIcon = '',
     this.isSelected = false,
  });
}