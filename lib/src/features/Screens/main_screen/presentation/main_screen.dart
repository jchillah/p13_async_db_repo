import 'package:flutter/material.dart';
import 'package:p13_async_db_repo/src/features/Screens/scoreboard/presentation/scoreboard_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
              MaterialPageRoute(builder: (context) => ScoreboardScreen()),
            );
          },
          child: const Icon(Icons.scoreboard),
        ),
      ),
    );
  }
}
