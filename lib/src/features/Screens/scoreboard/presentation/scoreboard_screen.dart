import 'package:flutter/material.dart';

class ScoreboardScreen extends StatelessWidget {
  const ScoreboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final score = 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scoreboard'),
      ),
      body: Center(
        child: Text(
          'Score: $score',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
