import 'package:flutter/material.dart';
import 'package:p13_async_db_repo/src/data/database_repository.dart';
import 'package:p13_async_db_repo/src/data/mock_database.dart';
import 'package:p13_async_db_repo/src/features/Screens/main_screen/presentation/main_screen.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final DatabaseRepository databaseRepository =
      DatabaseRepository(MockDatabase());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'P13 Async DB_Repo',
      home: MainScreen(
        databaseRepository: databaseRepository,
      ),
    );
  }
}
