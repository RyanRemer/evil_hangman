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
    fileStrings.removeWhere((word) => (word == ""));

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
  bool isCurrentWordsEmpty(){
    return (_clientModel.currentWords.length == 0);
  }

  String getHangmanString() {
    Word hiddenWord = getHiddenWord();
    String hangmanString = hiddenWord.toHangmanString(_clientModel.guessedLetters);
    return hangmanString;
  }

  Word getHiddenWord(){
    return _clientModel.currentWords.first;
  }

  List<Word> getCurrentWords(){
    return _clientModel.currentWords;
  }
}
