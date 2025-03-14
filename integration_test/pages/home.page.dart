import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test_example/utils/widget_keys.dart';

import '../components/finder.dart';
import 'base.page.dart';

class HomePage extends Page {
  HomePage(WidgetTester tester) : super(tester);

  final _clickMeButton = findByText("Click Me!");
  final _tapMeButton = findByText("Tap Me!");
  final _loginButton = findByKey(WidgetKeys.loginButton);

  Future<bool> isClickMeButtonPresent() async {
    return isElementPresent(_clickMeButton);
  }

  Future<void> navigateToClickMeButton() async {
    await tapOnElement(_clickMeButton);
  }

  Future<bool> isTapMeButtonPresent() async {
    return isElementPresent(_tapMeButton);
  }

  Future<void> navigateToTapMeButton() async {
    await tapOnElement(_tapMeButton);
  }

  Future<void> inputTextField(Finder finder, String textToSet) async {
    await setValue(finder, textToSet);
  }

  Future<void> tapLoginButton() async {
    await tapOnElement(_loginButton);
  }
}
