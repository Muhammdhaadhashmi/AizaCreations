// ignore: unused_import
import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';

Widget historySelector(
    {required VoidCallback onTap, required Color color, required String text}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Container(
      height: 40,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          myText(
            txtalign: TextAlign.start,
            title: "   $text   ",
            color: Colors.white,
            fontweight: FontWeight.w700,
          ),
        ],
      ),
    ),
  );
}
