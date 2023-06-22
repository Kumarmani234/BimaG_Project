import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NoInternetConnectionView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'No Internet Connection',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
