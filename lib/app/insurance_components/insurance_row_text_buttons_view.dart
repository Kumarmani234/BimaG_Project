import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utility/ts.dart';

class InsuranceRowTextButtonsView extends GetView {
  InsuranceRowTextButtonsView(
      {required this.first_text,
      required this.second_text,
      required this.OnTapFirst,
      required this.OnTapSecond});

  final String first_text;
  final String second_text;
  final VoidCallback OnTapFirst;
  final VoidCallback OnTapSecond;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: OnTapFirst,
          child: Text(
            first_text,
            style: Ts.regular13(
              Color(0xFF4040FF),
            ),
          ),
        ),
        Spacer(),
        InkWell(
          onTap: OnTapSecond,
          child: Text(
            second_text,
            style: Ts.regular13(
              Color(0xFF4040FF),
            ),
          ),
        ),
      ],
    );
  }
}
