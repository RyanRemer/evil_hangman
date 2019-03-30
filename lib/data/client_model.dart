import 'package:evil_hangman/data/word.dart';

class ClientModel {
  static ClientModel _singleton = ClientModel();
  static ClientModel getInstance() => _singleton;

  List<Word> dictionary;
  List<Word> currentWords;
  List<String> guessedLetters;

  ClientModel(){
    dictionary = List<Word>();
    currentWords = List<Word>();
    guessedLetters = List<String>();
  }
}
