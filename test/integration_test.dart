import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:workout/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // Mock path_provider
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (methodCall) async => 'test');

  testWidgets('App allows creating a new workout and saving it',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(); // Wait for the app to load

    // Check if Workout List to be on the main screen
    expect(find.text('Workout List'), findsOneWidget,
        reason: 'The workout list should be visible after loading.');

    // Check for FloatingActionButton (FAB) to add a workout
    final fab = find.byType(FloatingActionButton);
    expect(fab, findsOneWidget,
        reason: 'FAB should be present to add a new workout.');
    await tester.tap(fab);
    await tester.pumpAndSettle();

    // Verify the 'New Workout' screen is displayed
    expect(find.text('New Workout'), findsOneWidget);

    // Verify the default set with exercise 'Bench press' has been added
    expect(find.text('Bench press'), findsOneWidget);

    // Tap the DropdownButton to open it
    final dropdownFinder = find.byKey(const Key('exercise-button'));
    expect(dropdownFinder, findsOneWidget);
    await tester.tap(dropdownFinder); // Tap to open the dropdown
    await tester.pumpAndSettle(); // Wait for the dropdown to appear

    // Select a new option from the dropdown (e.g., 'Deadlift')
    await tester
        .tap(find.text('Deadlift').last); // Find and tap the 'Deadlift' option
    await tester.pumpAndSettle(); // Wait for the dropdown to close and update

    // Verify that the selected exercise is now 'Deadlift'
    expect(find.text('Deadlift'), findsOneWidget);
    // Tap the Save button to save the workout
    final saveButton = find.byIcon(Icons.save);
    expect(saveButton, findsOneWidget);
    await tester.tap(saveButton);
    await tester.pumpAndSettle();

    // Verify that the workout is saved and the user is navigated back to the workout list
    expect(find.text('Workout List'), findsOneWidget);
    expect(find.text('Workout 1'),
        findsOneWidget); // Assuming the workout is labeled as 'Workout 1'
  });
}
