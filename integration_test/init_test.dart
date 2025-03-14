import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:integration_test_example/main.dart' as myapp;

Future<void> initTest(WidgetTester tester) async {
  myapp.main();
  await tester.pumpAndSettle();
  // grantPermissions();
}

void grantPermissions() {
  const packageNameIOS = 'com.example.integration_test_example';
  const packageNameAndroid = 'com.tuananh.it_test.integration_test_example';
  if (Platform.isIOS) {
    Process.run('xcrun', [
      'simctl',
      'privacy',
      'booted',
      'grant',
      'all',
      packageNameIOS,
    ]);
  } else if (Platform.isAndroid) {
    final permissions = [
      'android.permission.CAMERA',
    ];
    for (var permission in permissions) {
      Process.run('adb', [
        'shell',
        'pm',
        'grant',
        packageNameAndroid,
        permission,
      ]);
    }
  }
}
