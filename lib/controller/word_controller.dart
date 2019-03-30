import 'package:evil_hangman/data/client_model.dart';
import 'package:evil_hangman/data/word.dart';
import 'package:flutter/services.dart' show rootBundle;

class WordController {
  ClientModel _clientModel = ClientModel.getInstance();

  WordController();

  Future loadDictionary(int wordLength) async {
    String fileData = await rootBundle.loadString('assets/words.txt');
    fileData = fileData.replaceAll('\r', '');

    var fileStrings = fileData.split('\n');

    _clientModel.wordLength = wordLength;
    _clientModel.dictionary.clear();
    _clientModel.currentWords.clear();
    for (var fileString in fileStrings) {
      _clientModel.dictionary.add(Word(fileString.toLowerCase()));
      if (fileString.length == wordLength) {
        _clientModel.currentWords.add(Word(fileString.toLowerCase()));
      }
    }
  }

  String getHiddenWord() {
    Word topWord = _clientModel.currentWords.first;
    String topWordString = topWord.toHangmanString(_clientModel.guessedLetters);
    return topWordString;
  }

  List<Word> getCurrentWords(){
    return _clientModel.currentWords;
  }

  List<String> getUnGuessedLetters(){
    var letters = "abcdefghijklmnopqrstuvwxyz".split('');
    var unGuessedLetters = List<String>();
    for (var letter in letters){
      if (!_clientModel.guessedLetters.contains(letter)){
        unGuessedLetters.add(letter);
      }
    }
    return unGuessedLetters;
  }
}
