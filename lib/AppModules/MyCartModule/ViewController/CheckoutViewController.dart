// import 'package:aizacreationzz/AppModules/AppRootPage/AppRootPage.dart';
// import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
// import 'package:aizacreationzz/AppModules/HomeModule/ViewController/HomeViewController.dart';
// import 'package:aizacreationzz/AppModules/MyCartModule/Model/CartModel.dart';
// import 'package:aizacreationzz/AppModules/MyCartModule/ViewController/MyCartViewController.dart';
// import 'package:aizacreationzz/AppModules/MyCartModule/ViewController/ShippingAddress.dart';
// import 'package:aizacreationzz/AppModules/MyCartModule/ViewModel/myCartViewModel.dart';
// import 'package:aizacreationzz/AppModules/Utils/AppBar.dart';
// import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
// import 'package:aizacreationzz/AppModules/Utils/Buttons/CustomButton.dart';
// import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
// import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class CheckoutViewController extends StatefulWidget {
//   @override
//   _CheckoutViewControllerState createState() => _CheckoutViewControllerState();
// }
//
// class _CheckoutViewControllerState extends State<CheckoutViewController> {
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//   final controller = Get.put(cart_view_model());
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // controller.totalPrice.value = 0;
//     // for (int i = 0; i < controller.cartList.length; i++) {
//     //   controller.totalPrice.value = controller.totalPrice.value +
//     //       int.parse(getPrice(controller.cartList[i].pro_discount,
//     //           controller.cartList[i].pro_price).toString());
//     // }
//   }
//
//   getPrice(String discount, String price) {
//     int dis = 0;
//     if (discount.isNotEmpty && int.parse(discount)!=0) {
//       dis = int.parse(discount);
//     }
//
//     return dis==0?int.parse(price):dis ;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         key: scaffoldKey,
//         body: Container(
//           height: AppConfig(context: context).height,
//           width: AppConfig(context: context).width,
//           child: Column(
//             children: [
//               customAppBar(
//                   onSearch: (value) {},
//                   scaffoldKey: scaffoldKey,
//                   context: context,
//                   text: "Check Out",
//                   isDrawer: false,
//                   isSearch: false,
//                   isCart: false),
//               Expanded(
//                 child: Obx(
//                   () => controller.isLoading.value
//                       ? Center(
//                           child: SpinKitView(themeIsDark: false),
//                         )
//                       : ListView.builder(
//                           itemCount: controller.cartList.length,
//                           itemBuilder: (context, index) {
//                             return myCartTile(
//                                 context, controller.cartList[index], (val) {
//                               controller.onEditCart(
//                                   product_id:
//                                       controller.cartList[index].productId,
//                                   product_qty: val);
//                             }, true, () {});
//                           },
//                         ),
//                 ),
//               ),
//
//               //     SizedBox(height: 10,),
//               // Padding(
//               //   padding: const EdgeInsets.only(left: 20, right: 10,top: 20),
//               //   child: Container(
//               //
//               //     width: AppConfig(context: context).width,
//               //     height: 100,
//               //     child: myText(
//               //         txtalign: TextAlign.start,
//               //         title:
//               //         "Address Shewrapara, Mirpur, \nDhaka-1216\n House no: 938\n Road no: 9",
//               //         color: AppColor().primaryColor,
//               //         size: 14,
//               //         fontweight: FontWeight.w600),
//               //   ),
//               // ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 height: 80,
//                 width: AppConfig(context: context).width,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 20, right: 20),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           myText(
//                               txtalign: TextAlign.start,
//                               title: "Total Product",
//                               color: Colors.grey,
//                               size: 14,
//                               fontweight: FontWeight.w500),
//                           Spacer(),
//                           Obx(
//                             () => myText(
//                                 txtalign: TextAlign.start,
//                                 title: "${controller.cartList.length}",
//                                 color: Colors.black,
//                                 size: 14,
//                                 fontweight: FontWeight.w500),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Divider(
//                         color: Colors.grey,
//                       ),
//                       Row(
//                         children: [
//                           myText(
//                               txtalign: TextAlign.start,
//                               title: "Total Price",
//                               color: Colors.grey,
//                               size: 14,
//                               fontweight: FontWeight.w500),
//                           Spacer(),
//                           Obx(
//                             () => myText(
//                                 txtalign: TextAlign.start,
//                                 title: "${controller.totalPrice}",
//                                 color: Colors.black,
//                                 size: 14,
//                                 fontweight: FontWeight.w500),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               CustomButton(
//                   text: "Buy",
//                   callback: () {
//                     controller.onBuyCart();
//                   },
//                   height: 45,
//                   textColor: Colors.white,
//                   width: AppConfig(context: context).width - 50,
//                   btnColor: AppColor().primaryColor,
//                   borderColor: Colors.transparent),
//               SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//         ));
//   }
//
// }
