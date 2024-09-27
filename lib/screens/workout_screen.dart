import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:workout/models/workout.dart';
import 'package:workout/providers/workout_provider.dart';
import 'package:workout/widgets/circle_plus_button.dart';
import 'package:workout/widgets/set_tile.dart';

class WorkoutScreen extends StatelessWidget {
  static const path = '/workout';
  final Workout workout;
  final int? workoutIndex;

  const WorkoutScreen({super.key, required this.workout, this.workoutIndex});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: WorkoutProvider(initialSets: workout.sets),
      child: Consumer<WorkoutProvider>(
        builder: (context, provider, _) => Scaffold(
          appBar: AppBar(
            title: Text(
              workoutIndex == null ? 'New Workout' : 'Edit Workout',
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  provider.saveWorkout(index: workoutIndex);
                  context.pop();
                },
              ),
            ],
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            children: [
              ...provider.sets.indexed.map((i) {
                var index = i.$1;
                var set = i.$2;
                return SetTile(
                  set: set,
                  index: index,
                  onExerciseChanged: (value) {
                    if (value != null) {
                      provider.updateSet(
                          index, value, set.weight, set.repetitions);
                    }
                  },
                  onWeightChanged: (value) {
                    if (value != null) {
                      provider.updateSet(
                          index, set.exercise, value, set.repetitions);
                    }
                  },
                  onRepChanged: (value) {
                    if (value != null) {
                      provider.updateSet(
                          index, set.exercise, set.weight, value);
                    }
                  },
                  onRemoved: () => provider.removeSet(index),
                );
              }),
              Align(
                alignment: Alignment.centerLeft,
                child: CirclePlusButton(onPressed: provider.addSet),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
