import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:flutter_rpg/screens/profile/profile.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    required this.characterData,
    super.key,
  });

  final Character characterData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Image.asset(
              'assets/img/vocations/${characterData.vocationDetails.imageAsset}',
              width: 80,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(characterData.name),
                Text(characterData.vocationDetails.title),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => ProfileScreen(characterData: characterData)));
              },
              icon: Icon(
                Icons.arrow_forward,
                color: AppTheme.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}