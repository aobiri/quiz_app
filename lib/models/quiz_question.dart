class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  // return a shuffled list
  // 1. Copy into a variable
  // 2. call shuffle function of the List class
  List<String> getShuffledList() {
    final shuffledList = List.of(answers); //of - copies the content of a list
    shuffledList.shuffle();
    return shuffledList;
  }
}
