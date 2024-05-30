import 'package:flutter/material.dart';
import 'package:p13_async_db_repo/src/features/Screens/main_screen/presentation/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'P13 Async DB_Repo',
      home: MainScreen(),
    );
  }
}
