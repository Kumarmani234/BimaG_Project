import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BottomSliderViewView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomSliderViewView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BottomSliderViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
