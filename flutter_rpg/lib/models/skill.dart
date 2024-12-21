import 'package:flutter_rpg/models/vocation.dart';

class Skill {
  final String name;
  final String image;
  final VocationType vocation;
  final int id;

  Skill({
    required this.name,
    required this.image,
    required this.vocation,
    required this.id,
  });
}

final List<Skill> allSkills = [
  // Algo Wizard skills
  Skill(id: 1, name: 'Brute Force Bolt', image: 'bf_bolt.jpg', vocation: VocationType.wizard),
  Skill(id: 2, name: 'Recursive Wave', image: 'r_wave.jpg', vocation: VocationType.wizard),
  Skill(id: 3, name: 'Hash Beam', image: 'h_beam.jpg', vocation: VocationType.wizard),
  Skill(id: 4, name: 'Backtrack', image: 'backtrack.jpg', vocation: VocationType.wizard),

  // Terminal Raider skills
  Skill(id: 5, name: 'Lethal Touch', image: '1_touch.jpg', vocation: VocationType.raider),
  Skill(id: 6, name: 'Full Clear', image: 'f_clear.jpg', vocation: VocationType.raider),
  Skill(id: 7, name: 'Sudo Blast', image: 's_blast.jpg', vocation: VocationType.raider),
  Skill(id: 8, name: 'Support Shell', image: 's_shell.jpg', vocation: VocationType.raider),

  // Code Junkie skills
  Skill(id: 9, name: 'Infinite Loop', image: 'i_loop.jpg', vocation: VocationType.junkie),
  Skill(id: 10, name: 'Type Cast', image: 't_cast.jpg', vocation: VocationType.junkie),
  Skill(id: 11, name: 'Encapsulate', image: 'encapsulate.jpg', vocation: VocationType.junkie),
  Skill(id: 12, name: 'Copy & Paste', image: 'c_paste.jpg', vocation: VocationType.junkie),

  // UX Ninja skills
  Skill(id: 13, name: 'Gamify', image: 'gamify.jpg', vocation: VocationType.ninja),
  Skill(id: 14, name: 'Heat Map', image: 'h_map.jpg', vocation: VocationType.ninja),
  Skill(id: 15, name: 'Wireframe', image: 'wireframe.jpg', vocation: VocationType.ninja),
  Skill(id: 16, name: 'Dark Pattern', image: 'd_pattern.jpg', vocation: VocationType.ninja),
];