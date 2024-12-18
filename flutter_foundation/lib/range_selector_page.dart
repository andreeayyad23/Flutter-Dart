import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_foundation/result_page.dart';

class RangeSelectorPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _minController = TextEditingController();
  final _maxController = TextEditingController();

  RangeSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Range Selector'),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRangeSelectorField(
                label: 'Enter minimum value',
                controller: _minController,
              ),
              const SizedBox(height: 16),
              _buildRangeSelectorField(
                label: 'Enter maximum value',
                controller: _maxController,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final min = int.parse(_minController.text);
            final max = int.parse(_maxController.text);

            if (min >= max) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Minimum must be less than maximum'),
                ),
              );
              return;
            }

            // Correct Random Number Calculation
            final randomNumber = _generateRandomNumber(min, max);

            // Navigate to ResultPage with the random number
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPage(randomNumber: randomNumber),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildRangeSelectorField({
    required String label,
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a value';
        }
        if (int.tryParse(value) == null) {
          return 'Please enter a valid number';
        }
        return null;
      },
    );
  }

  int _generateRandomNumber(int min, int max) {
    final random = Random();
    return random.nextInt(max - min + 1) + min;
  }
}
