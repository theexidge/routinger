//Flutter libraries
import 'package:flutter/material.dart';

// Third Party Packages
import 'package:provider/provider.dart';

//Config Imports
import './config/theme.dart';

//Provider Imports
import './provider/tasks.dart';
import './provider/charts_stats.dart';
import './provider/experience_points.dart';

// Screen Imports
import './screens/settings_screen.dart';
import './screens/home_screen.dart';
import 'screens/add_task_screen.dart';

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
        theme: buildTheme(context),
        home: HomeScreen(),
        routes: {
          AddTask.routeName: (ctx) => AddTask(),
          SettingsScreen.routeName: (ctx) => SettingsScreen(),
        },
      ),
    );
  }
}
