// ignore_for_file: must_be_immutable

import 'package:aizacreationzz/AppModules/CategoryModule/ViewController/CatecogriesViewController.dart';
import 'package:aizacreationzz/AppModules/CategoryModule/ViewController/GeneralViewController.dart';
import 'package:aizacreationzz/AppModules/CategoryModule/ViewController/VideosViewController.dart';
import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/HomeModule/View/CourselSliding.dart';
import 'package:aizacreationzz/AppModules/HomeModule/View/FeaturedView.dart';
import 'package:aizacreationzz/AppModules/HomeModule/View/PopularCategory.dart';
import 'package:aizacreationzz/AppModules/HomeModule/ViewModel/HomeViewModel.dart';
import 'package:aizacreationzz/AppModules/PreBookedModule/ViewController/PreBookViewController.dart';
import 'package:aizacreationzz/AppModules/ProfileModule/ViewModel/ProfileViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/AppBar.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/LocalDataBaseHandler.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:aizacreationzz/AppModules/Utils/showmessage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

int myCart = 0;

class HomeViewController extends StatefulWidget {
  GlobalKey<ScaffoldState> scaffoldKey;

  HomeViewController({required this.scaffoldKey});

  @override
  _HomeViewControllerState createState() => _HomeViewControllerState();
}

class _HomeViewControllerState extends State<HomeViewController> {
  final homeController = Get.put(HomeViewModel());

  Future? fetchAndSetFuture;
  dynamic isUserLoggedIn;

  Future checkUserLogin() async {
    dynamic checkUser = await DatabaseHandler().isExists('currentUser');
    return checkUser;
  }

  var controllerProfile = Get.put(ProfileViewModel());

  @override
  void initState() {
    super.initState();
    checkUserLogin().then((value) {
      setState(() {
        isUserLoggedIn = value; // Future is completed with a value.
      });
      print("IS USER LOGGED IN");
      print(isUserLoggedIn);
    });

    checkCart();
    homeController.onGetProducts();
    controllerProfile.onFetchUser();
    fetchAndSetFuture = homeController.onGetProducts();
  }

