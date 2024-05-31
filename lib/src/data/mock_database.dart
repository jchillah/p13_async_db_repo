class MockDatabase {
  int _score = 100;

  Future<int> getScore() async {
    await Future.delayed(const Duration(seconds: 3));
    return _score;
  }

  Future<void> updateScore(int score) async {
    await Future.delayed(const Duration(seconds: 3));
    _score = score;
  }
}
