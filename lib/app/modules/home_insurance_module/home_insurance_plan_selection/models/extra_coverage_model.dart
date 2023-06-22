class ExtraCoverageModel {

  bool isChecked;

  String title;

  String price;

  String time;

  String mandatoryText;

  int id;




  ExtraCoverageModel({

  this.isChecked = false,

  required this.title,

  required this.price,

  this.time = "1 Year",

  this.mandatoryText = "PA cover is mandatory",

  required this.id,

  });

}