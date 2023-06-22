import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

// ignore: non_constant_identifier_names
Widget GFXSelector(
    {required bool value,
    required String title,
    required Function callBack,
    bool isCircle = false}) {
  return Row(
    children: [
      GFCheckbox(
        size: 25,
        activeBgColor: Colors.white,
        activeBorderColor: Colors.grey,
        inactiveBorderColor: Colors.grey,
        activeIcon: Icon(
          Icons.circle,
          size: 18,
          color: Colors.blue,
        ),
        type: isCircle ? GFCheckboxType.circle : GFCheckboxType.square,
        onChanged: (value) {
          callBack(value);
          // controller.value.value = value;
        },
        value: value,
        inactiveIcon: null,
      ),
      SizedBox(
        width: 20,
      ),
      Text("$title",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColor().texLightColor))
    ],
  );
}
