import 'package:evil_hangman/controller/guess_controller.dart';
import 'package:evil_hangman/controller/word_controller.dart';
import 'package:evil_hangman/data/client_model.dart';

class EndGameController {
  ClientModel _clientModel = ClientModel.getInstance();

  bool gameIsOver(){
    var hiddenWord = WordController().getHiddenWord();
    var guessedLetters = GuessController().getGuessedLetters();

    var hangmanString = hiddenWord.toHangmanString(guessedLetters).replaceAll(" ", "");

    return (hiddenWord.toString() == hangmanString);
}
}