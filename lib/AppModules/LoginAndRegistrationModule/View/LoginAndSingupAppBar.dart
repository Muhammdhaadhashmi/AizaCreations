

import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget loginAppBar({required Widget body,required double width,required double height}) {

  return ClipPath(
    clipper: MyCustomClipper(),
    child: Container(
      width:width,
      height: height,
      decoration: BoxDecoration(
        color: AppColor().primaryColor,
      ),
      child: body,
    ),
  );
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height)
      ..arcToPoint(Offset(25, size.height - 20),
          radius: Radius.circular(30), clockwise: true)
      ..lineTo(size.width - 25, size.height - 20)
      ..arcToPoint(Offset(size.width, size.height), radius: Radius.circular(30))
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
