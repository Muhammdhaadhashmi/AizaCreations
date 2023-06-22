// ignore_for_file: invalid_use_of_protected_member, camel_case_types

import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/HistoryModule/View/HistoryTile.dart';
import 'package:aizacreationzz/AppModules/MyCartModule/Model/CartModel.dart';
import 'package:aizacreationzz/AppModules/MyCartModule/ViewController/ProductCounter.dart';
import 'package:aizacreationzz/AppModules/MyCartModule/ViewModel/myCartViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/AppBar.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/Buttons/CustomButton.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';

class MyCartViewController extends StatefulWidget {
  @override
  _MyCartViewControllerState createState() => _MyCartViewControllerState();
}

class _MyCartViewControllerState extends State<MyCartViewController> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final controller = Get.put(cart_view_model());
  Future? getfav;

  @override
  void initState() {
    super.initState();

    getfav = controller.onGetCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: AppConfig(context: context).height,
      width: AppConfig(context: context).width,
      child: Column(
        children: [
          customAppBar(
              onSearch: (value) {},
              scaffoldKey: scaffoldKey,
              context: context,
              text: "My Cart",
              isDrawer: false,
              isSearch: false,
              isCart: false),
          Expanded(
              child: FutureBuilder(
                  future: getfav,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        snapshot.connectionState == ConnectionState.active)
                      return Center(
                        child: SpinKitView(
                          themeIsDark: false,
                        ),
                      );
                    if (controller.cartList.isEmpty)
                      return Center(
                        child: Text("No Product in Cart"),
                      );
                    if (controller.cartList.isEmpty)
                      return Center(
                        child: Text("No Product in Cart"),
                      );

                    return Obx(() => controller.cartList.isNotEmpty
                        ? ListView.builder(
                            key: UniqueKey(),
                            itemCount: controller.cartList.length,
                            itemBuilder: (context, index) {
                              return myCartTile(
                                index: index,
                                cart: controller.cartList[index],
                              );
                            },
                          )
                        : Center(
                            child: Text("No Product in Cart"),
                          ));
                  })),
          Obx(
            () => controller.cartList.value.isEmpty ||
                    controller.cartList.value.isEmpty
                ? SizedBox()
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                myText(
                                    txtalign: TextAlign.start,
                                    title: "Total Product",
                                    color: Colors.grey,
                                    size: 14,
                                    fontweight: FontWeight.w500),
                                Spacer(),
                                Obx(
                                  () => myText(
                                      txtalign: TextAlign.start,
                                      title: "${controller.cartList.length}",
                                      // title: "${controller.cartList.length}",
                                      color: Colors.black,
                                      size: 14,
                                      fontweight: FontWeight.w500),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                myText(
                                    txtalign: TextAlign.start,
                                    title: "Total Price",
                                    color: Colors.grey,
                                    size: 14,
                                    fontweight: FontWeight.w500),
                                Spacer(),
                                Obx(
                                  () => myText(
                                      txtalign: TextAlign.start,
                                      title: "${controller.totalPrice} PKR",
                                      color: Colors.black,
                                      size: 14,
                                      fontweight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CustomButton(
                          text: "Place Order",
                          callback: () {
                            controller.onBuyCart(context: context);
                          },
                          height: 45,
                          textColor: Colors.white,
                          width: AppConfig(context: context).width - 50,
                          btnColor: AppColor().primaryColor,
                          borderColor: Colors.transparent),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
          ),
        ],
      ),
    ));
  }
}

class myCartTile extends StatefulWidget {
  final Cart cart;
  final int index;

  myCartTile({Key? key, required this.index, required this.cart})
      : super(key: key);

  @override
  _myCartTileState createState() => _myCartTileState();
}

class _myCartTileState extends State<myCartTile> {
  final controller = Get.put(cart_view_model());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)]),
        // height: 100,
        width: AppConfig(context: context).width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 140,
              width: 100,
              child: GFImageOverlay(
                // colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                borderRadius: BorderRadius.circular(10),
                image: NetworkImage(
                    ApisUtills().imageUrl + "${widget.cart.pro_image}"),
                boxFit: BoxFit.cover,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: myText(
                                  softWrap: false,
                                  maxLines: 4,
                                  txtalign: TextAlign.start,
                                  title: "${widget.cart.pro_name}",
                                  txtOverFlow: TextOverflow.ellipsis,
                                  color: AppColor().primaryColor,
                                  size: 14,
                                  fontweight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        onPressed: () {
                          print("del cart this");

                          showLoadingIndicator(context: context);

                          controller.onRemoveCart(
                              product_id: widget.cart.productId,
                              context: context);
                        },
                        icon: Icon(
                          Icons.clear,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  // myText(
                  //     title: "${cart.pro_discription}",
                  //     color: Colors.black45,
                  //     // size: 14,
                  //     fontweight: FontWeight.w500),
                  widget.cart.pro_discount.isNotEmpty &&
                          int.parse(widget.cart.pro_discount) != 0
                      ? myText(
                          title: "${widget.cart.pro_discount} PKR",
                          color: Colors.black,
                          fontweight: FontWeight.w800)
                      : myText(
                          title: "${widget.cart.pro_price} PKR",
                          color: Colors.black,
                          fontweight: FontWeight.w800),
                  SizedBox(
                    height: 12,
                  ),

                  productCounter(
                      callBack: (value, oldValue) async {
                        if (value > oldValue) {
                          print("increment");
                          controller.updatePrice(
                              price: double.parse(getPrice(
                                      controller.cartList.value[widget.index]
                                          .pro_discount,
                                      controller.cartList.value[widget.index]
                                          .pro_price)
                                  .toString()),
                              isAdd: true);
                        } else {
                          print("decrement");
                          controller.updatePrice(
                              price: double.parse(getPrice(
                                      controller.cartList.value[widget.index]
                                          .pro_discount,
                                      controller.cartList.value[widget.index]
                                          .pro_price)
                                  .toString()),
                              isAdd: false);
                        }
                        await controller.onEditCart(
                          product_id: widget.cart.productId,
                          product_qty: value.toString(),
                        );

                        // // setState(() {
                        // var price = int.parse(widget.cart.orignalPrice) *
                        //     int.parse(value.toString());
                        // setState(() {
                        //   widget.cart.pro_price = price.toString();
                        //   widget.cart.prodQty = value.toString();
                        // });
                      },
                      totalGuantity: "${widget.cart.pro_quantity}",
                      givenGuantity: "${widget.cart.prodQty}"),

                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// getPrice(String discount, String price) {
//   int dis = 0;
//   if (discount.isNotEmpty) {
//     dis = int.parse(discount);
//   }
//
//   return int.parse(price) - dis;
// }
