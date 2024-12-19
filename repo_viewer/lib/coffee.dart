import 'package:flutter/material.dart';
import 'package:repo_viewer/styled_body_text.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int strength = 1;
  int sugar = 1;
  bool isStrengthButtonPressed = false;
  bool isSugarButtonPressed = false;

  void _incrementStrength() {
    if (!isStrengthButtonPressed) {
      setState(() {
        isStrengthButtonPressed = true; // Disable button
        strength = strength < 5 ? strength + 1 : 1; // Cycle strength
      });
      // Re-enable button after a short delay
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          isStrengthButtonPressed = false; // Enable button
        });
      });
    }
  }

  void _incrementSugar() {
    if (!isSugarButtonPressed) {
      setState(() {
        isSugarButtonPressed = true; // Disable button
        sugar = sugar < 5 ? sugar + 1 : 0; // Cycle sugar
      });
      // Re-enable button after a short delay
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          isSugarButtonPressed = false; // Enable button
        });
      });
    }
  }

  ButtonStyle _buttonStyle(bool isPressed) {
    return FilledButton.styleFrom(
      backgroundColor: isPressed ? Colors.grey : Colors.blue,
      foregroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const StyledBodyText('Strength: '),
            for (int i = 0; i < strength; i++)
              Image.asset(
                'assets/images/screen2.png', // Ensure this image path is correct
                width: 50,
                height: 50,
              ),
            const SizedBox(width: 20.0), // Adjusted spacing
            FilledButton(
              style: _buttonStyle(isStrengthButtonPressed),
              onPressed: isStrengthButtonPressed ? null : _incrementStrength,
              child: const Text('+'),
            ),
          ],
        ),
        Row(
          children: [
            const StyledBodyText('Sugar: '),
            if (sugar == 0)
              const StyledBodyText('None')
            else
              ...[
                for (int i = 0; i < sugar; i++)
                  Image.asset(
                    'assets/images/screen3.png', // Ensure this image path is correct
                    width: 50,
                    height: 50,
                  ),
              ],
            const SizedBox(width: 20.0), // Adjusted spacing
            FilledButton(
              style: _buttonStyle(isSugarButtonPressed),
              onPressed: isSugarButtonPressed ? null : _incrementSugar,
              child: const Text('+'),
            ),
          ],
        ),
      ],
    );
  }
}