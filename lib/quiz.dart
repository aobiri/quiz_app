import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // (1) SWITCH SCREEN - innitState() approach
  //Widget? activeScreen;
  // ? ensures that the variable is not initialized.

  // pass a function that causes the first screen (StartScreen) to  switch to the next)
  // do not pass screen with (), because that would cause switchScreen to execute right when StartScreen is called
  // When passed without the (), it sets a  pointer to switchScreen as a value to StartScreen that can be used anytime when needed
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  // Switch screen approach using ternary operator
  var activeScreen = 'start-screen';
  // variable to store the list of selected answers by adding to the array
  // final can be applied here because add() only reaches the variable in memory and adds to the value, but does not re-assign the value
  List<String> selectedAnswers = [];

  // function to switch between screens
  void switchScreen() {
    setState(() {
      //activeScreen = QuestionsScreen(); // innitState() approach
      activeScreen = 'questions-screen'; // ternary approach
    });
  }

  // function to add the selected answer to the list of selected answers
  void chosenAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    // (2) Switch Screen - ternary approach
    /** Widget screenWidget = activeScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : QuestionsScreen(); **/

    // (3) Switch Screen - if condition approach
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectedAnswer: chosenAnswer,
      );
    }
    if (activeScreen == 'results-screen') {
      screenWidget =
          ResultsScreen(theChosenAnswers: selectedAnswers, restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 95, 51, 226),
                Color.fromARGB(255, 125, 103, 231)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          //child: activeScreen,
          child: screenWidget,
        ),
      ),
    );
  }
}
