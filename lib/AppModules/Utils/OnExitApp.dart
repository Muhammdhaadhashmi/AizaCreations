// import 'dart:io';
// import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
// import 'package:aizacreationzz/AppModules/LoginAndRegistrationModule/ViewController/LoginViewController.dart';
// import 'package:aizacreationzz/AppModules/Utils/LocalDataBaseHandler.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//  onAppPop(BuildContext context) {
// showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Are you sure?'),
//           content: Text('Do you want to Logout !'),
//           actions: <Widget>[
//             FlatButton(
//               color: Colors.grey,
//               onPressed: () => Navigator.of(context).pop(false),
//               child: Text('No'),
//             ),
//             FlatButton(
//               color: AppColor().primaryColor,
//             onPressed: ()async{
//               await DatabaseHandler().deleteUser('currentUser');
//               Get.offAll( ()=>LoginScreenViewController());
//   },
//               /*Navigator.of(context).pop(true)*/
//               child: Text('Yes'),
//             ),
//           ],
//         ),
//       ) ;
// }
import 'dart:io';

import 'package:aizacreationzz/AppModules/AppRootPage/AppRootPage.dart';
import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/Utils/LocalDataBaseHandler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

onExitPop(BuildContext context, isLogout) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            height: 250,
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppColor().primaryColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.info,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            "Are you sure?",
                            style: TextStyle(fontWeight: FontWeight.w600),
                            // style: GoogleFonts.dmSans(
                            //     color: appcolors.Primarycolor,
                            //     fontWeight: FontWeight.w800,
                            //     fontSize: 20),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            isLogout
                                ? "Do you want to logout!"
                                : "Do you want to Exit!",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 35,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    // border: Border.all(
                                    //     color: AppColor().primaryColor, width: 1.5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'No',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                      // style: GoogleFonts.dmSans(
                                      //     color: appcolors.Primarycolor,
                                      //     fontWeight: FontWeight.w700,
                                      //     fontSize: 17),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  if (isLogout) {
                                    await DatabaseHandler()
                                        .deleteUser('currentUser');
                                    await DatabaseHandler().deleteUser('cart');
                                    Get.offAll(() => AppRootPage());
                                  } else {
                                    exit(0);
                                  }
                                },
                                child: Container(
                                  height: 35,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColor().primaryColor,
                                    // border: Border.all(
                                    //     color: AppColor().primaryColor, width: 1.5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Yes',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                      // style: GoogleFonts.dmSans(
                                      //     color: appcolors.white,
                                      //     fontWeight: FontWeight.w700,
                                      //     fontSize: 17),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
