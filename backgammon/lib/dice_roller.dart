import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;
  bool isRolling = false;
  Timer? _timer;

  void rollDice() {
    if (isRolling) return;
    isRolling = true;

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        currentDiceRoll = randomizer.nextInt(6) + 1;
      });
    });

    Future.delayed(const Duration(seconds: 2), () {
      _timer?.cancel();
      setState(() {
        currentDiceRoll = randomizer.nextInt(6) + 1;
        isRolling = false;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png',
          width: 200,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            backgroundColor: isRolling ? Colors.grey : Colors.blueAccent,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(color: Colors.white, width: 2),
            ),
          ),
          child: Text(isRolling ? 'Rolling...' : 'Roll Dice'),
        ),
      ],
    );
  }
}