import 'package:evil_hangman/controller/guess_controller.dart';
import 'package:flutter/material.dart';

class GuessedLetters extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GuessedLettersState();
  }
}

class GuessedLettersState extends State<GuessedLetters> {
  @override
  Widget build(BuildContext context) {

    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text ("Guessed Letters"),
              Text ( guessedLettersString())
            ]));
  }
  String guessedLettersString(){
    var guessController = GuessController();
    var letters = guessController.getGuessedLetters();
    String guesses = "";
    for (var letter in letters){
      guesses += letter + ", ";
    }
    return guesses;
  }
}
