import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:flutter/material.dart';

Widget drawerTile(
    {required String title,
    bool isIcon = false,
    IconData? icon,
    required String img,
    required VoidCallback callBack,
    bool issetting = false}) {
  return InkWell(
    onTap: callBack,
    child: Container(
      // color: Colors.green,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          !issetting
              ? SizedBox(
                  width: 40,
                )
              : SizedBox(
                  width: 20,
                ),
          !isIcon
              ? Image(
                  image: AssetImage(img),
                  height: 20,
                  color: AppColor().primaryColor,
                )
              : Icon(
                  icon,
                  color: AppColor().primaryColor,
                ),
          SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
          ),
        ],
      ),
    ),
  );
}
