import 'package:evil_hangman/controller/word_controller.dart';
import 'package:evil_hangman/data/word.dart';
import 'package:flutter/material.dart';

class CurrentWordsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CurrentWordsPageState();
  }
  
}

class CurrentWordsPageState extends State<CurrentWordsPage>{
  List<Word> _currentWords = List<Word>();
  WordController _wordController = WordController();
  
  @override
  Widget build(BuildContext context) {
    _currentWords = _wordController.getCurrentWords();

    return Scaffold(
      appBar: AppBar(
        title: Text("Hidden Words"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _buildInformation(context),
            Expanded(child: _buildWords(context),)
          ],
        ),
      ),
    );
  }
  
  Widget _buildInformation(BuildContext context){
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("Hangman String: "),
          trailing: Text("${_wordController.getHangmanString()}"),
        ),
        ListTile(
          title: Text("Number of Words: "),
          trailing: Text("${_currentWords.length}"),
        ),
        const Divider()
      ],
    );
  }

  Widget _buildWords(BuildContext context){
    return ListView.builder(
        itemCount: _currentWords.length,
        itemBuilder: (context, index){
      return ListTile(
        title: Text(_currentWords[index].toString()),
      );
    });
  }
  
  
}