import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';

var uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();
  VocationType? _selectedVocation;
  String? _errorMessage;

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  // Submit handler
  void handleSubmit() {
    setState(() {
      _errorMessage = null; // Reset error message
    });

    if (_nameController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            backgroundColor: Colors.black,
            surfaceTintColor: Colors.transparent,
            title: const Text(
              'Missing Name',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text(
              'Please enter a name for your character.',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('Close'),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            backgroundColor: Colors.black,
            surfaceTintColor: Colors.transparent,
            title: const Text(
              'Missing Slogan',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text(
              'Please enter a slogan for your character.',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('Close'),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
      return;
    }
    if (_selectedVocation == null) {
      setState(() {
        _errorMessage = 'You must select a vocation';
      });
      return;
    }

    Provider.of<CharacterStore>(context, listen: false).addCharacter(Character(
      id: uuid.v4(),
      name: _nameController.text.trim(),
      slogan: _sloganController.text.trim(),
      vocation: _selectedVocation!,
    ));

    // Navigate to the home screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => const HomeScreen(),
      ),
    );
  }

  // Select vocation handler
  void selectVocation(VocationType vocation) {
    setState(() {
      _selectedVocation = vocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Character Creation'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Icon(
                  Icons.code,
                  color: AppTheme.primaryColor,
                ),
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text('Welcome, New Player!'),
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text('Create a name and slogan for your character.'),
              ),
              const SizedBox(height: 30),

              // Input fields
              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppTheme.textColor,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_2),
                  labelText: 'Character Name',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppTheme.textColor,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.chat),
                  labelText: 'Character Slogan',
                ),
              ),
              const SizedBox(height: 30),

              const Center(
                child: Icon(
                  Icons.code,
                  color: AppTheme.primaryColor,
                ),
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text('Choose a Vocation!'),
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text('This determines your available skills.'),
              ),
              const SizedBox(height: 30),

              // Vocation cards
              VocationCard(
                vocation: VocationType.junkie,
                isSelected: _selectedVocation == VocationType.junkie,
                onSelect: () => selectVocation(VocationType.junkie),
              ),
              const SizedBox(height: 10),
              VocationCard(
                vocation: VocationType.wizard,
                isSelected: _selectedVocation == VocationType.wizard,
                onSelect: () => selectVocation(VocationType.wizard),
              ),
              const SizedBox(height: 10),
              VocationCard(
                vocation: VocationType.raider,
                isSelected: _selectedVocation == VocationType.raider,
                onSelect: () => selectVocation(VocationType.raider),
              ),
              const SizedBox(height: 10),
              VocationCard(
                vocation: VocationType.ninja,
                isSelected: _selectedVocation == VocationType.ninja,
                onSelect: () => selectVocation(VocationType.ninja),
              ),
              const SizedBox(height: 30),

              // Error message display
              if (_errorMessage != null) ...[
                const SizedBox(height: 20),
                Text(
                  _errorMessage!,
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ],

              // Submit button
              StyledButton(
                onPressed: handleSubmit,
                child: const Text(
                  'Create Character',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
