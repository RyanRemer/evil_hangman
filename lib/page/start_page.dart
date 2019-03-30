import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartPageState();
  }
}

class StartPageState extends State<StartPage>{
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
            ),
            Padding(
              padding: EdgeInsets.all(35.0),
              child: RaisedButton(
                onPressed: () {},
                child: const Text('Begin a Game'),
              ),
            )

          ],
        )
      )
    );
  }
}
