import 'package:evil_hangman/widget/hidden_word_view.dart';
import 'package:evil_hangman/widget/score_view.dart';
import 'package:flutter/material.dart';

class ScorePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScorePageState();
  }
}

class ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Final Score"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            HiddenWordView(),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ScoreView(),
                      )
                    ],
                  )),
            ),
            Container(
                padding: EdgeInsets.all(64.0),
                child: Center(
                  child: RaisedButton(
                      child: Text("Try Again"), onPressed: startNewGame),
                ))
          ],
        ),
      ),
    );
  }

  void startNewGame() {
    Navigator.popUntil(
        context, ModalRoute.withName(Navigator.defaultRouteName));
  }
}
