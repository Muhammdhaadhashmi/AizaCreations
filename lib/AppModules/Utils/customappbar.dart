import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/Utils/Buttons/BackButton.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget InnerAppbar({
  required BuildContext context,
  String title = "",
  // String icon = "",
  // bool isIcon = false
  bool isBack = true,
}) {
  return Container(
    height: MediaQuery.of(context).size.height / 7,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: AppColor().primaryColor,
      // gradient: AppColor().gradient,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
    ),
    child: Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 20,
          ),
          isBack
              ? backNavigate(
                  iconclr: Colors.white,
                  callback: () {
                    Navigator.pop(context);
                  })
              : SizedBox(),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
