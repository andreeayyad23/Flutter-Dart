import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/screens/profile/skill_list.dart';
import 'package:flutter_rpg/screens/profile/stats_table.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rpg/services/character_store.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.characterData,
  }) : super(key: key);

  final Character characterData;

  static final TextStyle _titleTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final TextStyle _descriptionTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.white70,
  );

  static final Color _backgroundColor = Color(0xFF171717);

  static final BoxDecoration _boxDecoration = BoxDecoration(
    color: _backgroundColor,
    borderRadius: BorderRadius.circular(10),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(characterData.name),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/img/vocations/${characterData.vocationDetails.imageAsset}',
                    width: 140,
                    height: 140,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(characterData.name, style: _titleTextStyle),
                        Text(characterData.vocationDetails.title,
                            style: _titleTextStyle),
                        const SizedBox(height: 10),
                        Text(
                          characterData.vocationDetails.description,
                          style: _descriptionTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: _boxDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Slogan',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(characterData.slogan, style: _descriptionTextStyle),
                    const SizedBox(height: 10),
                    const Text(
                      'Weapon of Choice',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(characterData.vocationDetails.weapon,
                        style: _descriptionTextStyle),
                    const SizedBox(height: 10),
                    const Text(
                      'Unique Ability',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(characterData.vocationDetails.specialAbility,
                        style: _descriptionTextStyle),
                  ],
                ),
              ),
            ),

            // Stats
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  StatsTable(characterData),
                  SkillList(characterData),
                ],
              ),
            ),

            // Save and exit buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    onPressed: () {
                      Provider.of<CharacterStore>(context, listen: false)
                          .updateCharacter(characterData);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Saved...'),
                          showCloseIcon: true,
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.green,
                        ),
                      );
                      // Save character logic here
                    },
                    child: const Text('Save'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    onPressed: () {
                      // Exit logic here
                    },
                    child: const Text('Exit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }
}
