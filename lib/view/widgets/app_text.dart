import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
      {super.key,
        required this.text,
        this.fontSize,
        this.fontWeight,
        this.color,
        this.textAlign, this.decoration});
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ??  Colors.black,
        //fontFamily: "Helvetica",
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 12,
        decoration: decoration??TextDecoration.none
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
