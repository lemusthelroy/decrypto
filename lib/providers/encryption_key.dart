import 'package:decrypto/models/word.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:random_words/random_words.dart';
import 'dart:math';

class EncryptionKey with ChangeNotifier {
  List<Word> words = new List<Word>();
  List<Word> filteredWords = new List<Word>();
  List<int> code = new List<int>();
  final random = new Random();

  disposeGame()
  {
    words.clear();
    code.clear();
    filteredWords.clear();
  }

  generateWords() {
    disposeGame();

    var count = 0;
    generateNoun()
        .take(4)
        .forEach((wordNoun)  {
          var word = new Word(word: wordNoun.asCapitalized, index:count);
        words.add(word);
        filteredWords.add(word);
        count++;
  });
    //filteredWords = words;
    notifyListeners();
  }

  generateCode()
  {
    // Clear arrays
    code.clear();
    filteredWords.clear();

    code = [0, 1, 2, 3];
    code.shuffle();
    code.removeLast();
    code.forEach((wordIndex) => filteredWords.add(words[wordIndex]));
    notifyListeners();
  }
}
