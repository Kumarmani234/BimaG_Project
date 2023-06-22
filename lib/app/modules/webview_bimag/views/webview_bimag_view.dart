import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/webview_bimag_controller.dart';

class WebviewBimagView extends GetView<WebviewBimagController> {
  const WebviewBimagView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebviewBimagView'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
