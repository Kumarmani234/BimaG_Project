import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PolicyOtherActivitiesView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PolicyOtherActivitiesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PolicyOtherActivitiesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
