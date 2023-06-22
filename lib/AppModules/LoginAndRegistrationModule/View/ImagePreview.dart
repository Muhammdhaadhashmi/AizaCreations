

import 'dart:io';

import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/Utils/CustomImagePicker.dart';
import 'package:flutter/material.dart';

Widget imagePreView(
    {required BuildContext context, var image, var controller}) {
  return Stack(
    children: [
      Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(
            color: AppColor().primaryColor,
            borderRadius: BorderRadius.circular(90),
          )),
      Positioned(
        top: 4,
        left: 5,
        child: GestureDetector(
            onTap: () {
              CustomImagePicker().showPicker(
                  context: context,
                  onGetImage: (image) {
                    controller.image.value = image;
                  });
            },
            child: image != ""
                ? ClipRRect(
                borderRadius: BorderRadius.circular(75.0),
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(75.0),
                  ),
                  child: Image.file(
                    File(image),
                    fit: BoxFit.cover,
                  ),
                ))
                : Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(75),
                image:DecorationImage(image: AssetImage('assets/mens.jpg')),
              ),

            )),
      ),
      Positioned(
        bottom: 5,
        right: 3,
        child: GestureDetector(
          onTap: () {
            CustomImagePicker().showPicker(
                context: context,
                onGetImage: (image) {
                  controller.image.value = image;
                });
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: AppColor().primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.grey,
                size: 22,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
