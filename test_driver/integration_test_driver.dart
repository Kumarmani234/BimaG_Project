import 'dart:io';

import 'package:integration_test/integration_test_driver.dart';

Future<void> main() async{

  await Process.run('adb', [
    'shell',
    'pm',
    'grant',
    'com.bimag.app', //my app package
    'android.permission.ACCESS_COARSE_LOCATION'
  ]);
  await Process.run('adb', [
    'shell',
    'pm',
    'grant',
    'com.bimag.app', //my app package
    'android.permission.ACCESS_FINE_LOCATION'
  ]);
  await integrationDriver();
}