import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText(
       {required this.text,
        Key? key,
        this.style,
        this.textAlign = TextAlign.start,
        this.overflow,
        this.maxLines,
      }) : super(key: key);

  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
