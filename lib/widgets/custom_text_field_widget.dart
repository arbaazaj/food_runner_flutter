import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.iconData,
    this.isFilled = true,
    this.fillColor = Colors.white,
  });

  final String hintText;
  final IconData iconData;
  final bool isFilled;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          hintText: hintText,
          filled: isFilled,
          fillColor: fillColor,
        ),
      ),
    );
  }
}
