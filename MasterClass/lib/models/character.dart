// character.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import 'vocation.dart';
import 'stats.dart';
import 'skill.dart';

class Character with Stats {
  Character({
    required this.vocation,
    required this.id,
    required this.name,
    required this.slogan,
  });

  final Set<Skill> skills = {};
  final VocationType vocation;
  final String id;
  final String name;
  final String slogan;
  bool _isFav = false;

  bool get isFav => _isFav;

  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateStats(Skill skill) {
    skills.clear();
    skills.add(skill);
    increaseStat('health');
  }

  Vocation get vocationDetails => Vocation.vocations[vocation]!;

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFav': isFav,
      'vocation': vocation.toString(),
      'skills': skills.map((skill) => skill.id).toList(),
      'stats': stats,
      'points': points
    };
  }

  factory Character.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data()!;

    final character = Character(
      id: snapshot.id,
      name: data['name'],
      slogan: data['slogan'],
      vocation: VocationType.values.firstWhere(
        (element) => element.toString() == data['vocation'] as String,
      ),
    );

    for (final skillId in data['skills'] as List<String>) {
      final skill = allSkills.firstWhere((element) => element.id == skillId);
      character.updateStats(skill);
    }

    if (data['isFav'] as bool) {
      character.toggleIsFav();
    }

    character.setStats(
      points: data['points'],
      health: data['health'],
      stats: data['stats'],
    );

    return character;
  }
}

// Dummy characters
List<Character> characters = [
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
