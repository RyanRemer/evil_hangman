import 'package:evil_hangman/controller/guess_controller.dart';
import 'package:evil_hangman/controller/word_controller.dart';
import 'package:evil_hangman/page/guess_page.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartPageState();
  }
}

class StartPageState extends State<StartPage> {
  int _wordLength = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top:32.0,bottom: 16.0),
                  child: _buildHangmanTitle(context)
                ),
                Expanded(
                  child: _buildWelcomeParagraph(context)
                ),
                Expanded(
                  child: Center(
                      child: _buildBeginGameForm(context)
                  ),
                )
              ],
            )));
  }

  Widget _buildHangmanTitle(BuildContext context){
    return Text("Evil Hangman", style: Theme.of(context).textTheme.display2,);
  }

  Widget _buildWelcomeParagraph(BuildContext context){
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8.0),
          child: Text(this.getGameInfo()),
        ),
      ],
    );
  }

  Widget _buildBeginGameForm(BuildContext context){
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: new InputDecoration(
                labelText: "Enter the desired word size"),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              this._wordLength = int.tryParse(value);
            },
          ),
        ),
        Center(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () => beginGame(context),
                child: const Text('Begin a Game'),
              ),
            ))
      ],
    );
  }

  Future beginGame(BuildContext context) async {
    var wordController = WordController();
    await wordController.loadDictionary(this._wordLength);
    var guessController = GuessController();
    guessController.clearGuessedLetters();
    if(wordController.isCurrentWordsEmpty()){
      showError();
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => GuessPage()));
    }

  }

  String getGameInfo(){
    return "Welcome to Evil Hangman, \n\n"
        "Before you begin, we want to warn you that this will not be a simple game of hangman."
        "We designed this app to be as hard as possible."
        "We invite you to try to do the best you can."
        "Your overall score will be based on how many letters you have left at the end of the game."
        "We hope you enjoy our game. \n"
        "\nThanks,\n\n"
        "Ryan Remer, Bradley Griffin, and Caleb Young";
  }

  void showError() {

      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Error'),
            content: SingleChildScrollView(
            child: ListBody(
            children: <Widget>[
              Text ('There are no words in our dictionary of that size.'),
              Text ('\n Largest wordsize is 29 letters.'),
                ],
            ),
            ),
            actions: <Widget>[
              FlatButton(child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
              ),
            ],
          );
        },
      );

  } // end of alert

}
