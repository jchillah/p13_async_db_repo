import 'package:flutter/material.dart';
import 'package:p13_async_db_repo/src/data/database_repository.dart';
import 'package:p13_async_db_repo/src/features/Screens/scoreboard/presentation/scoreboard_screen.dart';

class MainScreen extends StatelessWidget {
  final DatabaseRepository databaseRepository;

  const MainScreen({super.key, required this.databaseRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ScoreboardScreen(databaseRepository: databaseRepository);
              }),
            );
          },
          child: const Icon(Icons.scoreboard),
        ),
      ),
    );
  }
}
