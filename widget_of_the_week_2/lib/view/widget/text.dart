import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String text;
  final bool bold;
  final double size;
  const TextView(
      {Key? key, required this.bold, required this.size, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        fontSize: size,
        color: Colors.white,
      ),
    );
  }
}
