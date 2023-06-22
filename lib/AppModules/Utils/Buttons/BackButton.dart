import 'package:flutter/material.dart';

Widget backNavigate(
    {required VoidCallback callback, Color iconclr = Colors.black}) {
  return InkWell(
    borderRadius: BorderRadius.circular(15),
    onTap: callback,
    child: Container(
      // height: 30,
      // width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.clear,
        color: iconclr,
      ),
    ),
  );
}
