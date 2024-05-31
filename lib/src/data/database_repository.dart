import 'package:p13_async_db_repo/src/data/mock_database.dart';

class DatabaseRepository {
  final MockDatabase _database;

  DatabaseRepository(this._database);

  Future<int> getScore() async {
    return _database.getScore();
  }

  Future<void> updateScore(int score) async {
    await _database.updateScore(score);
  }
}
