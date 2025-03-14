import 'package:flutter_test/flutter_test.dart';

class Page {
  late WidgetTester _tester;

  /// Constructor: Initializes the Page object with a WidgetTester instance
  Page(WidgetTester tester) {
    _tester = tester;
  }

  /// Taps on an element identified by the provided Finder.
  /// [finder]: The Finder object used to locate the widget to tap on.
  /// This method simulates a user tap on the widget and does not automatically
  /// update the UI; you may need to call pump() or pumpAndSettle() afterward.
  Future<void> tapOnElement(Finder finder) async {
    await _tester.tap(finder);
  }

  /// Waits for a specified amount of time by pumping a single frame with a duration.
  /// [timeInSec]: The number of seconds to wait (defaults to 2 seconds).
  /// This method advances the test clock by the specified duration and renders
  /// a single frame, useful for testing time-based changes like animations or delays.
  Future<void> wait({int timeInSec = 2}) async {
    await _tester.pump(Duration(seconds: timeInSec));
  }

  /// Sets a text value in an input field (e.g., TextField) identified by the Finder.
  /// [finder]: The Finder object used to locate the text input widget.
  /// [textToSet]: The text to enter into the input field.
  /// This method simulates user input by typing the provided text into the field.
  Future<void> setValue(Finder finder, String textToSet) async {
    await _tester.enterText(finder, textToSet);
  }

  /// Checks if an element identified by the Finder exists in the widget tree.
  /// [finder]: The Finder object used to locate the widget.
  /// Returns true if at least one matching widget is found, false otherwise.
  /// Useful for verifying the presence of UI elements before interacting with them.
  Future<bool> isElementPresent(Finder finder) async {
    return _tester.any(finder);
  }

  // --- Additional commonly used methods ---

  /// Waits until the UI settles, meaning no more frames are scheduled.
  /// This method continuously pumps frames until all animations, timers, and
  /// asynchronous tasks are complete. Useful for testing the final state after
  /// an action that triggers multiple UI updates.
  Future<void> waitUntilSettled() async {
    await _tester.pumpAndSettle();
  }

  /// Drags an element identified by the Finder by a specified offset.
  /// [finder]: The Finder object used to locate the widget to drag.
  /// [dx]: The horizontal distance to drag (positive = right, negative = left).
  /// [dy]: The vertical distance to drag (positive = down, negative = up).
  /// Simulates a drag gesture, often used for testing scrollable widgets or sliders.
  Future<void> dragElement(Finder finder, {double dx = 0.0, double dy = 0.0}) async {
    await _tester.drag(finder, Offset(dx, dy));
  }

  /// Pumps a single frame to update the UI without waiting for a duration.
  /// This is useful for manually triggering a UI refresh after an action,
  /// such as a tap or state change, when you don't need to simulate time passing.
  Future<void> refreshUI() async {
    await _tester.pump();
  }

  /// Verifies that an element identified by the Finder is visible and matches expectations.
  /// [finder]: The Finder object used to locate the widget.
  /// Throws a test failure if the element is not found (i.e., findsNothing).
  /// Useful for asserting that a specific widget is present in the UI.
  Future<void> verifyElementExists(Finder finder) async {
    expect(_tester.any(finder), isTrue, reason: 'Element not found: $finder');
  }
}