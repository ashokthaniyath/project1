import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_planner/screens/home_screen.dart';
import 'package:travel_planner/providers/app_state.dart';
import 'package:travel_planner/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Travel Planner',
        theme: AppTheme.lightTheme,
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}