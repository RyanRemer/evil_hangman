import 'package:evil_hangman/data/word.dart';
import 'package:evil_hangman/data/user_data.dart';

class ClientModel {
  static ClientModel _singleton = ClientModel();
  static ClientModel getInstance() => _singleton;

  List<Word> dictionary;
  List<Word> currentWords;
  List<String> guessedLetters;
  int wordLength;
  UserData userData;

  ClientModel(){
    dictionary = List<Word>();
    currentWords = List<Word>();
    guessedLetters = List<String>();
    wordLength = 0;
    userData = UserData();
  }
}
