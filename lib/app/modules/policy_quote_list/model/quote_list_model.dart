class QuoteListModel{
  var quoteId;
  var planImage, planIDV, claimSettled, planOriginalPrice, planDiscountedPrice;
  List<String> planDetailsList = [];
  bool isPlanSaved, isPlanSelectedForCompare;
  int insuranceCompany;

  QuoteListModel({
    required this.quoteId,
    required this.planImage,
    required this.planIDV,
    required this.claimSettled,
    required this.planOriginalPrice,
    required this.planDiscountedPrice,
    required this.planDetailsList,
    required this.isPlanSaved,
    required this.insuranceCompany,
    this.isPlanSelectedForCompare = false,
  });

}
