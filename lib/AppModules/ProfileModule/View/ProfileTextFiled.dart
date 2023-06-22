import 'package:flutter/material.dart';

Widget profileInputFiled({
  required BuildContext context,
  required double width,
  required String hintText,
  required String labelText,
  required Function onChange,
}) {
  return Container(
    width: width,
    child: TextFormField(
      cursorColor: Colors.grey[500],
      onChanged: (value) {
        onChange(value);
      },
      decoration: InputDecoration(
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
          // borderRadius: BorderRadius.only(
          //   topRight: Radius.elliptical(120, 120),
          // ),
        ),
        contentPadding:
        new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        fillColor: Colors.grey,
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.orangeAccent,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.grey),
          // borderRadius: BorderRadius.only(
          //   topRight: Radius.elliptical(120, 120),
          // ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.orangeAccent),
          // borderRadius: BorderRadius.only(
          //   topRight: Radius.elliptical(120, 120),
          // ),
        ),
      ),
    ),
  );
}
