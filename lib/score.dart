class Score {
  int _correctAnswer = 0;

  void increment() {
    _correctAnswer++;
  }

  void reset() {
    _correctAnswer = 0;
  }

  String getResult(int total) {
    return 'You\'ve got $_correctAnswer correct out of $total';
  }
}
