import 'package:flutter_test/flutter_test.dart';
import 'package:workout/providers/workout_provider.dart';

void main() {
  group('WorkoutProvider Tests', () {
    late WorkoutProvider workoutProvider;

    setUp(() {
      workoutProvider = WorkoutProvider();
    });

    test('should add a new set', () {
      workoutProvider.addSet();
      expect(workoutProvider.sets.length, 1);
      expect(workoutProvider.sets[0].exercise, 'Bench press'); // Assuming 'Bench Press' is default
    });

    test('should update an existing set', () {
      workoutProvider.addSet(); // Add a default set

      workoutProvider.updateSet(0, 'Deadlift', 120.0, 8);
      expect(workoutProvider.sets[0].exercise, 'Deadlift');
      expect(workoutProvider.sets[0].weight, 120.0);
      expect(workoutProvider.sets[0].repetitions, 8);
    });

    test('should remove a set', () {
      workoutProvider.addSet(); // Add a default set
      expect(workoutProvider.sets.length, 1);

      workoutProvider.removeSet(0);
      expect(workoutProvider.sets.length, 0);
    });
  });
}