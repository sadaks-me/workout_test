import 'package:hive/hive.dart';

part 'workout.g.dart';

@HiveType(typeId: 0)
class Set {
  @HiveField(0)
  final String exercise;

  @HiveField(1)
  final double weight;

  @HiveField(2)
  final int repetitions;

  const Set(this.exercise, this.weight, this.repetitions);
}

@HiveType(typeId: 1)
class Workout {
  @HiveField(0)
  final List<Set> sets;

  const Workout(this.sets);
}