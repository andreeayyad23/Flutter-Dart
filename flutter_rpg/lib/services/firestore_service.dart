import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/character.dart';

class FirestoreService {
  static final ref =
      FirebaseFirestore.instance.collection('characters').withConverter(
            fromFirestore: Character.fromFirestore,
            toFirestore: (Character c, _) => c.toFirestore(),
          );

  //add a character
  static Future<void> addCharacter(Character character) async {
    await ref.doc(character.id).set(character);
  }

  //get character once
  static Future<QuerySnapshot<Character>> getCharactersOnce() {
    return ref.get();
  }

  //delete character
  static Future<void> deleteCharacter(Character character) async {
    await ref.doc(character.id).delete();
  }

  //update character
 static Future<void> updateCharacter(Character character) async {
   await ref.doc(character.id).update({
     'stats': character.stats,
     'points': character.points,
     'skills': character.skills.map((skill) => skill.id).toList(),
     'isFav': character.isFav,
   });
 }

}
