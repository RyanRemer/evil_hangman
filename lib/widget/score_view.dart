import 'package:evil_hangman/controller/end_game_controller.dart';
import 'package:evil_hangman/widget/letter_selector.dart';
import 'package:flutter/material.dart';

class ScoreView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Score: ${EndGameController().getScore()}",
          style: Theme.of(context).textTheme.display3,
        ),
        Expanded(
          child: LetterSelector(),
        )
      ],
    );
  }

}