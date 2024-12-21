import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';

class CharacterStore extends ChangeNotifier {
  // Private list of characters
  final List<Character> _characters = [
    Character(
      id: '1',
      name: 'Klara',
      vocation: VocationType.wizard,
      slogan: 'Kapumf!',
    ),
    Character(
      id: '2',
      name: 'Jonny',
      vocation: VocationType.junkie,
      slogan: 'Light me up! ...',
    ),
    Character(
      id: '3',
      name: 'Crimson',
      vocation: VocationType.raider,
      slogan: 'Fire in the hole!',
    ),
    Character(
      id: '4',
      name: 'Shaun',
      vocation: VocationType.ninja,
      slogan: 'Alright then gang.',
    ),
  ];

  // Public getter for characters
  get characters => _characters;

  void addCharacter(Character character) {
    _characters.add(character);
    notifyListeners();
  }



  
}
