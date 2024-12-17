import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade700, // Gradient will still be applied at the Container level
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo with slight shadow
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/quiz-logo.png',
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                    color: const Color.fromARGB(150, 255, 255, 255),
                    colorBlendMode: BlendMode.modulate,
                  ),
                ),
                const SizedBox(height: 40),
                // Title with customized font
                Text(
                  'Learn Flutter the Fun Way!',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                // Start button with modern design
                ElevatedButton.icon(
                  onPressed: startQuiz,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.purpleAccent, // Button color
                    elevation: 5, // Button shadow
                  ),
                  icon: const Icon(Icons.arrow_forward, size: 24),
                  label: Text(
                    'Start Quiz',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
