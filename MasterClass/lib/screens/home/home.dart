// home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/create.dart';
import 'package:flutter_rpg/screens/home/character_card.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //fetch characters
  @override
  void initState() {
    Provider.of<CharacterStore>(context, listen: false).fetchCharactersOnce();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Your Characters'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Consumer<CharacterStore>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.characters.length,
                    itemBuilder: (_, index) {
                      return CharacterCard(
                          characterData: value.characters[index]);
                    },
                  );
                },
              ),
            ),
            StyledButton(
              onPressed: () {
                // Add your character creation logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => const CreateScreen(),
                  ),
                );
              },
              child: StyledHeading(
                'Create New Character',
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
