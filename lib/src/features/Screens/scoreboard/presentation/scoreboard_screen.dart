import 'package:flutter/material.dart';
import 'package:p13_async_db_repo/src/data/database_repository.dart';

class ScoreboardScreen extends StatelessWidget {
  final DatabaseRepository databaseRepository;
  const ScoreboardScreen({super.key, required this.databaseRepository});

  Future<int> get futureScore => databaseRepository.getScore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scoreboard'),
      ),
      body: FutureBuilder<int>(
        future: futureScore,
        builder: (context, snapshot) {
          // As long as we got no data, show the loading status
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
            // If we lose connection or as long as we aren't connected to a network, show an error
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // We received the data from the database, so we show the score
            return Center(
              child: Text(
                'Score: ${snapshot.data}',
                style: const TextStyle(fontSize: 24),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          int newScore = (await databaseRepository.getScore()) + 100;
          await databaseRepository.updateScore(newScore);
          // Update UI
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
