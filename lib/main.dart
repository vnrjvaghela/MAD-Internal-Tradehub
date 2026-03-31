import 'package:flutter/material.dart';
import 'package:tradehub/theme/app_theme.dart';
import 'package:tradehub/screens/home_screen.dart';

void main() {
  runApp(const TradeHubApp());
}

class TradeHubApp extends StatefulWidget {
  const TradeHubApp({super.key});

  // Expose a way to change theme mode
  static void setThemeMode(BuildContext context, ThemeMode mode) {
    var state = context.findAncestorStateOfType<_TradeHubAppState>();
    state?.changeTheme(mode);
  }

  static ThemeMode getThemeMode(BuildContext context) {
    var state = context.findAncestorStateOfType<_TradeHubAppState>();
    return state?.themeMode ?? ThemeMode.system;
  }

  @override
  State<TradeHubApp> createState() => _TradeHubAppState();
}

class _TradeHubAppState extends State<TradeHubApp> {
  ThemeMode themeMode = ThemeMode.system;

  void changeTheme(ThemeMode mode) {
    setState(() {
      themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TradeHub',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
