import 'package:hive/hive.dart';
import 'package:workout/models/workout.dart';

const workoutBoxName = 'workouts';
const List<String> exercises = [
  'Barbell row',
  'Bench press',
  'Shoulder press',
  'Deadlift',
  'Squat'
];
const List<double> weights = [
  2.5,
  5.0,
  7.5,
  10.0,
  12.5,
  15.0,
  20.0,
  30.0,
  40.0,
  50.0,
  60.0,
  70.0,
  80.0,
  90.0,
  100.0,
];
const List<int> repetitions = [5, 10, 15, 20, 25, 30, 40, 50, 100];

const defaultSet = Set('Bench press', 40, 10);
const defaultWorkout = Workout([defaultSet]);
Box<Workout> workoutBox = Hive.box<Workout>(workoutBoxName);
