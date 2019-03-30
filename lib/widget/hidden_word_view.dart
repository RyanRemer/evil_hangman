import 'package:evil_hangman/controller/word_controller.dart';
import 'package:evil_hangman/page/current_words_page.dart';
import 'package:flutter/material.dart';

class HiddenWordView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HiddenWordState();
  }
}

class HiddenWordState extends State<HiddenWordView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150.0,
        child: Center(
            child: GestureDetector(
          onDoubleTap: () => this.showHiddenWords(context),
          child: Text(getHiddenWordString(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.display3),
        )));
  }

  void showHiddenWords(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CurrentWordsPage()));
  }

  String getHiddenWordString() {
    return WordController().getHiddenWord();
  }
}
