import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed, // Pass the onPressed callback
      child: child, // Use the child parameter
    );
  }
}