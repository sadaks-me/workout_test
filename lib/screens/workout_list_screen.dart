import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:workout/models/workout.dart';
import 'package:workout/utils/constants.dart';
import 'package:workout/widgets/workout_tile.dart';

import 'workout_screen.dart';

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({super.key});

  static const path = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workout List')),
      body: ValueListenableBuilder(
        valueListenable: workoutBox.listenable(),
        builder: (context, box, widget) {
          List<Workout> workouts = box.values.toList();

          return ListView.separated(
            padding: const EdgeInsets.all(8.0),
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              var workout = workouts[index];
              return WorkoutTile(
                title: 'Workout ${index + 1}',
                onSelected: () => context.push(
                  WorkoutScreen.path,
                  extra: {
                    'workout': workout,
                    'workoutIndex': index,
                  },
                ),
                onDeleted: () => box.deleteAt(index),
              );
            },
            separatorBuilder: (_, __) => SizedBox(height: 8),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(WorkoutScreen.path, extra: {
          'workout': defaultWorkout,
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
