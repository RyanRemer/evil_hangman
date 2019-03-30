import 'package:evil_hangman/controller/guess_controller.dart';
import 'package:evil_hangman/controller/word_controller.dart';
import 'package:flutter/material.dart';

class LetterSelector extends StatefulWidget{
  VoidCallback onGuess;

  LetterSelector({this.onGuess});

  @override
  State<StatefulWidget> createState() {
    return LetterSelectorState(onGuess: this.onGuess);
  }

}

class LetterSelectorState extends State<LetterSelector>{
  VoidCallback onGuess;

  LetterSelectorState({this.onGuess});

  @override
  Widget build(BuildContext context) {
    return _buildKeyboard(context);
  }

  Widget _buildKeyboard(BuildContext context) {
    var wordController = WordController();
    var unGuessedLetters = wordController.getUnGuessedLetters();

    return GridView.count(
      crossAxisCount: 4,
      children: unGuessedLetters
          .map((letter) => Container(
        padding: EdgeInsets.all(10),
        child: RaisedButton(
          child: Text(letter, style: Theme.of(context).textTheme.display1,),
          onPressed: () => this.guessLetter(letter),
        ),
      ))
          .toList(),
    );
  }

  void guessLetter(String letter){
    var guessController = GuessController();
    setState(() {
      guessController.guessLetter(letter);
      if (onGuess != null){
        onGuess();
      }
    });
  }

}