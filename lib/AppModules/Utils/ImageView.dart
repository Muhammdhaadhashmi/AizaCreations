import 'package:flutter/cupertino.dart';

Widget assetImageView({required String img,required double height,required Color imageColor}){
  return Image(image: AssetImage(img),height: height,color: imageColor,);
}