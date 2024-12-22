import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/skill.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.characterData, {super.key});

  final Character characterData;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Skill> availableSkills; // Ensure it's a list of Skill objects.
  late Skill selectedSkill;

  @override
  void initState() {
    super.initState();

    // Assuming `allSkills` is a predefined list of Skill objects.
    availableSkills = allSkills.where((skill) {
      return skill.vocation == widget.characterData.vocation;
    }).toList();

    // Set the default selected skill.
    selectedSkill = widget.characterData.skills.isNotEmpty
        ? widget.characterData.skills.first
        : availableSkills[0];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.black,
        child: Column(
          children: [
            const Text(
              'Choose an active skill',
              style: TextStyle(color: Colors.white),
            ),
            const Text(
              'Skills are unique to each vocation',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10, // Spacing between skill icons.
              runSpacing: 10,
              children: availableSkills.map((skill) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.characterData
                          .updateStats(skill); // Update character stats.
                      selectedSkill = skill; // Update the selected skill.
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedSkill == skill
                            ? Colors.yellow
                            : Colors.transparent,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Image.asset(
                      'assets/img/skills/${skill.image}',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Text(
              selectedSkill.name,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}