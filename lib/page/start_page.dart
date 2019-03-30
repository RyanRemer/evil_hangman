import 'package:flutter/material.dart';
import 'package:evil_hangman/controller/word_controller.dart';
import 'package:evil_hangman/page/guess_page.dart';

class StartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartPageState();
  }
}

class StartPageState extends State<StartPage>{
  int _wordLength = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evil Hangman'),
      ),
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(labelText: "Enter desired word size"),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                this._wordLength = int.tryParse(value);
              },
            ),
            Padding(
              padding: EdgeInsets.all(35.0),
              child: RaisedButton(
                onPressed: () => beginGame(context),
                child: const Text('Begin a Game'),
              ),
            )
          ],
        )
      )
    );
  }

  Future beginGame(BuildContext context) async {
    var wordController = WordController(); // TODO: call the loadDictionary function
    await wordController.loadDictionary(this._wordLength);
    Navigator.push(context, MaterialPageRoute(builder: (context) => GuessPage()));
  }
}