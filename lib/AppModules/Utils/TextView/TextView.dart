import 'package:flutter/material.dart';

Widget myText(
    {String title = "",
    FontWeight fontweight = FontWeight.w500,
    Color color = Colors.black,
    TextOverflow txtOverFlow = TextOverflow.visible,
    double size = 15,
    TextDecoration textDecoration = TextDecoration.none,
    TextAlign txtalign = TextAlign.center,
    maxLines,
    softWrap}) {
  return Text(
    title,
    overflow: txtOverFlow,
    textAlign: txtalign,
    maxLines: maxLines,
    softWrap: softWrap,
    style: TextStyle(
      decoration: textDecoration,
      fontWeight: fontweight,
      color: color,
      fontSize: size,
    ),
  );
}
