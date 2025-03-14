# Flutter : Integration Testing Setup
# Documentation: 
- https://github.com/flutter/flutter/tree/main/packages/integration_test#android-device-testing
- https://blog.codemagic.io/codemagic-flutter-integration-tests-firebase-test-lab/
# Required:
- Java 17
- Flutter SDK
- Flutter Test & Flutter Integration Test SDK
- GCloud CLI
- Gradlew

## Setting Java 17
# Install Java 17
```bash
brew install openjdk@17
sudo ln -sfn $(brew --prefix openjdk@17)/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
```
# Check version Java installed
```bash
/usr/libexec/java_home -V
```
# Copy path of Java 17 into file `gradle.properties`
```
org.gradle.java.home=$PATH_TO_JAVA_HOME
android.suppressUnsupportedCompileSdk=34
```

## Setting Flutter SDK
```bash
flutter doctor
```
### Add Flutter SDK to PATH
```bash
export PATH="$PATH":"$HOME"/flutter/bin
```

## Setting Flutter Test & Flutter Integration Test SDK
```bash
flutter pub add flutter_test
flutter pub add flutter_integration_test
```

## Setting GCloud CLI
```bash
curl https://sdk.cloud.google.com | bash
```
### To init GCloud CLI
```bash
gcloud init
```
### To set project
```bash
gcloud config set project <project_id>
```

## To run IT test with Firebase Test Lab
```bash
chmod +x run_test.sh
./run_test.sh
```

## Topics Covered
- Introduction
- Pre-requisite
- How to Create Project
- Application Walk through
- Folder Structure Wal through
- Running Application - android, web
- Integration Test Setup
- Running Integration Test
- Report Integration
- Other Scope

### Introduction
A single platform for web, ios, android app.

### Pre-requisite
- | Flutter SDK Download | [https://docs.flutter.dev/get-started/install/macos]
- | Flutter Extension | [VS Code platform ]
- | Setup Test | ````flutter doctor ````

### How to Create Project
- Navigate to desired directory
- Run command ````flutter create <project name> ````
- Run command ````flutter pub get ````

### Application Walkthrough
A simple application with 2 pages and navigations on Button Click.
- Demo

https://user-images.githubusercontent.com/43808980/156377453-c40da18d-0925-4c8f-b16a-9037e044fbde.mp4


### Folder Structure Walkthrough
- lib folder
- android, ios, web etc folder
- pubspec.yaml file and pubspec-lock.ymal file
- dependency structure


### Running Application
- In Emulator
- In Web
-    To Run in web,, enable via - ````flutter config --enable-web ````
     and Reload the IDE.

### Integration Test Setup and Folder Structure
- Dependencies
- Current project folder structure
- Some basic of Dart,, Whatever we used in code
- Finders, BasePage, Widget Initialization, Page, Test
- How to develop the automation Script - Getting Locators
- Detailed of Finders, Test folder
- Test file walk through

### Running Integration Test
- Dependencies
- Running All Tests or A single File
- Run command ```` DEVICE=<device_name> ./testRunner.sh  ````

https://user-images.githubusercontent.com/43808980/156505597-ecab4b54-8845-48cd-9710-db36e1635957.mp4

### Reporting
- dot dart reporter
- junit reporter

## Running Test In FireBase in Parallel

https://user-images.githubusercontent.com/43808980/205088561-56bfe434-d66b-4360-94ec-fbf3d1b6fb43.mov


Stay Tunned for those configuration level details.

## 
