// ignore_for_file: dead_code

import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/HomeModule/Model/ProductModel.dart';
import 'package:aizacreationzz/AppModules/ProductsModule/View/ViewGeneralProduct.dart';
import 'package:aizacreationzz/AppModules/ProductsModule/View/ViewPreBookByIDProduct.dart';
import 'package:aizacreationzz/AppModules/ProductsModule/View/ViewSingleProduct.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget productTile(BuildContext context, ProductModel item, VoidCallback onFav,
    bool isfav, bool isPrebooking, bool isMyPrebooking,
    {bool? isLoggedIn}) {
  print("INSIDE FEATURE VIEW");
  print(item.pro_quantity);
  // print(isLoggedIn);
  // print(item.pro_quantity);
  // print(item.pro_discount);
  if (int.parse(item.pro_quantity) == 0 && isPrebooking) {
    return InkWell(
      onTap: () {
        // print("#####################v CHECK Pro QUANTITY");

        // Get.to(
        //   () => ViewProduct(
        //     preBookingProductImage: Image(
        //       image: NetworkImage(
        //         item.pro_image.isNotEmpty || item.pro_image.contains(".")
        //             ? ApisUtills().imageUrl + "${item.pro_image}"
        //             : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",

        //         // "${widget.controller!.categoriesList[index].categoryImage}",
        //       ),
        //       fit: BoxFit.fill,
        //     ),
        //     productdata: item,
        //     isPrebooking: isPrebooking,
        //     isMyPrebooking: isMyPrebooking,
        //   ),
        // );
      },
      child: Container(
        height: isMyPrebooking ? 220 : 220,
        width: 150,
        // margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                // alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    // item.pro_discount.isNotEmpty && int.parse(item.pro_discount)!=0?130:
                    // height: 160,
                    width: 180,
                    // height:  getPrice(item.pro_discount, item.pro_price ).toString()!=item.pro_price?130:140,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: AppColor().primaryColor))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      child: Image(
                        image: NetworkImage(
                          item.pro_image.isNotEmpty ||
                                  item.pro_image.contains(".")
                              ? ApisUtills().imageUrl + "${item.pro_image}"
                              : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",

                          // "${widget.controller!.categoriesList[index].categoryImage}",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 20,
                      decoration: BoxDecoration(
                        color: AppColor().primaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            myText(
                                title: "Sold Out",
                                color: Colors.white,
                                size: 10),
                            // SizedBox(
                            //   width: 2,
                            // ),
                            // myText(
                            //     title:
                            //         "${getDiscount(item.pro_discount, item.pro_price)}%",
                            //     color: Colors.white,
                            //     size: 9),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (isfav)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: InkWell(
                        onTap: () {
                          onFav();
                        },
                        child: Icon(
                          CupertinoIcons.heart_fill,
                          // IconData(0xf443,),
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
                    ),
                  if (!isfav)
                    isLoggedIn == true
                        ? Positioned(
                            right: 0,
                            bottom: 0,
                            child: InkWell(
                              onTap: () {
                                onFav();
                              },
                              child: Icon(
                                CupertinoIcons.heart_fill,
                                // IconData(0xf443,),
                                color: item.isliked ? Colors.red : Colors.white,
                                size: 25,
                              ),
                            ),
                          )
                        : Container(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 5, top: 0),
              child: Container(
                // height: 60,
                // color: Colors.black45,
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    myText(
                        txtOverFlow: TextOverflow.ellipsis,
                        title: "${item.pro_name}".capitalize!,
                        color: AppColor().primaryColor,
                        txtalign: TextAlign.start,
                        size: 10,
                        fontweight: FontWeight.w600),
                    if (isMyPrebooking)
                      Row(
                        children: [
                          myText(
                              title: "Quantity : ",
                              color: Colors.black,
                              size: 10,
                              fontweight: FontWeight.w500),
                          myText(
                              title: "${item.pro_quantity}",
                              color: AppColor().primaryColor,
                              size: 10,
                              fontweight: FontWeight.w600),
                        ],
                      ),
                    if (isMyPrebooking)
                      Row(
                        children: [
                          myText(
                              title: "Booking Date : ",
                              color: Colors.black,
                              size: 10,
                              fontweight: FontWeight.w500),
                          myText(
                              title: "${item.prebooking_date}",
                              color: AppColor().primaryColor,
                              size: 10,
                              fontweight: FontWeight.w600),
                        ],
                      ),
                    if (!isMyPrebooking)
                      SizedBox(
                        height: 5,
                      ),
                    // if(getPrice(item.pro_discount, item.pro_price ).toString()!=item.pro_price)
                    // if(item.pro_discount.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: myText(
                          textDecoration: item.pro_discount.isNotEmpty &&
                                  int.parse(item.pro_discount) != 0
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          title: "${item.pro_price} PKR",
                          color: Colors.black,
                          size: 14,
                          fontweight: FontWeight.w800),
                    ),
                    if (item.pro_discount.isNotEmpty &&
                        int.parse(item.pro_discount) != 0)
                      myText(
                          title: " ${item.pro_discount} PKR",
                          // " ${getPrice(item.pro_discount, item.pro_price)} RS",
                          color: Colors.black,
                          size: 14,
                          fontweight: FontWeight.w800),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } else {
    return InkWell(
      onTap: () {
        print("#####################v CHECK Pro QUANTITY");

        Get.to(
          () => ViewProduct(
            preBookingProductImage: Image(
              image: NetworkImage(
                item.pro_image.isNotEmpty || item.pro_image.contains(".")
                    ? ApisUtills().imageUrl + "${item.pro_image}"
                    : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",

                // "${widget.controller!.categoriesList[index].categoryImage}",
              ),
              fit: BoxFit.fill,
            ),
            productdata: item,
            isPrebooking: isPrebooking,
            isMyPrebooking: isMyPrebooking,
          ),
        );
      },
      child: Container(
        height: isMyPrebooking ? 220 : 220,
        width: 150,
        // margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                // alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    // item.pro_discount.isNotEmpty && int.parse(item.pro_discount)!=0?130:
                    // height: 160,
                    width: 180,
                    // height:  getPrice(item.pro_discount, item.pro_price ).toString()!=item.pro_price?130:140,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: AppColor().primaryColor))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      child: Image(
                        image: NetworkImage(
                          item.pro_image.isNotEmpty ||
                                  item.pro_image.contains(".")
                              ? ApisUtills().imageUrl + "${item.pro_image}"
                              : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",

                          // "${widget.controller!.categoriesList[index].categoryImage}",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  if (item.pro_discount.isNotEmpty)
                    if (int.parse(
                            item.pro_discount.toString().replaceAll("@", "")) !=
                        0)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColor().primaryColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                
                                myText(
                                    title:
                                        "  ${(100 * ((double.parse(item.pro_price) - double.parse(item.pro_discount)) / double.parse(item.pro_price))).toStringAsFixed(1)} % Discount",
                                    color: Colors.white,
                                    size: 10),
                                // SizedBox(
                                //   width: 2,
                                // ),
                                // myText(
                                //     title:
                                //         "${getDiscount(item.pro_discount, item.pro_price)}%",
                                //     color: Colors.white,
                                //     size: 9),
                              ],
                            ),
                          ),
                        ),
                      ),
                  if (isfav)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: InkWell(
                        onTap: () {
                          onFav();
                        },
                        child: Icon(
                          CupertinoIcons.heart_fill,
                          // IconData(0xf443,),
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
//                 LikeButton(
//                   isLiked:  isfav ,
//
//                   bubblesColor: BubblesColor(
//                     dotPrimaryColor: Colors.green,
//                     dotSecondaryColor: Colors.white,
//                   ),
//                   // onTap: (isLiked) =>   onFav(),
// onTap: (isLiked)async {
//   onFav();
//                     return false;
// },
//                   likeBuilder: (bool isLiked) {
//
//                     //
//                     return Icon(
//                       CupertinoIcons.heart_fill,
//                       // IconData(0xf443,),
//                       color: isLiked ? Colors.green : Colors.white,
//                       size: 25,
//                     );
//                   },
//                 ),
                    ),
                  if (!isfav)
                    isLoggedIn == true
                        ? Positioned(
                            right: 0,
                            bottom: 0,
                            child: InkWell(
                              onTap: () {
                                onFav();
                              },
                              child: Icon(
                                CupertinoIcons.heart_fill,
                                // IconData(0xf443,),
                                color: item.isliked ? Colors.red : Colors.white,
                                size: 25,
                              ),
                            ),
//                 LikeButton(
//                   isLiked:  isfav ,
//
//                   bubblesColor: BubblesColor(
//                     dotPrimaryColor: Colors.green,
//                     dotSecondaryColor: Colors.white,
//                   ),
//                   // onTap: (isLiked) =>   onFav(),
// onTap: (isLiked)async {
//   onFav();
//                     return false;
// },
//                   likeBuilder: (bool isLiked) {
//
//                     //
//                     return Icon(
//                       CupertinoIcons.heart_fill,
//                       // IconData(0xf443,),
//                       color: isLiked ? Colors.green : Colors.white,
//                       size: 25,
//                     );
//                   },
//                 ),
                          )
                        : Container(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 5, top: 0),
              child: Container(
                // height: 60,
                // color: Colors.black45,
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    
                    myText(
                        txtOverFlow: TextOverflow.ellipsis,
                        title: "${item.pro_name}".capitalize!,
                        color: AppColor().primaryColor,
                        txtalign: TextAlign.start,
                        size: 20,
                        fontweight: FontWeight.bold),
                    if (isMyPrebooking)
                      Row(
                        children: [
                          myText(
                              title: "Quantity : ",
                              color: Colors.black,
                              size: 10,
                              fontweight: FontWeight.w500),
                          myText(
                              title: "${item.pro_quantity}",
                              color: AppColor().primaryColor,
                              size: 10,
                              fontweight: FontWeight.w600),
                        ],
                      ),
                    if (isMyPrebooking)
                      Row(
                        children: [
                          myText(
                              title: "Booking Date : ",
                              color: Colors.black,
                              size: 10,
                              fontweight: FontWeight.w500),
                          myText(
                              title: "${item.prebooking_date}",
                              color: AppColor().primaryColor,
                              size: 10,
                              fontweight: FontWeight.w600),
                        ],
                      ),
                    if (!isMyPrebooking)
                      SizedBox(
                        height: 5,
                      ),
                    // if(getPrice(item.pro_discount, item.pro_price ).toString()!=item.pro_price)
                    // if(item.pro_discount.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: myText(
                          textDecoration: item.pro_discount.isNotEmpty &&
                                  int.parse(item.pro_discount) != 0
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          title: "${item.pro_price} PKR",
                          color: Colors.black,
                          size: 14,
                          fontweight: FontWeight.w800),
                    ),
                    if (item.pro_discount.isNotEmpty &&
                        int.parse(item.pro_discount) != 0)
                      myText(
                          title: " ${item.pro_discount} PKR",
                          // " ${getPrice(item.pro_discount, item.pro_price)} RS",
                          color: Colors.black,
                          size: 14,
                          fontweight: FontWeight.w800),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget generalproductTile(
  BuildContext context,
  item,
  VoidCallback onFav,
  bool isfav,
  bool isPrebooking,
  bool isMyPrebooking, {
  bool? isLoggedIn,
}) {
  print("INSIDE FEATURE VIEW");

  if (int.parse(item["pro_quantity"]) == 0 && isPrebooking) {
    return InkWell(
      onTap: () {
        Get.to(
          () => ViewGeneralProduct(
            preBookingProductImage: Image(
              image: NetworkImage(
                item["pro_image"] != null || item["pro_image"].contains(".")
                    ? ApisUtills().imageUrl + "${item["pro_image"]}"
                    : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",
              ),
              fit: BoxFit.fill,
            ),
            productdata: item,
            isPrebooking: isPrebooking,
            isMyPrebooking: isMyPrebooking,
          ),
        );
      },
      child: Container(
        height: isMyPrebooking ? 220 : 220,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: AppColor().primaryColor))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      child: Image(
                        image: NetworkImage(
                          item["pro_image"] != null
                              ? ApisUtills().imageUrl + "${item["pro_image"]}"
                              : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 20,
                      decoration: BoxDecoration(
                        color: AppColor().primaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            myText(
                                title: "Sold Out",
                                color: Colors.white,
                                size: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (isfav)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: InkWell(
                        onTap: () {
                          onFav();
                        },
                        child: Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
                    ),
                  if (!isfav)
                    isLoggedIn == true
                        ? Positioned(
                            right: 0,
                            bottom: 0,
                            child: InkWell(
                              onTap: () {
                                onFav();
                              },
                              child: Icon(
                                CupertinoIcons.heart_fill,
                                color: false ? Colors.red : Colors.white,
                                size: 25,
                              ),
                            ),
                          )
                        : Container(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 5, top: 0),
              child: Container(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    myText(
                        txtOverFlow: TextOverflow.ellipsis,
                        title: "${item["pro_name"]}".capitalize!,
                        color: AppColor().primaryColor,
                        txtalign: TextAlign.start,
                        size: 10,
                        fontweight: FontWeight.w600),
                    if (isMyPrebooking)
                      Row(
                        children: [
                          myText(
                              title: "Quantity : ",
                              color: Colors.black,
                              size: 10,
                              fontweight: FontWeight.w500),
                          myText(
                              title: "${item["pro_quantity"]}",
                              color: AppColor().primaryColor,
                              size: 10,
                              fontweight: FontWeight.w600),
                        ],
                      ),
                    if (!isMyPrebooking)
                      SizedBox(
                        height: 5,
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: myText(
                          textDecoration: item["pro_discount"] != null &&
                                  int.parse(item["pro_discount"]) != 0
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          title: "${item["pro_price"]} PKR",
                          color: Colors.black,
                          size: 14,
                          fontweight: FontWeight.w800),
                    ),
                    if (item["pro_discount"] != null &&
                        int.parse(item["pro_discount"]) != 0)
                      myText(
                          title: " ${item["pro_discount"]} PKR",
                          color: Colors.black,
                          size: 14,
                          fontweight: FontWeight.w800),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } else {
    return InkWell(
      onTap: () {
        print("#####################v CHECK Pro QUANTITY");

        Get.to(
          () => ViewGeneralProduct(
            preBookingProductImage: Image(
              image: NetworkImage(
                item["pro_image"] != null
                    ? ApisUtills().imageUrl + "${item["pro_image"]}"
                    : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",
              ),
              fit: BoxFit.fill,
            ),
            productdata: item,
            isPrebooking: isPrebooking,
            isMyPrebooking: isMyPrebooking,
          ),
        );
      },
      child: Container(
        height: isMyPrebooking ? 220 : 220,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: AppColor().primaryColor))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      child: Image(
                        image: NetworkImage(
                          item["pro_image"] != null
                              ? ApisUtills().imageUrl + "${item["pro_image"]}"
                              : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  if (item["pro_discount"] != null)
                    if (int.parse(item["pro_discount"]
                            .toString()
                            .replaceAll("@", "")) !=
                        0)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColor().primaryColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                myText(
                                    title:
                                        "${double.parse(item["pro_price"] - (double.parse(item["pro_price"] * double.parse(item["pro_discount"]) / 100).toStringAsFixed(1)))} % Discount",
                                    color: Colors.white,
                                    size: 10),
                              ],
                            ),
                          ),
                        ),
                      ),
                  if (isfav)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: InkWell(
                        onTap: () {
                          onFav();
                        },
                        child: Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
                    ),
                  if (!isfav)
                    isLoggedIn == true
                        ? Positioned(
                            right: 0,
                            bottom: 0,
                            child: InkWell(
                              onTap: () {
                                onFav();
                              },
                              child: Icon(
                                CupertinoIcons.heart_fill,
                                color: false ? Colors.red : Colors.white,
                                size: 25,
                              ),
                            ),
                          )
                        : Container(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 5, top: 0),
              child: Container(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    myText(
                        txtOverFlow: TextOverflow.ellipsis,
                        title: "${item["pro_name"]}".capitalize!,
                        color: AppColor().primaryColor,
                        txtalign: TextAlign.start,
                        size: 10,
                        fontweight: FontWeight.w600),
                    if (isMyPrebooking)
                      Row(
                        children: [
                          myText(
                              title: "Quantity : ",
                              color: Colors.black,
                              size: 10,
                              fontweight: FontWeight.w500),
                          myText(
                              title: "${item["pro_quantity"]}",
                              color: AppColor().primaryColor,
                              size: 10,
                              fontweight: FontWeight.w600),
                        ],
                      ),
                    if (!isMyPrebooking)
                      SizedBox(
                        height: 5,
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: myText(
                          textDecoration: item["pro_discount"] != null &&
                                  int.parse(item["pro_discount"]) != 0
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          title: "${item["pro_price"]} PKR",
                          color: Colors.black,
                          size: 14,
                          fontweight: FontWeight.w800),
                    ),
                    if (item["pro_discount"] != null &&
                        int.parse(item["pro_discount"]) != 0)
                      myText(
                          title: " ${item["pro_discount"]} PKR",
                          color: Colors.black,
                          size: 14,
                          fontweight: FontWeight.w800),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget preBookByIDproductTile(
  BuildContext context,
  item,
  VoidCallback onFav,
  bool isfav,
  bool isPrebooking,
  bool isMyPrebooking, {
  bool? isLoggedIn,
}) {
  print("INSIDE PRE BOOK ID PRODUCT TILE VIEW");

  if (int.parse(item["pre_qty"]) == 0) {
    return InkWell(
      onTap: () {
        // Get.to(
        //   () => ViewGeneralProduct(
        //     preBookingProductImage: Image(
        //       image: NetworkImage(
        //         item["pre_image"] != null || item["pre_image"].contains(".")
        //             ? ApisUtills().imageUrl + "${item["pre_image"]}"
        //             : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",
        //       ),
        //       fit: BoxFit.fill,
        //     ),
        //     productdata: item,
        //     isPrebooking: isPrebooking,
        //     isMyPrebooking: isMyPrebooking,
        //   ),
        // );
      },
      child: Container(
        height: isMyPrebooking ? 220 : 220,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: AppColor().primaryColor))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      child: Image(
                        image: NetworkImage(
                          item["pre_image"] != null
                              ? ApisUtills().imageUrl + "${item["pre_image"]}"
                              : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 20,
                      decoration: BoxDecoration(
                        color: AppColor().primaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            myText(
                                title: "Sold Out",
                                color: Colors.white,
                                size: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (isfav)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: InkWell(
                        onTap: () {
                          onFav();
                        },
                        child: Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
                    ),
                  if (!isfav)
                    isLoggedIn == true
                        ? Positioned(
                            right: 0,
                            bottom: 0,
                            child: InkWell(
                              onTap: () {
                                onFav();
                              },
                              child: Icon(
                                CupertinoIcons.heart_fill,
                                color: false ? Colors.red : Colors.white,
                                size: 25,
                              ),
                            ),
                          )
                        : Container(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 5, top: 0),
              child: Container(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: myText(
                          txtOverFlow: TextOverflow.ellipsis,
                          title: "${item["pre_name"]}".capitalize!,
                          color: AppColor().primaryColor,
                          txtalign: TextAlign.start,
                          size: 10,
                          fontweight: FontWeight.w600),
                    ),
                    if (isMyPrebooking)
                      Row(
                        children: [
                          myText(
                              title: "Quantity : ",
                              color: Colors.black,
                              size: 10,
                              fontweight: FontWeight.w500),
                          myText(
                              title: "${item["pre_qty"].toString()}",
                              color: AppColor().primaryColor,
                              size: 10,
                              fontweight: FontWeight.w600),
                        ],
                      ),
                    if (!isMyPrebooking)
                      SizedBox(
                        height: 5,
                      ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: myText(
                          title: "${item["pre_price"]} PKR",
                          color: Colors.black,
                          size: 14,
                          fontweight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } else {
    return InkWell(
      onTap: () {
        print("#####################v CHECK Pro QUANTITY");

        Get.to(
          () => ViewPreBookByIdProduct(
            preBookingProductImage:
            CachedNetworkImage(
                imageUrl:item["pre_image"] != null
                    ? ApisUtills().imageUrl + "${item["pre_image"]}"
                    : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",
              fit: BoxFit.fill,
              ),
       
          
            productdata: item,
            isPrebooking: isPrebooking,
            isMyPrebooking: isMyPrebooking,
          ),
        );
      },
      child: Container(
        height: isMyPrebooking ? 220 : 220,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: 180,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: AppColor().primaryColor))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      child: Image(
                        image: NetworkImage(
                          item["pre_image"] != null
                              ? ApisUtills().imageUrl + "${item["pre_image"]}"
                              : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxjR9X4tWivIypyHRSJAPLCk6XuRiXsYgDrwGcRapQIwG-8XSMPQFAIBaAjiym3ATlSQ&usqp=CAU",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  if (int.parse(item["pre_qty"]) == 0)
                    // if (int.parse(item["pre_discount"]
                    //         .toString()
                    //         .replaceAll("@", "")) !=
                    //     0)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: 20,
                        decoration: BoxDecoration(
                          color: AppColor().primaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              myText(
                                  title: " Sold Out",
                                  color: Colors.white,
                                  size: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (isfav)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: InkWell(
                        onTap: () {
                          onFav();
                        },
                        child: Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
                    ),
                  if (!isfav)
                    isLoggedIn == true
                        ? Positioned(
                            right: 0,
                            bottom: 0,
                            child: InkWell(
                              onTap: () {
                                onFav();
                              },
                              child: Icon(
                                CupertinoIcons.heart_fill,
                                color: false ? Colors.red : Colors.white,
                                size: 25,
                              ),
                            ),
                          )
                        : Container(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 5, top: 0),
              child: Container(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: myText(
                          txtOverFlow: TextOverflow.ellipsis,
                          title: "${item["pre_name"]}".capitalize!,
                          color: AppColor().primaryColor,
                          txtalign: TextAlign.start,
                          size: 10,
                          fontweight: FontWeight.w600),
                    ),
                    if (isMyPrebooking)
                      Row(
                        children: [
                          myText(
                              title: "Quantity : ",
                              color: Colors.black,
                              size: 10,
                              fontweight: FontWeight.w500),
                          myText(
                              title: "${item["pre_quantity"]}",
                              color: AppColor().primaryColor,
                              size: 10,
                              fontweight: FontWeight.w600),
                        ],
                      ),
                    if (!isMyPrebooking)
                      SizedBox(
                        height: 5,
                      ),
                    Container(
                      padding: const EdgeInsets.only(
                          // left: 2,
                          ),
                      child: myText(
                          txtalign: TextAlign.left,
                          title: "${item["pre_price"]} PKR",
                          color: Colors.black,
                          size: 14,
                          fontweight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
