# ## Run all tests
# flutter test integration_test/tests/*.dart

# ## Run Single File
# flutter test integration_test/tests/home.test.dart
# flutter drive --driver=test_driver/integration_test.dart --target=integration_test/tests/home.test.dart

# ## Run with export report
# flutter test integration_test/tests/home.test.dart --file-reporter json:report_integration_test.json | tee output_console.log

# ## Run test with gradlew
# ./gradlew app:connectedAndroidTest -Ptarget=`pwd`/../integration_test/tests/home.test.dart
