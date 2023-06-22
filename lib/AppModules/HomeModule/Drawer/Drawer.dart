import 'package:aizacreationzz/AppModules/CategoryModule/ViewController/CollectionsViewController.dart';
import 'package:aizacreationzz/AppModules/CategoryModule/ViewController/CatecogriesViewController.dart';
import 'package:aizacreationzz/AppModules/ChangePasswordModule/ViewController/ChangePassword.dart';
import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/ContactUs/ViewControoler/ContactUsViewController.dart';
import 'package:aizacreationzz/AppModules/FAQSModule/ViewControoler/FAQsViewController.dart';
import 'package:aizacreationzz/AppModules/FavouriteModule/ViewController/FavouriteViewController.dart';
import 'package:aizacreationzz/AppModules/HistoryModule/ViewController/HistoryViewController.dart';
import 'package:aizacreationzz/AppModules/HomeModule/Drawer/DrawerTile.dart';
import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/ViewController/StartScreenViewController.dart';
import 'package:aizacreationzz/AppModules/PreBookedModule/ViewController/PreBookViewController.dart';
import 'package:aizacreationzz/AppModules/ProfileModule/Model/User.dart';
import 'package:aizacreationzz/AppModules/ProfileModule/ViewController/ProfileViewController.dart';
import 'package:aizacreationzz/AppModules/ProfileModule/ViewModel/ProfileViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/LocalDataBaseHandler.dart';
import '../../MyCartModule/ViewController/MyCartViewController.dart';
import '../../ProductsModule/ViewController/ProductsViewController.dart';
import 'package:aizacreationzz/AppModules/Utils/OnExitApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future checkUserLogin() async {
  dynamic checkUser = await DatabaseHandler().isExists('currentUser');
  return checkUser;
}

