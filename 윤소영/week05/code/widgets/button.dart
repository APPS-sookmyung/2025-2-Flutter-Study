import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

  const Button({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        // 모서리 둥글게
        borderRadius: BorderRadius.circular(45),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          // 왼쪽은 20, 오른쪽은 50 padding
          vertical: 20,
          horizontal: 50,
        ),
        child: Text(text, style: TextStyle(color: textColor, fontSize: 20)),
      ),
    );
  }
}
