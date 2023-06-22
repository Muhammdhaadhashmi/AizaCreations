import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/HistoryModule/Model/OrderDetailModel.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';

Widget historyTile(
    {required BuildContext context,
    required int index,
    required OrderDetailModel modelData}) {
  return InkWell(
    onTap: () {
      // Get..to(() => CheckoutViewController());
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        // height: 180,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)]),
        // height: 100,
        width: AppConfig(context: context).width - 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 5,
              ),
              Container(
                height: 160,
                width: 130,
                child: GFImageOverlay(
                  // colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                  borderRadius: BorderRadius.circular(10),
                  image: NetworkImage(
                      "https://app.aizacreationzz.com/upload/images/" +
                          modelData.proImage),
                  boxFit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    myText(
                        txtOverFlow: TextOverflow.ellipsis,
                        title: "${modelData.proName}".capitalize!,
                        color: AppColor().primaryColor,
                        size: 12,
                        fontweight: FontWeight.w600),

                    SizedBox(
                      height: 5,
                    ),
                    myText(
                        txtalign: TextAlign.left,
                        title: "${modelData.proDiscription}",
                        color: Colors.black45,
                        size: 10,
                        fontweight: FontWeight.w500),
                    SizedBox(
                      height: 3,
                    ),
                    // myText(
                    //     title: "${modelData.type}",
                    //     color: Colors.black45,
                    //     size: 10,
                    //     fontweight: FontWeight.w500),
                    // SizedBox(
                    //   height: 5,
                    // ), myText(
                    //     title: "Discount : ${modelData.proDiscount}",
                    //     color: Colors.black45,
                    //     size: 10,
                    //     fontweight: FontWeight.w500),
                    // SizedBox(
                    //   height: 3,
                    // ),
                    Row(
                      children: [
                        myText(
                            title: "Quantity : ",
                            color: Colors.black45,
                            size: 10,
                            fontweight: FontWeight.w500),
                        myText(
                            title: " ${modelData.totalqty}",
                            color: AppColor().primaryColor,
                            size: 10,
                            fontweight: FontWeight.w600),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        myText(
                            title: "Price : ",
                            color: Colors.black45,
                            size: 10,
                            fontweight: FontWeight.w500),
                        myText(
                            textDecoration: modelData.proDiscount.isNotEmpty &&
                                    int.parse(modelData.proDiscount) != 0
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            size: 12,
                            title: "${modelData.proPrice} PKR",
                            color: Colors.black,
                            fontweight: FontWeight.w700),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),

                    // if(getPrice(modelData.proDiscount, modelData.proPrice).toString()!=modelData.proPrice)
                    if (modelData.proDiscount.isNotEmpty &&
                        int.parse(modelData.proDiscount) != 0)
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          myText(
                              size: 12,
                              title: "${modelData.proDiscount} PKR",
                              color: Colors.black,
                              fontweight: FontWeight.w700),
                        ],
                      ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        myText(
                            title: "Total Price : ",
                            color: Colors.black45,
                            size: 10,
                            fontweight: FontWeight.w500),
                        myText(
                            size: 12,
                            title:
                                "${int.parse(modelData.totalqty) * getPrice(modelData.proDiscount, modelData.proPrice)} PKR",
                            color: Colors.black,
                            fontweight: FontWeight.w700),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

getPrice(String discount, String price) {
  int dis = 0;
  if (discount.isNotEmpty && int.parse(discount) != 0) {
    dis = int.parse(discount);
  }

  return dis == 0 ? int.parse(price) : dis;
}
