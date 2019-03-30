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
              Expanded(child: LetterSelector(onGuess: this.onGuess,)),
            ])));
  }

  void onGuess(){
    setState(() {

    });
  }
}
