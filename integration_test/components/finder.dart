import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Basic Finders
Finder findByKey(String key) {
  return find.byKey(Key(key));
}

Finder findByText(String text) {
  return find.text(text);
}

Finder findByIcon(IconData icon) {
  return find.byIcon(icon);
}

Finder findByType(Type type) {
  return find.byType(type);
}

Finder findByWidget(Widget widget) {
  return find.byWidget(widget);
}

// Advanced Finders
Finder findByTooltip(String tooltip) {
  return find.byTooltip(tooltip);
}

Finder findDescendantText(Finder parent, String text) {
  return find.descendant(
    of: parent,
    matching: find.text(text),
  );
}

Finder findAncestorWidget(Finder child, Type ancestorType) {
  return find.ancestor(
    of: child,
    matching: find.byType(ancestorType),
  );
}

// Interaction Helpers
Future<void> tapWidget(WidgetTester tester, Finder finder) async {
  await tester.tap(finder);
  await tester.pumpAndSettle();
}

Future<void> enterText(WidgetTester tester, Finder finder, String text) async {
  await tester.enterText(finder, text);
  await tester.pumpAndSettle();
}

Future<void> scrollTo(WidgetTester tester, Finder finder,
    {double dx = 0.0, double dy = 100.0}) async {
  await tester.scrollUntilVisible(
    finder,
    dy,
    scrollable: find.byType(Scrollable).first,
  );
  await tester.pumpAndSettle();
}

// Verification Helpers
void expectExists(Finder finder, {String? reason}) {
  expect(finder, findsOneWidget, reason: reason);
}

void expectNotExists(Finder finder, {String? reason}) {
  expect(finder, findsNothing, reason: reason);
}

void expectMultiple(Finder finder, int count, {String? reason}) {
  expect(finder, findsNWidgets(count), reason: reason);
}

// Wait Helpers
Future<void> waitFor(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 10),
  Duration interval = const Duration(milliseconds: 100),
}) async {
  final end = DateTime.now().add(timeout);
  while (DateTime.now().isBefore(end)) {
    if (tester.any(finder)) {
      await tester.pumpAndSettle();
      return;
    }
    await tester.pump();
    await Future.delayed(interval);
  }
  throw Exception('Timed out waiting for $finder');
}

// Common test setup
Future<void> pumpApp(WidgetTester tester, Widget app) async {
  await tester.pumpWidget(MaterialApp(home: app));
  await tester.pumpAndSettle();
}

// Usage example:
/*
void main() {
  testWidgets('Example integration test', (WidgetTester tester) async {
    // Setup
    await pumpApp(tester, MyApp());

    // Find elements
    final buttonFinder = findByKey('submitButton');
    final textFieldFinder = findByType(TextField);

    // Verify initial state
    expectExists(buttonFinder);

    // Perform actions
    await enterText(tester, textFieldFinder, 'Hello');
    await tapWidget(tester, buttonFinder);

    // Verify results
    expectExists(findByText('Submitted: Hello'));
  });
}
*/
