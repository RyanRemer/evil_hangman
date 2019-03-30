import 'package:evil_hangman/controller/word_controller.dart';
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
    return Container (
        height: 150.0,
        child: Center(
            child:
            Text(
                getHiddenWordString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.display3
            )
        )
    );
  }

  String getHiddenWordString() {
    return WordController().getHiddenWord();
  }

}