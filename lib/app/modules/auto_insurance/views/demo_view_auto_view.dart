import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DemoViewAutoView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DemoViewAutoView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DemoViewAutoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
