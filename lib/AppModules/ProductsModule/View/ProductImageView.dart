import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: non_constant_identifier_names
Widget productImage_carousel_slider(
    {required List<String> images, required BuildContext context}) {
  return CarouselSlider(
    options: CarouselOptions(
      aspectRatio: 2.0,
      disableCenter: true,
      viewportFraction: 1,
      enlargeCenterPage: false,
      height: AppConfig(context: context).width +
          (MediaQuery.of(context).size.width / 2),
      // aspectRatio: 16 / 9,
      // viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: false,
      reverse: false,
      autoPlay: false,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      // enlargeCenterPage: true,
      // onPageChanged: callbackFunction,
      scrollDirection: Axis.horizontal,
    ),
    items: images.map((i) {
      return Builder(
        builder: (BuildContext context) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: MediaQuery.of(context).size.width,

              // decoration: BoxDecoration(
              //   color: AppColor().primaryColor,
              //   borderRadius: BorderRadius.circular(10),
              // ),S
              child: CachedNetworkImage(
                imageUrl: ApisUtills().imageUrl + "$i",
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: SpinKitFadingCircle(
                      size: 35,
                      color: AppColor().primaryColor,
                    ),
                  );
                },
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          );
        },
      );
    }).toList(),
  );
}
