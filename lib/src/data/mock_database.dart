import 'package:p13_async_db_repo/src/data/database_repository.dart';

class MockDatabase implements DatabaseRepository {
  int _score = 0;

  Future<int> getScore() async {
    await Future.delayed(const Duration(seconds: 3));
    return _score;
  }

  Future<void> updateScore(int score) async {
    await Future.delayed(const Duration(seconds: 2));
    _score = score;
  }
}
