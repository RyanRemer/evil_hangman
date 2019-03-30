import 'package:evil_hangman/controller/end_game_controller.dart';
import 'package:evil_hangman/widget/letter_selector.dart';
import 'package:flutter/material.dart';

class ScorePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ScorePageState();
  }
}

class ScorePageState extends State<ScorePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Final Score"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(32),
                  child: Column(
                    children: <Widget>[
                      Text("Score: ${EndGameController().getScore()}",
                        style: Theme.of(context).textTheme.display3,
                      ),
                      Expanded(
                        child: LetterSelector(),
                      )
                    ],
                  )
              ),
            ),
            Container(
              padding: EdgeInsets.all(64.0),
              child: Center(
                child: RaisedButton(
                    child: Text("Try Again"),
                    onPressed: startNewGame),
              )
            )
          ],
        ),
      ),
    );
  }

  void startNewGame(){
    Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
  }
}