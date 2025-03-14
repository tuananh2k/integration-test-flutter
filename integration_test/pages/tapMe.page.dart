import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test_example/utils/widget_keys.dart';

import '../components/finder.dart';
import 'base.page.dart';

class TapMePage extends Page {
  TapMePage(WidgetTester tester) : super(tester);

  Future<bool> isUserNavigated() async {
    final tapMePage = findByKey(WidgetKeys.tapMeButton);
    return isElementPresent(tapMePage);
  }
}
