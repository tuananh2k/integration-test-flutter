import 'package:integration_test/integration_test_driver.dart';

import '../integration_test/utils/permissions_util.dart';

Future<void> main() {
  PermissionsUtil.grantPermissions();
  return integrationDriver();
}
