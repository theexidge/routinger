//Flutter libraries
import 'package:flutter/material.dart';

// Third Party Packages
import 'package:provider/provider.dart';
import 'package:routinger/provider/theme_provider.dart';

//Config Imports
import './config/theme.dart';

//Provider Imports
import './provider/tasks.dart';
import './provider/charts_stats.dart';
import './provider/experience_points.dart';

// Screen Imports
import './screens/settings_screen.dart';
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
      child: ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
          builder: (context, _) {
            return MaterialApp(
              title: 'Routinger',
              themeMode: Provider.of<ThemeProvider>(context).themeMode,
              // buildTheme(context)
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
              home: HomeScreen(),
              routes: {
                AddTask.routeName: (ctx) => AddTask(),
                SettingsScreen.routeName: (ctx) => SettingsScreen(),
              },
            );
          }),
    );
  }
}
