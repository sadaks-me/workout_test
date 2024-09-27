import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:workout/providers/workout_provider.dart';
import 'package:workout/screens/workout_screen.dart';
import 'package:workout/utils/constants.dart';
import 'package:workout/widgets/circle_plus_button.dart';

void main() {
  testWidgets('WorkoutScreen displays workout details and adds a new set',
      (WidgetTester tester) async {
    WidgetController.hitTestWarningShouldBeFatal = true;
    // Create a mock provider
    final mockProvider = WorkoutProvider(initialSets: [defaultSet]);

    await tester.pumpWidget(
      ChangeNotifierProvider<WorkoutProvider>.value(
        value: mockProvider,
        child: MaterialApp(
          home: WorkoutScreen(
            workout: defaultWorkout,
          ), // Testing a new workout creation
        ),
      ),
    );

    // Check if the default UI elements are displayed
    expect(find.text('New Workout'), findsOneWidget);
    expect(find.byType(CirclePlusButton), findsOneWidget);

    // Add a new set using the floating action button
    await tester.tap(find.byType(CirclePlusButton));
    await tester.pumpAndSettle();

    // Verify that a new set was added
    expect(mockProvider.sets.length, 1);
  });
}
