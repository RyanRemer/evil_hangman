import 'package:evil_hangman/controller/guess_controller.dart';
import 'package:evil_hangman/widget/hidden_word_view.dart';
import 'package:evil_hangman/widget/letter_selector.dart';
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
    var letters = guessController.guessedLettersArray();
    String guesses = "";
    for (int i = 0; i < letters.length; i++){
      if(i != letters.length - 1){
        guesses += letters[i] + ", ";
      }
      else{
        guesses += letters[i];
      }
    }
    return guesses;
  }
}
