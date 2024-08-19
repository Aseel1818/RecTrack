import 'package:flutter/material.dart';

///Text style for the code.
class RTText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;

  const RTText(
      {super.key,
      required this.text,
      this.color,
      this.size,
      this.decoration,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size ?? 16,
          color: color ?? Colors.white,
          fontFamily: 'Poppins',
          decoration: TextDecoration.none,
          fontWeight: fontWeight ?? FontWeight.normal),
    );
  }
}
