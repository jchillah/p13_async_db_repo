abstract class DatabaseRepository {
  Future<int> getScore();
  Future<void> updateScore(int score);
}
