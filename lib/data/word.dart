class Word {
  String value;

  Word(this.value);

  String toString(){
    return value;
  }

  String toHangmanString(List<String> letters){
    var hangmanString = "";
    var valueLetters = value.split('');

    for (var valueLetter in valueLetters){
      if (letters.contains(valueLetter)){
        hangmanString += valueLetter;
      } else {
        hangmanString += "-";
      }
    }

    return hangmanString;
  }

}