Drawer buildDrawer(
    {required BuildContext context,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required User user,
    dynamic isUserLoggedIn}) {
  print("Inside drawer");
  print(isUserLoggedIn);

  return Drawer(
      child: isUserLoggedIn
          ? Container(
              color: AppColor().primaryColor,
              child: Column(children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: 320,
                          decoration: BoxDecoration(
                            color: AppColor().primaryColor,
                            // borderRadius: BorderRadius.only(
                            //
                            //     bottomLeft: Radius.circular(50),
                            //     bottomRight: Radius.circular(50)),
                            // gradient: AppColor().gradient,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, left: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${Get.put(ProfileViewModel()).userName.value}"
                                      .capitalize!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${Get.put(ProfileViewModel()).userEmail.value}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        drawerTile(
                            title: "Profile",
                            img: "assets/drawericon/profileicon.png",
                            callBack: () {
                              Navigator.pop(context);
                              Get.to(() => ProfileViewController(
                                    scaffoldKey: scaffoldKey,
                                    fromDrawer: true,
                                  ));
                            }),
                        SizedBox(),
                        drawerTile(
                            title: "Categories",
                            img: "assets/drawericon/categories.png",
                            isIcon: false,
                            icon: Icons.category_outlined,
                            callBack: () {
                              Navigator.pop(context);
                              Get.to(() => CategoriesViewController(
                                    scaffoldKey: scaffoldKey,
                                    fromDrawer: true,
                                  ));
                            }),
                        SizedBox(),
                        drawerTile(
                            title: "Collections",
                            img: "assets/drawericon/categories.png",
                            isIcon: false,
                            icon: Icons.category_outlined,
                            callBack: () {
                              Navigator.pop(context);
                              Get.to(() => CollectionsViewController(
                                    scaffoldKey: scaffoldKey,
                                    fromDrawer: true,
                                  ));
                            }),
                        SizedBox(),
                        drawerTile(
                            title: "Products",
                            img: "assets/drawericon/products.png",
                            isIcon: false,
                            icon: Icons.production_quantity_limits,
                            callBack: () {
                              Navigator.pop(context);
                              Get.to(() => ProductsViewController());
                            }),
                        SizedBox(),
                        drawerTile(
                            title: "Favourite",
                            img: "assets/drawericon/heart.png",
                            isIcon: false,
                            icon: CupertinoIcons.heart,
                            callBack: () {
                              Navigator.pop(context);
                              Get.to(() => FavouriteViewController(
                                    scaffoldKey: scaffoldKey,
                                    fromDrawer: true,
                                  ));
                            }),
                        SizedBox(),
                        drawerTile(
                            title: "My Cart",
                            img: "assets/drawericon/order.png",
                            isIcon: false,
                            icon: Icons.shopping_cart,
                            callBack: () {
                              Navigator.pop(context);
                              Get.to(() => MyCartViewController());
                            }),
                        SizedBox(),
                        drawerTile(
                            title: "Pre Booked",
                            img: "assets/drawericon/order.png",
                            isIcon: false,
                            icon: Icons.shopping_cart,
                            callBack: () {
                              Navigator.pop(context);
                              Get.to(() => AllPreBookedViewController(
                                    scaffoldKey: scaffoldKey,
                                  ));
                            }),
                        // SizedBox(),
                        // drawerTile(
                        //     title: "My Pre Booked",
                        //     img: "assets/drawericon/order.png",
                        //     isIcon: false,
                        //     icon: Icons.shopping_cart,
                        //     callBack: () {
                        //       Navigator.pop(context);
                        //       Get.to(() => MyPreBookedViewController());
                        //     }),
                        SizedBox(),
                        drawerTile(
                            title: "History",
                            img: "assets/drawericon/history.png",
                            isIcon: false,
                            icon: Icons.history,
                            callBack: () {
                              Navigator.pop(context);
                              Get.to(() => HistoryViewController());
                            }),
                        SizedBox(),
                        drawerTile(
                            title: "Change Password",
                            img: "assets/drawericon/padlock.png",
                            isIcon: false,
                            icon: Icons.password_outlined,
                            callBack: () {
                              Navigator.pop(context);
                              Get.to(() => ChangePasswordViewController());
                            }),
                        SizedBox(),
                        drawerTile(
                            title: "FAQs",
                            img: "assets/drawericon/faqicon.png",
                            isIcon: false,
                            icon: Icons.location_on,
                            callBack: () {
                              Navigator.pop(context);
                              Get.to(() => FAQsViewController());
                            }),
                        SizedBox(),
                        drawerTile(
                            title: "Contact Us",
                            img: "assets/drawericon/contactusicon.png",
                            isIcon: false,
                            icon: Icons.location_on,
                            callBack: () {
                              Navigator.pop(context);
                              Get.to(() => ContactUs());
                            }),
                        SizedBox(),
                        drawerTile(
                            title: "Logout",
                            img: "assets/drawericon/logouticon.png",
                            callBack: () {
                              Navigator.pop(context);
                              onExitPop(context, true);
                            }),
                      ],
                    ),
                  ),
                ),
              ]),
            )
          : Container(
              color: AppColor().primaryColor,
              child: Column(children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: 320,
                          decoration: BoxDecoration(
                            color: AppColor().primaryColor,
                            // borderRadius: BorderRadius.only(
                            //
                            //     bottomLeft: Radius.circular(50),
                            //     bottomRight: Radius.circular(50)),
                            // gradient: AppColor().gradient,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, left: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${Get.put(ProfileViewModel()).userName.value}"
                                      .capitalize!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${Get.put(ProfileViewModel()).userEmail.value}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(),
                        drawerTile(
                            title: "Categories",
                            img: "assets/drawericon/categories.png",
                            isIcon: false,
                            icon: Icons.category_outlined,
                            callBack: () {
                              Navigator.pop(context);
                              Get.to(() => CategoriesViewController(
                                    scaffoldKey: scaffoldKey,
                                    fromDrawer: true,
                                  ));
                            }),
                        SizedBox(),
                        drawerTile(
                            title: "Products",
                            img: "assets/drawericon/products.png",
                            isIcon: false,
                            icon: Icons.production_quantity_limits,
                            callBack: () {
                              Navigator.pop(context);
                              Get.to(() => ProductsViewController());
                            }),

                        SizedBox(),
                        drawerTile(
                            title: "Pre Booked",
                            img: "assets/drawericon/order.png",
                            isIcon: false,
                            icon: Icons.shopping_cart,
                            callBack: () {
                              Navigator.pop(context);
                              Get.to(() => AllPreBookedViewController(
                                    scaffoldKey: scaffoldKey,
                                  ));
                            }),
                        // SizedBox(),
                        // drawerTile(
                        //     title: "My Pre Booked",
                        //     img: "assets/drawericon/order.png",
                        //     isIcon: false,
                        //     icon: Icons.shopping_cart,
                        //     callBack: () {
                        //       Navigator.pop(context);
                        //       Get.to(() => MyPreBookedViewController());
                        //     }),

                        SizedBox(),
                        drawerTile(
                            title: "FAQs",
                            img: "assets/drawericon/faqicon.png",
                            isIcon: false,
                            icon: Icons.location_on,
                            callBack: () {
                              Navigator.pop(context);
                              Get.to(() => FAQsViewController());
                            }),
                        SizedBox(),
                        drawerTile(
                            title: "Contact Us",
                            img: "assets/drawericon/contactusicon.png",
                            isIcon: false,
                            icon: Icons.location_on,
                            callBack: () {
                              Navigator.pop(context);
                              Get.to(() => ContactUs());
                            }),
                        SizedBox(),
                        drawerTile(
                            title: "Sign In / Sign Up",
                            img: "assets/drawericon/profileicon.png",
                            isIcon: false,
                            icon: Icons.person,
                            callBack: () {
                              Navigator.pop(context);
                              Get.to(() => StartScreenViewController());
                            }),
                      ],
                    ),
                  ),
                ),
              ]),
            ));
}
