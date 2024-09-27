import 'package:flutter/material.dart';
import 'package:workout/utils/helpers.dart';
import 'package:workout/utils/routers.dart';
import 'package:workout/utils/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeHive();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Workout Tracker',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
    );
  }
}
