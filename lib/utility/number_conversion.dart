const zero = "zero";
const oneToNine = [
  "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"
];

const tenToNinteen = [
  "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"
];

const dozens = [
  "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"
];

String solution(int number) {
  if(number == 0) {
    return zero;
  }
  return generate(number).trim();
}

String generate(int number) {
  if(number >= 1000000000) {
    return generate(number ~/ 1000000000) + " billion " + generate(number % 1000000000);
  }
  else if(number >= 1000000) {
    return generate(number ~/ 1000000) + " million " + generate(number % 1000000);
  }
  else if(number >= 1000) {
    return generate(number ~/ 1000) + " thousand " + generate(number % 1000);
  }
  else if(number >= 100) {
    return generate(number ~/ 100) + " hundred " + generate(number % 100);
  }
  return generate1To99(number);
}

String generate1To99(int number) {
  if (number == 0) {
    return "";
  }
  else if (number <= 9) {
    return oneToNine[number - 1];
  }
  else if (number <= 19) {
    return tenToNinteen[number % 10];
  }
  else {
    return dozens[number ~/ 10 - 1] + " " + generate1To99(number % 10);
  }
}