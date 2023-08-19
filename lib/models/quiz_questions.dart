// creating a class that contains the questions blueprint for the data you want to store
class QuizQuestion {
  //  creating a constructor function that can receive arguments
  const QuizQuestion(this.text, this.answers);

  // setting the data types
  final String text;
  final List<String> answers;

  // we shuffled the answers by first chaining the list of answers i.e we made a
  // copy of the answers from the original list of answers and proceeded to shuffle it
  // so we can always know which came first in the list.
  List<String> getShuffledAnswers() {
    // created a copy and stored it in variable
    final shuffledList = List.of(answers);
    // shuffled the copied list in a variable
    shuffledList.shuffle();
    // returned the list after it was shuffled
    return shuffledList;
  }
}
