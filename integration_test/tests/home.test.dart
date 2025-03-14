import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test_example/utils/widget_keys.dart';
import '../components/finder.dart';
import '../pages/clickMe.page.dart';
import '../pages/home.page.dart';
import '../pages/tapMe.page.dart';
import '../init_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('Home End to End Test', () {
    testWidgets('Verify Screen UI validations', (WidgetTester tester) async {
      await initTest(tester);
      final homePage = HomePage(tester);

      expect(await homePage.isClickMeButtonPresent(), true,
          reason: "Click Me Button not present");
      expect(await homePage.isTapMeButtonPresent(), true,
          reason: "Tap Me Button not present");

      await homePage.wait(timeInSec: 1);
    });

    testWidgets('Validate Navigation to ClickMe page',
        (WidgetTester tester) async {
      await initTest(tester);
      final homePage = HomePage(tester);
      final clickMePage = ClickMePage(tester);

      await homePage.navigateToClickMeButton();
      await homePage.wait(timeInSec: 2);

      expect(await clickMePage.isUserNavigated(), true);
    });

    testWidgets('Validate Navigation to TapMe page',
        (WidgetTester tester) async {
      await initTest(tester);
      final homePage = HomePage(tester);
      final tapMePage = TapMePage(tester);

      await homePage.navigateToTapMeButton();
      await homePage.wait(timeInSec: 2);

      expect(await tapMePage.isUserNavigated(), true);
    });

    testWidgets('Validate Login', (WidgetTester tester) async {
      await initTest(tester);
      final homePage = HomePage(tester);
      final clickMePage = ClickMePage(tester);

      final userNameField = findByKey(WidgetKeys.userNameTextField);
      final passwordFile = findByKey(WidgetKeys.passwordTextField);
      await homePage.setValue(userNameField, 'ta');
      await homePage.setValue(passwordFile, '123');

      await homePage.tapLoginButton();
      await homePage.wait(timeInSec: 2);

      expect(await clickMePage.isUserNavigated(), true);
    });
  });
}
