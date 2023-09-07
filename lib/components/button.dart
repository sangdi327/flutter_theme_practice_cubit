import 'package:flutter/material.dart';
import 'package:flutter_theme_practice/components/app_font.dart';

class MyButton extends StatelessWidget {
  const MyButton(
    this.onPressed,
    this.text, {
    super.key,
    this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    this.minimumSize = const Size(200, 50),
  });

  final Function() onPressed;
  final Color? backgroundColor;
  final EdgeInsets padding;
  final Size minimumSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: minimumSize,
      ),
      child: AppFont(
        text,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
