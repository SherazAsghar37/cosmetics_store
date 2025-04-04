import 'package:cosmetics_store/utils/colours.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double letterSpacing;
  final bool softWrap;
  final double? height;
  const AppText({
    super.key,
    required this.text,
    this.fontSize = 15,
    this.color = Colours.primaryTextColor,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.overflow,
    this.maxLines,
    this.letterSpacing = 0,
    this.softWrap = true,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        fontFamily: 'TT Hoves Pro Trial',
        height: height ?? 0,
      ),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}
