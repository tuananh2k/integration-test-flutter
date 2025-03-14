# Build the Flutter Android app
pushd android
# flutter build generates files in android/ for building the app
flutter build apk
./gradlew app:assembleAndroidTest
./gradlew app:assembleDebug -Ptarget=`pwd`/../integration_test/tests/home.test.dart
popd

# Write the environment variable in base64 into a JSON file
#echo $GCLOUD_KEY_FILE | base64 --decode > outfile.txt

# Using the gcloud CLI (preinstalled on Codemagic) authenticate using the service account key
#gcloud auth activate-service-account --key-file=./orbital-heaven-452110-v9-59cfec929ed0.json

# Select YOUR Firebase project through which want to run the tests
gcloud --quiet config set project integration-test-flutter-881d5

# Run the Flutter integration tests as if they were regular Android instrumentation tests
gcloud firebase test android run \
  --type instrumentation \
  --app build/app/outputs/apk/debug/app-debug.apk \
  --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk\
  --timeout 2m