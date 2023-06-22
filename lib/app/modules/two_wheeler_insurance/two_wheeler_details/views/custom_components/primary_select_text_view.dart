import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../utility/ts.dart';

class PrimarySelectTextView extends GetView {
  final String primary_text;

  PrimarySelectTextView({required this.primary_text});
  @override
  Widget build(BuildContext context) {
    return Text(
      primary_text,
      style: Ts.bold15(
        Color(0xFF0A0A26),
      ),
    );
  }
}
