import 'package:flutter/material.dart';

class AunthenticationButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const AunthenticationButton(
      {Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          minimumSize: MaterialStateProperty.all(
            const Size(double.infinity, 50.0),
          )),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
