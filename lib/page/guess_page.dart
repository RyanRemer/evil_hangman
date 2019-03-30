import 'package:evil_hangman/controller/word_controller.dart';
import 'package:flutter/material.dart';

class GuessPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return GuessPageState();
  }
}

class GuessPageState extends State<GuessPage>{
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
          children: <Widget> [
            Container (
              color: Colors.green,
              height: 150.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Text(
                    getHiddenWordString(),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.display3
                  )
                ]
              )
            ),
            Expanded (
              child: Container (
                color: Colors.red
              )
            ),
          ]
        )
      )
    );
  }

  String getHiddenWordString() {
    return WordController().getHiddenWord();
  }
}