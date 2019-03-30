import 'package:evil_hangman/controller/guess_controller.dart';
import 'package:evil_hangman/widget/guessed_letters.dart';
import 'package:evil_hangman/widget/hidden_word_view.dart';
import 'package:evil_hangman/widget/letter_selector.dart';
import 'package:flutter/material.dart';

class GuessPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GuessPageState();
  }
}

class GuessPageState extends State<GuessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evil Hangman'),
      ),
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
          HiddenWordView(),
          GuessedLetters(),
          Container(
            child: Expanded(child: LetterSelector(onLetterSelect: this.guessLetter,))
          )
        ])));
  }

  void guessLetter(String letter){
    var guessController = GuessController();
    setState(() {
      guessController.guessLetter(letter);
    });
  }
}
