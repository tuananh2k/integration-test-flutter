import 'dart:io';

class PermissionsUtil {
  static const packageNameIOS = 'com.example.integration_test_example';
  static const packageNameAndroid =
      'com.tuananh.it_test.integration_test_example';

  static void grantPermissions() {
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
        'android.permission.READ_EXTERNAL_STORAGE',
        'android.permission.WRITE_EXTERNAL_STORAGE',
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
}
