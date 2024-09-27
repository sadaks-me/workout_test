import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout/models/workout.dart';
import 'package:workout/utils/constants.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WorkoutAdapter());
  Hive.registerAdapter(SetAdapter());
  await Hive.openBox<Workout>(workoutBoxName);
}
