import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Icon icon;
  final Function onTap;
  const Button({Key? key, required this.onTap, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: icon,
      ),
    );
  }
}
