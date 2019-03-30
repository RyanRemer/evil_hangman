import 'package:evil_hangman/controller/word_controller.dart';
import 'package:evil_hangman/widget/hidden_word_view.dart';
import 'package:evil_hangman/widget/score_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        child: ListView(
          children: <Widget>[
            HiddenWordView(),
            Container(
              padding: EdgeInsets.all(32.0),
              height: 300,
              child: ScoreView(),
            ),
            Column(
              children: <Widget>[
                RaisedButton(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text("Try Again"),
                    ), onPressed: startNewGame),
                Padding(padding: EdgeInsets.only(top: 16),),
                RaisedButton(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text("View Definition"),
                    ), onPressed: showDefinition),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future showDefinition() async {
    var hiddenWord = WordController().getHiddenWord().toString();

    var url = 'https://www.dictionary.com/browse/' + hiddenWord;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void startNewGame() {
    Navigator.popUntil(
        context, ModalRoute.withName(Navigator.defaultRouteName));
  }
}
