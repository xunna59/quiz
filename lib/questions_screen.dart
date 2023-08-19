import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:advance_basics/answers_button.dart';
import 'package:advance_basics/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  // create a variable that stores the index of current question

  var currentQuestionIndex = 0;

// function that updates the index of the current question and sets state
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      // to make it reesponsive
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          // the mainAxis in a column is vertical axis
          mainAxisAlignment: MainAxisAlignment.center,
          //the cross axis in a column is the horizontal axis
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              // accessing the data stored in an object can be done using the dot
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            // fetching answers data dynamicallywhich is a list data
            // ... is called spreading
            ...currentQuestion.getShuffledAnswers().map((theanswer) {
              return AnswerButton(
                  answerText: theanswer,
                  onTap: () {
                    answerQuestion(theanswer);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
