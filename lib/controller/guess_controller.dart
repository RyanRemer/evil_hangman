import 'package:evil_hangman/data/client_model.dart';
import 'package:evil_hangman/data/word.dart';

class GuessController{
  ClientModel _clientModel = ClientModel.getInstance();

  void guessLetter(String letter){
    letter = letter.toLowerCase();
    var wordMap = Map<String, List<Word>>();
    _clientModel.guessedLetters.add(letter);

    _buildWordMap(wordMap);
    var largestList = this._findLargestList(wordMap);
    _clientModel.currentWords = largestList;
  }
  List<String> getGuessedLetters(){
    return _clientModel.guessedLetters;
  }

  void clearGuessedLetters(){
    _clientModel.guessedLetters.clear();
  }

  void _buildWordMap(Map<String, List<Word>> wordMap) {
    var currentWords = _clientModel.currentWords;
    var guessedLetters = _clientModel.guessedLetters;
    for (var word in currentWords){
      var hangmanString = word.toHangmanString(guessedLetters);

      if (wordMap[hangmanString] == null){
        wordMap[hangmanString] = List<Word>();
      }

      wordMap[hangmanString].add(word);
    }
  }

  List<Word> _findLargestList(Map<String, List<Word>> wordMap){
    var largestList = wordMap.values.first;
    for (String key in wordMap.keys){
      if (largestList.length < wordMap[key].length){
        largestList = wordMap[key];
      }
    }
    return largestList;
  }

}