import 'package:flutter/material.dart';
import 'package:food_runner_flutter/themes/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.paddingTop = 16.0,
    required this.buttonText,
    required this.onPressed,
  });

  final double paddingTop;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: paddingTop),
      child: Row(
        children: [
          Expanded(
            child: FilledButton(
              style: const ButtonStyle(
                elevation: MaterialStatePropertyAll(2),
                shape: MaterialStatePropertyAll(BeveledRectangleBorder()),
                backgroundColor: MaterialStatePropertyAll(buttonColorRed),
              ),
              onPressed: onPressed,
              child: Text(
                buttonText,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
