import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auto_insurance_controller.dart';

class AutoInsuranceView extends GetView<AutoInsuranceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AutoInsuranceView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AutoInsuranceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
