import 'package:flutter/material.dart';
import 'package:p13_async_db_repo/src/data/database_repository.dart';

class ScoreboardScreen extends StatefulWidget {
  final DatabaseRepository databaseRepository;
  const ScoreboardScreen({super.key, required this.databaseRepository});

  @override
  ScoreboardScreenState createState() => ScoreboardScreenState();
}

class ScoreboardScreenState extends State<ScoreboardScreen> {
  late Future<int> futureScore;

  @override
  void initState() {
    super.initState();
    futureScore = widget.databaseRepository.getScore();
  }

  void _updateScore() async {
    int newScore = (await widget.databaseRepository.getScore()) + 100;
    await widget.databaseRepository.updateScore(newScore);
    if (mounted) {
      setState(() {
        futureScore = widget.databaseRepository.getScore();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

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
            // We received the data from the database, so we show the score
          } else {
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
        onPressed: _updateScore,
        child: const Icon(Icons.add),
      ),
    );
  }
}
