import 'package:go_router/go_router.dart';
import 'package:workout/screens/workout_list_screen.dart';
import 'package:workout/screens/workout_screen.dart';

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: WorkoutListScreen.path,
      builder: (context, state) => WorkoutListScreen(),
    ),
    GoRoute(
      path: WorkoutScreen.path,
      builder: (context, state) {
        var extras = state.extra as Map<String, dynamic>;
        return WorkoutScreen(
          workout: extras['workout'],
          workoutIndex: extras['workoutIndex'],
        );
      },
    ),
  ],
);
