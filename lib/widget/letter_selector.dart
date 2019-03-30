import 'package:evil_hangman/controller/word_controller.dart';
import 'package:flutter/material.dart';

class LetterSelector extends StatefulWidget {
  ValueSetter<String> onLetterSelect;

  LetterSelector({this.onLetterSelect});

  @override
  State<StatefulWidget> createState() {
    return LetterSelectorState(onLetterSelect: this.onLetterSelect);
  }
}

class LetterSelectorState extends State<LetterSelector> {
  ValueSetter<String> onLetterSelect;

  LetterSelectorState({this.onLetterSelect});

  @override
  Widget build(BuildContext context) {
    return _buildKeyboard(context);
  }

  Widget _buildKeyboard(BuildContext context) {
    var wordController = WordController();
    var unGuessedLetters = wordController.getUnGuessedLetters();

    return GridView.count(
      crossAxisCount: 4,
      padding: EdgeInsets.all(10),
      children: unGuessedLetters
          .map((letter) => Container(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  child: Text(
                    letter,
                    style: Theme.of(context).textTheme.display1,
                  ),
                  onPressed: () => onLetterSelect(letter),
                ),
              ))
          .toList(),
    );
  }
}
