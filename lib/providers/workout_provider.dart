import 'package:flutter/material.dart';
import 'package:workout/utils/constants.dart';

import '../models/workout.dart';

class WorkoutProvider with ChangeNotifier {
  WorkoutProvider({List<Set>? initialSets}) {
    if (initialSets != null) {
      _sets = List.from(initialSets);
    }
  }

  List<Set> _sets = [];

  List<Set> get sets => _sets;

  // Add a new set
  void addSet() {
    _sets.add(defaultSet);
    notifyListeners();
  }

  // Update an existing set
  void updateSet(int index, String exercise, double weight, int repetitions) {
    _sets[index] = Set(exercise, weight, repetitions);
    notifyListeners();
  }

  // Remove a set
  void removeSet(int index) {
    _sets.removeAt(index);
    notifyListeners();
  }

  // Save workout
  void saveWorkout({int? index}) {
    if (index == null) {
      workoutBox.add(Workout(sets));
    } else {
      workoutBox.putAt(index, Workout(sets));
    }
  }

  @override
  void dispose() {
    _sets.clear();
    super.dispose();
  }
}
