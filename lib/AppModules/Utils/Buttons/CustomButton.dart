import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class CustomButton extends StatelessWidget {
  final Callback callback;
  final String text;
  final Color textColor;
  final Color btnColor;
  final Color borderColor;
  final double width;
  final double height;

  CustomButton(
      {required this.text,
      required this.callback,
      required this.height,
      required this.textColor,
      required this.width,
      required this.btnColor,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: borderColor,
          ),
          // boxShadow:[
          //   BoxShadow(
          //     color: Colors.grey[300],
          //     spreadRadius: 3,
          //     blurRadius: 5,
          //
          //     offset: Offset(0, 3),
          //   ),
          // ],
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontSize: 15, color: textColor, fontWeight: FontWeight.w600),
        )),
      ),
      onTap: callback,
    );
  }
}
