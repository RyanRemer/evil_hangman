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
    );
  }
}