// character.dart
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