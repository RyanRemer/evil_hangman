import 'dart:convert';

import 'package:evil_hangman/data/client_model.dart';
import 'package:evil_hangman/data/word.dart';
import 'package:flutter/services.dart' show rootBundle;

class WordController {
  ClientModel _clientModel = ClientModel.getInstance();

  WordController();

  Future loadDictionary(int wordLength) async {
    String fileData = await rootBundle.loadString('assets/words.json');
    var fileStrings = json.decode(fileData);

    _clientModel.wordLength = wordLength;
    _clientModel.dictionary.clear();
    for (var fileString in fileStrings){
      if (fileString.length == wordLength){
        _clientModel.dictionary.add(Word(fileString));
      }
    }
  }
}