// ignore_for_file: camel_case_types

import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/HomeModule/ViewModel/HomeViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/LocalDataBaseHandler.dart';
import '../MyCartModule/ViewController/MyCartViewController.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// String ?myCart ;
// ignore: must_be_immutable
class customAppBar extends StatefulWidget {
  BuildContext context;
  String text;
  String searchHint;
  TextInputType textInputType;
  Function onSearch;
  bool isDrawer;
  bool isSearch;
  bool isCart;
  GlobalKey<ScaffoldState> scaffoldKey;

  customAppBar({
    Key? key,
    required this.context,
    this.isSearch = true,
    this.searchHint = "What are you looking for?",
    this.textInputType = TextInputType.text,
    this.isCart = true,
    required this.text,
    required this.scaffoldKey,
    required this.onSearch,
    this.isDrawer = false,
  }) : super(key: key);

  @override
  _customAppBarState createState() => _customAppBarState();
}

class _customAppBarState extends State<customAppBar> {
  // String myCart = "0";
  int newCart = 0;
  @override
  void initState() {
    super.initState();
    getCart();
  }

  getCart() async {
    int data = await DatabaseHandler().getCart();
    setState(() {
      newCart = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.isSearch
        ? Container(
            height: AppConfig(context: context).height / 5.5,
            width: AppConfig(context: context).width,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  bottom: 30,
                  child: Container(
                    height: AppConfig(context: context).height / 5,
                    width: AppConfig(context: context).width,
                    decoration: BoxDecoration(
                      color: AppColor().primaryColor,
                      // borderRadius: BorderRadius.only(
                      //   bottomLeft: Radius.circular(24),
                      //   bottomRight: Radius.circular(24),
                      // ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              widget.isDrawer
                                  ? InkWell(
                                      onTap: () {
                                        widget.scaffoldKey.currentState!
                                            .openDrawer();
                                      },
                                      child: Icon(
                                        Icons.menu,
                                        color: Colors.white,
                                      ))
                                  : BackButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                              Text(
                                widget.text,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              widget.isCart
                                  ? Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        Container(
                                          // color: Colors.blue,
                                          padding: const EdgeInsets.all(10.0),
                                          child: InkWell(
                                              onTap: () {
                                                Get.to(() =>
                                                    MyCartViewController());
                                              },
                                              child: Icon(
                                                Icons.shopping_cart,
                                                color: Colors.white,
                                              )),
                                        ),
                                        Obx(() => Get.find<HomeViewModel>()
                                                    .cartNum
                                                    .value !=
                                                0
                                            ? Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    shape: BoxShape.circle),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Center(
                                                    child: Text(
                                                      "${Get.find<HomeViewModel>().cartNum.value}",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10),
                                                    ),
                                                  ),
                                                ))
                                            : SizedBox()),
                                        // SizedBox(height:20,width: 20,child: CircleAvatar(radius: 20,backgroundColor: Colors.blue,child: Text("${myCart}"),)),
                                      ],
                                    )
                                  : SizedBox(
                                      width: 20,
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (widget.isSearch)
                  Positioned(
                    bottom: 5,
                    child: Container(
                      width: AppConfig(context: context).width - 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 4)
                          ]),
                      child: Center(
                        child: TextFormField(
                          keyboardType: widget.textInputType,
                          cursorColor: AppColor().primaryColor,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(25)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(25)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(25)),
                              hintText: widget.searchHint),
                          onChanged: (value) {
                            widget.onSearch(value);
                          },
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          )
        : Container(
            height: 80,
            width: AppConfig(context: context).width,
            decoration: BoxDecoration(
              color: AppColor().primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.isDrawer
                          ? InkWell(
                              onTap: () {
                                widget.scaffoldKey.currentState!.openDrawer();
                              },
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                              ))
                          : BackButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                      Text(
                        widget.text,
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      widget.isCart
                          ? Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: InkWell(
                                      onTap: () {
                                        Get.to(() => MyCartViewController());
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => MyCartViewController(),)).then((value) => {
                                        // setState(() {
                                        //
                                        // }),
                                        // });
                                      },
                                      child: Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                      )),
                                ),
                                Obx(() =>
                                    Get.find<HomeViewModel>().cartNum.value != 0
                                        ? Container(
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                shape: BoxShape.circle),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Center(
                                                child: Text(
                                                  "${Get.find<HomeViewModel>().cartNum.value}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10),
                                                ),
                                              ),
                                            ))
                                        : SizedBox()),
                                // SizedBox(height:20,width: 20,child: CircleAvatar(radius: 20,backgroundColor: Colors.blue,child: Text("${myCart}"),)),
                              ],
                            )
                          : SizedBox(
                              width: 20,
                            ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}

