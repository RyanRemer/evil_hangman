import 'package:evil_hangman/data/word.dart';

class ClientModel {
  static ClientModel _singleton = ClientModel();
  static ClientModel getInstance() => _singleton;

  List<Word> dictionary;
  List<Word> currentWords;
  List<String> guessedLetters;
  int wordLength;

  ClientModel(){
    dictionary = List<Word>();
    currentWords = List<Word>();
    guessedLetters = List<String>();
    wordLength = 0;
  }
}
