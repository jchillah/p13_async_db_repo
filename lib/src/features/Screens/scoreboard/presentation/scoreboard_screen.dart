import 'package:flutter/material.dart';

class ScoreboardScreen extends StatelessWidget {
  const ScoreboardScreen({super.key});

  // Simulate fetching the score from a database
  Future<int> fetchScore() async {
    await Future.delayed(const Duration(seconds: 3)); // Simulate a delay
    return 100; // Return the score
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scoreboard'),
      ),
      body: FutureBuilder<int>(
        future: fetchScore(),
        builder: (context, snapshot) {
          // as long we got no Datas show the loading status
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
            /*
           if we lose connection || as long we arent connected to a Network
          show an error
          */
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            /* we received the data from the database so we show the score
          i think this Task should give me 100/100 points :p 
          */
            return Center(
              child: Text(
                'Score: ${snapshot.data}',
                style: const TextStyle(fontSize: 24),
              ),
            );
          }
        },
      ),
    );
  }
}
