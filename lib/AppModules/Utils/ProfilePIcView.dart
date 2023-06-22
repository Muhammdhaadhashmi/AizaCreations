import 'dart:io';

import 'package:aizacreationzz/AppModules/Utils/ImageView.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';

// ignore: non_constant_identifier_names
Widget ProfilePicView(
    {required BuildContext context,
    var image,
    required VoidCallback callback,
    bool isFile = true}) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.height;
  return InkWell(
    onTap: callback,
    child: image == null
        ? Container(
            height: height / 6.5,
            width: width / 6.5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                assetImageView(
                    height: 35,
                    img: "assets/RootPage/cameraIcon.png",
                    imageColor: Color(0xFF2C64FF)),
                SizedBox(
                  height: 5,
                ),
                myText(title: "Add photo", size: 12, color: Colors.grey),
              ],
            ),
          )
        : isFile
            ? GFImageOverlay(
                height: height / 6.5,
                border: Border.all(color: Colors.green, width: 4),
                width: width / 6.5,
                shape: BoxShape.circle,
                image: FileImage(File(image)),
                boxFit: BoxFit.cover,
              )
            : GFImageOverlay(
                height: height / 6.5,
                border: Border.all(color: Colors.green, width: 4),
                width: width / 6.5,
                shape: BoxShape.circle,
                image: NetworkImage(
                    "${ApisUtills().baseUrl}files/Personal/" + image),
                boxFit: BoxFit.cover,
              ),
  );
}
