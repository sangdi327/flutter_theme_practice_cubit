import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFont extends StatelessWidget {
  const AppFont(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.fontSize = 15,
    this.letterSpacing,
    this.fontWeight,
    this.height,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final double fontSize;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.notoSans(
        color: fontSize >= 28
            ? color ?? Theme.of(context).textTheme.titleLarge!.color
            : color ?? Theme.of(context).textTheme.titleSmall!.color,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        height: height,
      ),
    );
  }
}
