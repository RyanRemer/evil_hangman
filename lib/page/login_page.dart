import 'package:flutter/material.dart';
import '../auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evil Hangman'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Center(
              child: Container(
                padding: EdgeInsets.only(right: 90, left: 90, bottom: 40),
                child: Text('Welcome to Evil Hangman!', style: Theme.of(context).textTheme.display1, textAlign: TextAlign.center)
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: () => authService.googleSignIn(context),
                child: Text('Log In with Google'),
              )
            )
          ]
        )
      )
    );
  }
}