// Widget customApBar(
//     {required BuildContext context,
//     required String text,
//     required Function onSearch,
//     bool isDrawer = false,
//     bool isSearch = true,
//     bool isCart = true,required GlobalKey<ScaffoldState> scaffoldKey}) {
//   return isSearch
//       ? Container(
//     height: AppConfig(context: context).height / 5.5,
//     width: AppConfig(context: context).width,
//     child: Stack(
//       alignment: Alignment.bottomCenter,
//       children: [
//         Positioned(
//           bottom: 30,
//           child: Container(
//             height: AppConfig(context: context).height / 5,
//             width: AppConfig(context: context).width,
//             decoration: BoxDecoration(
//               color: AppColor().primaryColor,
//               // borderRadius: BorderRadius.only(
//               //   bottomLeft: Radius.circular(24),
//               //   bottomRight: Radius.circular(24),
//               // ),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: 40,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20, right: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       isDrawer
//                           ? InkWell(
//                         onTap:(){
//                   scaffoldKey.currentState!.openDrawer();
//                 },
//                           child: Icon(
//                             Icons.menu,
//                             color: Colors.white,
//                           ))
//                           : BackButton(
//                         color: Colors.white,
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                       Text(
//                         text,
//                         style: TextStyle(
//                             fontSize: 17,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w700),
//                       ),
//                       isCart
//                           ? InkWell(
//                           onTap: () {
//                             Get.to(() => MyCartViewController());
//                           },
//                           child: Icon(
//                             Icons.shopping_cart,
//                             color: Colors.white,
//                           ))
//                           : SizedBox(
//                         width: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         if (isSearch)
//           Positioned(
//             bottom: 5,
//             child: Container(
//               width: AppConfig(context: context).width - 50,
//               height: 50,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(25),
//                   boxShadow: [
//                     BoxShadow(color: Colors.grey, blurRadius: 4)
//                   ]),
//               child: Center(
//                 child: TextField(
//                   cursorColor: AppColor().primaryColor,
//                   decoration: InputDecoration(
//                       prefixIcon: Icon(
//                         Icons.search,
//                         color: Colors.grey,
//                       ),
//                       border: OutlineInputBorder(
//                           borderSide:
//                           BorderSide(color: Colors.transparent),
//                           borderRadius: BorderRadius.circular(25)),
//                       enabledBorder: OutlineInputBorder(
//                           borderSide:
//                           BorderSide(color: Colors.transparent),
//                           borderRadius: BorderRadius.circular(25)),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide:
//                           BorderSide(color: Colors.transparent),
//                           borderRadius: BorderRadius.circular(25)),
//                       hintText: 'What are you looking for?'),
//                   onChanged: (value) {
//                  onSearch(value);
//                   },
//                 ),
//               ),
//             ),
//           ),
//       ],
//     ),
//   )
//       : Container(
//     height: 80,
//     width: AppConfig(context: context).width,
//     decoration: BoxDecoration(
//       color: AppColor().primaryColor,
//       borderRadius: BorderRadius.only(
//         bottomLeft: Radius.circular(24),
//         bottomRight: Radius.circular(24),
//       ),
//     ),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SizedBox(
//           height: 20,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 20, right: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               isDrawer
//                   ? InkWell(
//                   onTap:(){
//                     scaffoldKey.currentState!.openDrawer();
//                   },
//                   child: Icon(
//                     Icons.menu,
//                     color: Colors.white,
//                   ))
//                   : BackButton(
//                 color: Colors.white,
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               Text(
//                 text,
//                 style: TextStyle(
//                     fontSize: 17,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w700),
//               ),
//               isCart
//                   ? InkWell(
//                   onTap: () {
//                     Get.to(() => MyCartViewController());
//                   },
//                   child: Icon(
//                     Icons.shopping_cart,
//                     color: Colors.white,
//                   ))
//                   : SizedBox(
//                 width: 20,
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
