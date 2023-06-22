import 'dart:async';
import 'package:aizacreationzz/AppModules/AppRootPage/AppRootPage.dart';
import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:http/http.dart' as http;
import 'package:aizacreationzz/AppModules/Utils/LocalDataBaseHandler.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenViewController extends StatefulWidget {
  const SplashScreenViewController({Key? key}) : super(key: key);

  @override
  _SplashScreenViewControllerState createState() =>
      _SplashScreenViewControllerState();
}

class _SplashScreenViewControllerState
    extends State<SplashScreenViewController> {
  Future sendFCMTokenToDatabase(tokenValue) async {
    print("##########3 TOKEN VALUE ");
    print(tokenValue);
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie': 'ci_session=bb07d94c384cc2491c2ed559a94b0f6b74c44cbe'
    };
    var request = http.Request('POST',
        Uri.parse('https://www.app.aizacreationzz.com/apis/registration_id'));
    request.bodyFields = {'reg_num': tokenValue};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print("REPONSE StATUS CODE ############");
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
     
    } else if (response.statusCode == 400) {
    
      print("Handled response");
      return;
    }
  }

  // ignore: unused_field
  String? _token;
  late Stream<String> _tokenStream;
  void setToken(String? token) {
    print('FCM Token: $token');
    setState(() {
      _token = token;
    });
    sendFCMTokenToDatabase(_token);
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        // Navigator.pushNamed(
        //   context,
        //   '/message',
        //   arguments: MessageArguments(message, true),
        // );
        print("%%%%%%%%% check message data");
        print(message.data);
      }
    });
  }

  var parsedDate = DateTime.parse('1974-03-20');
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance
        .getToken(
            vapidKey:
                'BGpdLRsMJKvFDD9odfPk92uBg-JbQbyoiZdah0XlUyrjG4SDgUsE1iC_kdRgt4Kn0CO7K3RTswPZt61NNuO0XoA')
        .then(setToken);
    _tokenStream = FirebaseMessaging.instance.onTokenRefresh;
    _tokenStream.listen(setToken);
    print("%%%%%%%%%%%%%%%%%% CHECK TIME ZONE %%%%%%%%%%%%%%%%");
    print(parsedDate);
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    // ignore: unused_local_variable
    var checkLogin = await DatabaseHandler().isExists('currentUser');
    // if (await DatabaseHandler().isExists('currentUser')) {
    Get.offAll(() => AppRootPage());
    // } else {
    // Get.offAll(() => StartScreenViewController());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: AppConfig(context: context).width,
          height: AppConfig(context: context).height,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: AppConfig(context: context).width -
                      AppConfig(context: context).width / 2.5,
                ),
                child: Container(
                  height: AppConfig(context: context).height / 5,
                  width: AppConfig(context: context).width / 2.5,
                  decoration: BoxDecoration(
                    color: AppColor().primaryColor,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(300)),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(
                        'assets/logo/splashLogo.png',
                      ),
                      height: 150,
                    ),
                  ],
                ),
              ),
              Container(
                height: AppConfig(context: context).height / 4,
                width: AppConfig(context: context).width / 1.9,
                decoration: BoxDecoration(
                  color: AppColor().primaryColor,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(500)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: myText(
                          title: "Powered by : Devicon",
                          color: Colors.black,
                          size: 14,
                          fontweight: FontWeight.w800),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: myText(
                          title: "+92 303 0336939",
                          color: Colors.black,
                          size: 14,
                          fontweight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
