import 'package:advance_basics/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:advance_basics/start_screen.dart';
import 'package:advance_basics/data/questions.dart';
import 'package:advance_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    // the _QuizState() is a private constructor that is only
    // available on this quiz.dart page
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
// create a list that would store selected answers
  List<String> selectedAnswers = [];
  // creating conditinal statement to set screens accordingly
  // first store the identifier in a variable
  var activeScreen = 'start-screen';
  // switchScreen() method is created with a setState which
  // changes the state or lifts the state from previous screen to new screen
  switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  // create a method that updates the selectedAnswers by receiving the argument
  // of answer sent to it

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    //this makes the screen widget to be set to StartScreen() by default
    Widget screenWidget = StartScreen(switchScreen);

    // the below logic is executed if the build widget is run and identifier
    // is set to questions-screen thereby setting screenWidget to QuestionScreen
    if (activeScreen == 'questions-screen') {
      // QuestionScreen passes a pointer to the method chooseAnswer
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = const ResultsScreen();
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // conditional logic which checks if the identifier set in the method is
          //start-screen or not and what to display with each of
          //the indentifier when set
          child: screenWidget,
        ),
      ),
    );
  }
}
