import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:flutter/material.dart';

Widget decoratedContainer(
    {required BuildContext context,
    double height = 250,
    required Widget child}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    height: height,
    width: AppConfig(context: context).width - 50,
    child: child,
  );
}