  checkCart() async {
    var cart = await DatabaseHandler().getCart();
    if (cart != null) homeController.cartNum.value = cart;
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> gridItems = [
      {
        "name": "Discount Items",
      },
      {"name": "PreBooking"},
      {"name": "New Items"},
    ];
    List<Widget> gridWidget = [
      GeneralViewController(
        scaffoldKey: widget.scaffoldKey,
        fromDrawer: true,
        sliderType: "discount",
      ),
      AllPreBookedViewController(
        scaffoldKey: widget.scaffoldKey,
      ),
      GeneralViewController(
        scaffoldKey: widget.scaffoldKey,
        fromDrawer: true,
        sliderType: "new",
      ),
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: AppConfig(context: context).height,
          width: AppConfig(context: context).width,
          child: Column(
            children: [
              customAppBar(
                  onSearch: (value) {
                    homeController.onSearchTile(value);
                  },
                  context: context,
                  text: "Aiza Creationzz",
                  isDrawer: true,
                  scaffoldKey: widget.scaffoldKey),
              Expanded(
                  child: RefreshIndicator(
                onRefresh: () {
                  setState(() {
                    fetchAndSetFuture = homeController.onGetProducts();
                  });
                  return homeController.onGetProducts();
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      carousel_slider(scaffoldKey: widget.scaffoldKey),

                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            myText(
                                title: "Main Menus",
                                color: AppColor().primaryColor,
                                fontweight: FontWeight.w800,
                                size: 16,
                                txtalign: TextAlign.start),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              // maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 10,
                              // mainAxisSpacing: 20,
                            ),
                            itemCount: gridItems.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => gridWidget[index],
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: myText(
                                    title: gridItems[index]["name"],
                                    color: Colors.white,
                                    fontweight: FontWeight.w800,
                                    size: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColor().primaryColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              );
                            }),
                      ),
                      // ################### VIDEOS BUTTON ################
                      SizedBox(
                        height: 10,
                      ),
                      buttonClickView(
                        context,
                        "Videos",
                        "Click here to watch videos",
                        Icons.play_circle_outline,
                        VideosViewController(
                          scaffoldKey: widget.scaffoldKey,
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      // // ################### PRE BOOKING BUTTON ################
                      // buttonClickView(
                      //   context,
                      //   "Prebooking",
                      //   "Click here to check Prebooking",
                      //   Icons.shopping_bag,
                      //   AllPreBookedViewController(
                      //     scaffoldKey: widget.scaffoldKey,
                      //   ),
                      // ),

                      // SizedBox(
                      //   height: 10,
                      // ),

                      // ################### DISCOUNT BUTTON ################

                      // GestureDetector(
                      //   onTap: () {
                      //     // Get.to(
                      //     //   () => GeneralViewController(
                      //     //     scaffoldKey: widget.scaffoldKey,
                      //     //     fromDrawer: true,
                      //     //     sliderType: "discount",
                      //     //   ),
                      //     // );
                      //   },
                      //   child: buttonClickView(
                      //     context,
                      //     "Discount",
                      //     "Click here for discount stufF",
                      //     Icons.discount,
                      //     GeneralViewController(
                      //       scaffoldKey: widget.scaffoldKey,
                      //       fromDrawer: true,
                      //       sliderType: "discount",
                      //     ),
                      //   ),
                      // ),

                      // SizedBox(
                      //   height: 20,
                      // ),
                      // ################### NEW BUTTON ################

                      // GestureDetector(
                      //   onTap: () {
                      //     // check
                      //     Get.to(
                      //       () => GeneralViewController(
                      //         scaffoldKey: widget.scaffoldKey,
                      //         fromDrawer: true,
                      //         sliderType: "new",
                      //       ),
                      //     );
                      //   },
                      //   child: buttonClickView(
                      //     context,
                      //     "New",
                      //     "Click here for new stuff",
                      //     Icons.new_releases,
                      //     GeneralViewController(
                      //       scaffoldKey: widget.scaffoldKey,
                      //       fromDrawer: true,
                      //       sliderType: "new",
                      //     ),
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            myText(
                                title: "Popular Categories",
                                color: AppColor().primaryColor,
                                fontweight: FontWeight.w800,
                                size: 16,
                                txtalign: TextAlign.start),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Get.to(() => CategoriesViewController(
                                      scaffoldKey: widget.scaffoldKey,
                                      fromDrawer: true,
                                    ));
                              },
                              child: myText(
                                  title: "See All",
                                  color: AppColor().textDarkColor!,
                                  fontweight: FontWeight.w800,
                                  size: 15,
                                  txtalign: TextAlign.start),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppColor().textDarkColor!,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      PopularCategory(
                        controller: homeController,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            myText(
                                title: "Featured",
                                color: AppColor().primaryColor,
                                fontweight: FontWeight.w600,
                                size: 16,
                                txtalign: TextAlign.start),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FutureBuilder(
                          future: fetchAndSetFuture,
                          // future:  controller.onGetProducts(categoryID: widget.categoryID),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting)
                              return Center(
                                child: SpinKitView(themeIsDark: false),
                              );
                            else
                              Center(
                                child: Text("No Product Found"),
                              );
                            // if(!snapshot.hasData)
                            //   return Center(
                            //     child: Text("No Category Found"),
                            //   );
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              child: Container(
                                width: AppConfig(context: context).width,
                                child: Obx(() => GridView.builder(
                                          shrinkWrap: true,
                                          itemCount: homeController
                                              .productsList.length,
                                          padding: const EdgeInsets.all(4.0),
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  childAspectRatio: 0.6,
                                                  mainAxisSpacing: 10.0,
                                                  crossAxisSpacing: 10.0,
                                                  crossAxisCount: 2),
                                          itemBuilder: (context, index) {
                                            return Obx(
                                              () => productTile(
                                                  context,
                                                  homeController
                                                      .productsList[index],
                                                  () async {
                                                showLoadingIndicator(
                                                    context: context);
                                                bool islike =
                                                    await homeController.addToFav(
                                                        context: context,
                                                        pro_id: homeController
                                                            .productsList[index]
                                                            .pro_Id);
                                                if (islike == true) {
                                                  setState(() {
                                                    homeController
                                                        .productsList[index]
                                                        .isliked = true;
                                                  });
                                                  ShowMessage().showMessage(
                                                      context,
                                                      "Added to Favourite");
                                                }
                                                print(
                                                    " controller.productsList[index].isliked");
                                                print(homeController
                                                    .productsList[index]
                                                    .isliked);
                                              }, false, false, false,
                                                  isLoggedIn: isUserLoggedIn),
                                            );
                                          },
                                        )
                                    //     Wrap(
                                    //   runSpacing: 10,
                                    //   spacing: 10,
                                    //   children: controller.productsList.map((i) {
                                    //     return Builder(
                                    //       builder: (BuildContext context) {
                                    //         return productTile(context, i,(){},false);
                                    //       },
                                    //     );
                                    //   }).toList(),
                                    // ),
                                    ),
                              ),
                            );
                          }),
                      // FeaturedView(controller: controller,),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ));
  }

  Column buttonClickView(BuildContext context, String heading,
      String buttonText, IconData icon, Widget route) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              myText(
                  title: heading,
                  color: AppColor().primaryColor,
                  fontweight: FontWeight.w800,
                  size: 16,
                  txtalign: TextAlign.start),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            Get.to(() => route);
          },
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: AppColor().primaryColor,
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myText(
                      title: buttonText,
                      color: Colors.white,
                      fontweight: FontWeight.w800,
                      size: 16,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(
                      icon,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}
