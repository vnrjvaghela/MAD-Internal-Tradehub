import 'package:flutter/material.dart';
import 'package:tradehub/theme/app_theme.dart';
import 'package:tradehub/screens/home_screen.dart';

void main() {
  runApp(const TradeHubApp());
}

class TradeHubApp extends StatelessWidget {
  const TradeHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TradeHub',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
