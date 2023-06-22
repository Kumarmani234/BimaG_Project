class FormFieldValidExpression {
  RegExp alphaNumValid = RegExp(r'^[a-zA-Z0-9]+$'); // alphabets and numeric

  RegExp ageValid = RegExp(r'^[1-9][0-9]?$|^1[0-0][0-9]$|^110$'); // age

  RegExp charOnly = RegExp(r'^[a-zA-Z]+$'); // for alphabetic characters

  RegExp dateValid = RegExp(
      r'^\d{2}\/\d{2}\/\d{4}$'); // Regular expression for dates in the format dd/mm/yyyy

  RegExp dateValidExpression = RegExp(
      r'^\d{2} (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) \d{4}$'); // Regular expression for dates in the format like 02 Apr 2023

  RegExp emailValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'); //for eamil

  RegExp email = RegExp(r'\S+@\S+\.\S+'); //another optional email valid exp.

  RegExp mobileValid = RegExp(r'^[6-9]\d{9}$'); // contanct number validation

  RegExp nameValid = RegExp(r'^[a-zA-Z\s]+$'); // multiple strings only

  RegExp pancardValid = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$'); //pnacard

  RegExp pincodeValid = RegExp(r'^\d{6}$'); // pincode

  RegExp regularValid = RegExp(
      r'^[a-zA-Z0-9!@#$%^&*(),.?":{}|<>+_\-=[\]\\/]*$'); // allowed digit, char and special symbols

  RegExp regNumberValid = RegExp(
      r'^[A-Za-z]{2}-[0-9]{2}-[A-Za-z]{2}-[0-9]{4}$'); // registration number

  RegExp numberValid = RegExp(r'^[0-9]+$'); // number only

  RegExp alphanumSpaceValid = RegExp(
      r'^[a-zA-Z0-9\s]+$'); // allow digit, char and space but not special symbol

  RegExp rsValid = RegExp(r'^[0-9,]+$'); // allow only digit and comma

  RegExp propertyAgeValid =
      RegExp(r'^[0-7]?[0-5]?$'); // property age valid allow only digit <= 75
}
