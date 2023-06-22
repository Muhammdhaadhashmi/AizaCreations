import 'package:aizacreationzz/AppModules/AppRootPage/AppRootPage.dart';
import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/HomeModule/Model/ProductModel.dart';
import 'package:aizacreationzz/AppModules/HomeModule/ViewModel/HomeViewModel.dart';
import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/ViewController/StartScreenViewController.dart';
import 'package:aizacreationzz/AppModules/MyCartModule/ViewController/PreProductCounter.dart';
import 'package:aizacreationzz/AppModules/ProductsModule/View/ProductImageView.dart';
import 'package:aizacreationzz/AppModules/ProductsModule/ViewModel/SingleProductVM.dart';
import 'package:aizacreationzz/AppModules/Utils/AppBar.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/Buttons/CustomButton.dart';
import 'package:aizacreationzz/AppModules/Utils/LocalDataBaseHandler.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:aizacreationzz/AppModules/Utils/showmessage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ViewPreBookByIdProduct extends StatefulWidget {
  dynamic productdata;
  bool isPrebooking;
  bool isMyPrebooking;
  dynamic preBookingProductImage;

  ViewPreBookByIdProduct({
    required this.preBookingProductImage,
    required this.productdata,
    required this.isMyPrebooking,
    required this.isPrebooking,
  });

  @override
  _ViewPreBookByIdProductState createState() => _ViewPreBookByIdProductState();
}

