import 'package:aizacreationzz/AppModules/CategoryModule/ViewController/CatecogriesViewController.dart';
import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/FavouriteModule/ViewController/FavouriteViewController.dart';
import 'package:aizacreationzz/AppModules/HomeModule/Drawer/Drawer.dart';
import 'package:aizacreationzz/AppModules/HomeModule/ViewController/HomeViewController.dart';
import 'package:aizacreationzz/AppModules/ProfileModule/ViewController/ProfileViewController.dart';
import 'package:aizacreationzz/AppModules/ProfileModule/ViewModel/ProfileViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/LocalDataBaseHandler.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRootPage extends StatefulWidget {
  const AppRootPage({Key? key}) : super(key: key);
  @override
  _AppRootPageState createState() => _AppRootPageState();
}

class _AppRootPageState extends State<AppRootPage> {
  int _currentIndex = 0;
  // int _counter = 0;
  // ignore: unnecessary_question_mark
  dynamic? isUserLoggedIn;
  var controllerProfile = Get.put(ProfileViewModel());
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

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
      print("IS USER LOGGED IN");
      print(isUserLoggedIn);
    });

    controllerProfile.onFetchUser();
    // controller.onFetchUser();
    // getCart();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  getCart() async {
    setState(() async {
      myCart = await DatabaseHandler().getCart();
    });
    print("myCart");
    print(myCart);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Obx(
        () => buildDrawer(
            context: context,
            scaffoldKey: scaffoldKey,
            user: controllerProfile.userData.value,
            isUserLoggedIn: isUserLoggedIn),
      ),
      body: _currentIndex == 0
          ? HomeViewController(
              scaffoldKey: scaffoldKey,
            )
          : _currentIndex == 1
              ? CategoriesViewController(
                  scaffoldKey: scaffoldKey,
                  fromDrawer: false,
                )
              : _currentIndex == 2
                  ? FavouriteViewController(
                      scaffoldKey: scaffoldKey,
                      fromDrawer: false,
                    )
                  : ProfileViewController(
                      scaffoldKey: scaffoldKey,
                      fromDrawer: false,
                    ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: isUserLoggedIn == true
            ? <BottomNavyBarItem>[
                BottomNavyBarItem(
                  icon: ImageIcon(AssetImage("assets/home.png")),
                  title: Text('Home'),
                  activeColor: AppColor().primaryColor,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon:
                      ImageIcon(AssetImage("assets/drawericon/categories.png")),
                  title: Text('Categories'),
                  activeColor: AppColor().primaryColor,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: ImageIcon(AssetImage("assets/drawericon/heart.png")),
                  title: Text(
                    'Favourite',
                  ),
                  activeColor: AppColor().primaryColor,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: ImageIcon(
                      AssetImage("assets/drawericon/profileicon.png")),
                  title: Text('Profile'),
                  activeColor: AppColor().primaryColor,
                  textAlign: TextAlign.center,
                ),
              ]
            : <BottomNavyBarItem>[
                BottomNavyBarItem(
                  icon: ImageIcon(AssetImage("assets/home.png")),
                  title: Text('Home'),
                  activeColor: AppColor().primaryColor,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon:
                      ImageIcon(AssetImage("assets/drawericon/categories.png")),
                  title: Text('Categories'),
                  activeColor: AppColor().primaryColor,
                  textAlign: TextAlign.center,
                ),
              ],
      ),
    );
  }
}
