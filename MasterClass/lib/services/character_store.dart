import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/services/firestore_service.dart';

class CharacterStore extends ChangeNotifier {
  // Private list of characters
  final List<Character> _characters = [];

  // Public getter for characters
  get characters => _characters;

  void addCharacter(character) {
    FirestoreService.addCharacter(character);
    _characters.add(character);
    notifyListeners();
  }

  //get character once
  void fetchCharactersOnce() async {
    if (characters.length == 0) {
      final snapshot = await FirestoreService.getCharactersOnce();
      for (var doc in snapshot.docs) {
        _characters.add(doc.data());
      }
      notifyListeners();
    }
  }

  //save character
  Future<void> updateCharacter(Character character) async {
    await FirestoreService.updateCharacter(character);
    _characters.remove(character);
    notifyListeners();
  }

  //delete character
  Future<void> deleteCharacter(Character character) async {
    await FirestoreService.deleteCharacter(character);
    return;
  }
}