class _ViewPreBookByIdProductState extends State<ViewPreBookByIdProduct> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final controller = Get.put(SingleProductVM());
  int prebookQuantity = 1;
  Future<List<String>>? imagesList;
  bool? isUserLoggedIn;
  ProductModel? item;

  Future checkUserLogin() async {
    dynamic checkUser = await DatabaseHandler().isExists('currentUser');
    return checkUser;
  }

  @override
  void initState() {
    super.initState();
    checkUserLogin().then((value) {
      setState(() {
        isUserLoggedIn = value; // Future is completed with a value.
      });
    });
    print("############3 CHECK THE OBJECT ");
    print(widget.productdata);
    imagesList = controller.onGetProductsImages(
        context: context, pro_id: widget.productdata["pre_id"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: Container(
          child: Column(
            children: [
              customAppBar(
                  onSearch: (value) {},
                  scaffoldKey: scaffoldKey,
                  context: context,
                  text: "My Product",
                  isDrawer: false,
                  isSearch: false,
                  isCart: true),
              Expanded(
                child: ListView(
                  children: [
                    widget.isPrebooking || widget.isMyPrebooking
                        ? widget.preBookingProductImage
                        : Container(),
                    widget.isPrebooking || widget.isMyPrebooking
                        ? SizedBox()
                        : Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: FutureBuilder<List<String>>(
                                    future: imagesList,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting)
                                        return Center(
                                          child:
                                              SpinKitView(themeIsDark: false),
                                        );
                                      if (snapshot.data == null)
                                        return Center(
                                          child: Text("No Detailed Images"),
                                        );
                                      if (snapshot.data!.isEmpty)
                                        return Center(
                                          child: Text("No Detailed Images"),
                                        );
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                1.6,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: productImage_carousel_slider(
                                            images: snapshot.data!,
                                            context: context),
                                      );
                                    }),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                            ],
                          ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 5),
                      child: Container(
                        height: 300,
                        // color: Colors.black45,
                        width: AppConfig(context: context).width,
                        child: ListView(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                myText(
                                    title: "${widget.productdata["pre_name"]}",
                                    color: AppColor().primaryColor,
                                    txtOverFlow: TextOverflow.ellipsis,
                                    size: 16,
                                    fontweight: FontWeight.w600),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                myText(
                                    title: "Price :",
                                    color: Colors.black45,
                                    size: 16,
                                    fontweight: FontWeight.w600),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColor().primaryColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: widget
                                                .productdata["pre_discount"] !=
                                            ""
                                        ? myText(
                                            title:
                                                "${widget.productdata["pre_discount"]} PKR",
                                            color: Colors.white,
                                            fontweight: FontWeight.w800)
                                        : myText(
                                            title:
                                                "${widget.productdata["pre_price"]} PKR",
                                            color: Colors.white,
                                            fontweight: FontWeight.w800),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                myText(
                                  title: "Description :",
                                  color: Colors.black45,
                                  size: 16,
                                  fontweight: FontWeight.w600,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            myText(
                                title:
                                    "${widget.productdata["pre_discription"]}",
                                color: Colors.black45,
                                txtalign: TextAlign.start,
                                size: 13,
                                fontweight: FontWeight.w500),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                myText(
                                    title: "Video URL :",
                                    color: Colors.black45,
                                    size: 14,
                                    fontweight: FontWeight.w600),
                                Spacer(),
                                InkWell(
                                    onTap: () async {
                                      // if (widget.productdata["pro_video"] ==
                                      //         null ||
                                      //     widget.productdata["pro_video"] ==
                                      //         "" ||
                                      //     widget.productdata["pro_video"]
                                      //         .isEmpty) {
                                      //   ShowMessage().showErrorMessage(context,
                                      //       "Sorry Video is Not Available for this product!");
                                      // } else {
                                      //   await launch(
                                      //       "${widget.productdata["pro_video"]}");
                                      // }

                                      // print(
                                      //   "${widget.productdata["pro_video"]}",
                                      // );
                                    },
                                    child: Image(
                                      image: AssetImage("assets/youtube.png"),
                                      height: 30,
                                    )),
                              ],
                            ),
                            if (widget.isPrebooking)
                              Center(
                                child: SizedBox(
                                  width: 150,
                                  child: PreProductCounter(
                                      callBack: (value, val) {
                                        print(value);
                                        print(val);
                                        setState(() {
                                          print("PRE BOOK VALUE");
                                          print(value);
                                          prebookQuantity = value;
                                        });
                                      },
                                      totalGuantity:
                                          "${widget.productdata["pre_qty"]}",
                                      givenGuantity: "$prebookQuantity"),
                                ),
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
              SizedBox(
                height: 10,
              ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     productCounter(
//
//                         callBack: (value){
// print(value);
//                     },givenGuantity:productdata.pro_price ),
//                   ],
//                 ),
//               ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (!widget.isMyPrebooking)
                      widget.isPrebooking
                          ? CustomButton(
                              text: "Add to Prebook",
                              callback: isUserLoggedIn == true
                                  ? () async {
                                      if (prebookQuantity == 0) {
                                        ShowMessage().showMessage(context,
                                            "Product Quantity is Required");
                                      } else {
                                        print("prebook quantity");
                                        print(prebookQuantity);
                                        showLoadingIndicator(context: context);
                                        bool value =
                                            await controller.onAddToPreBook(
                                                context: context,
                                                pro_id: widget
                                                    .productdata["pre_id"],
                                                prequantity:
                                                    prebookQuantity.toString());
                                        if (value) {
                                          // Get.back();
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return AppRootPage();
                                          }));
                                        }
                                      }
                                    }
                                  : () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return StartScreenViewController();
                                      }));
                                    },
                              height: 45,
                              textColor: Colors.white,
                              width: AppConfig(context: context).width - 50,
                              btnColor: AppColor().primaryColor,
                              borderColor: Colors.transparent)
                          : CustomButton(
                              text: "Add To Cart",
                              callback: isUserLoggedIn == true
                                  ? () async {
                                      showLoadingIndicator(context: context);
                                      bool value = await controller.onAddToCart(
                                          context: context,
                                          pro_id: widget.productdata["pre_id"]);
                                      if (value) {
                                        setState(() {
                                          Get.find<HomeViewModel>()
                                              .cartNum
                                              .value = Get.find<HomeViewModel>()
                                                  .cartNum
                                                  .value +
                                              1;
                                        });
                                        // setState(() {
                                        //   myCart=myCart+1;
                                        // });
                                      }
                                    }
                                  : () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return StartScreenViewController();
                                      }));
                                    },
                              height: 45,
                              textColor: Colors.white,
                              width: AppConfig(context: context).width - 50,
                              btnColor: AppColor().primaryColor,
                              borderColor: Colors.transparent),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
// getPrice(String discount, String price) {
//   int dis = 0;
//   if (discount.isNotEmpty) {
//     dis = int.parse(discount);
//   }
//
//   return int.parse(price) - dis;
// }
}
