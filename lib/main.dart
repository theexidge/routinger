import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routinger/provider/charts_stats.dart';
import 'package:routinger/provider/experience_points.dart';

// Provider Imports
import 'package:routinger/provider/tasks.dart';

// Screen Imports
import './screens/home_screen.dart';
import './screens/add_task.dart';

// Services Imports
import './services/notifications.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Tasks(),
        ),
        ChangeNotifierProvider(
          create: (_) => ExperiencePoints(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChartStats(),
        ),
      ],
      child: MaterialApp(
        title: 'Routinger',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {
          AddTask.routeName: (ctx) => AddTask(),
        },
      ),
    );
  }
}
