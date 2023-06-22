import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/ContactUs/Model/ContactUsModel.dart';
import 'package:aizacreationzz/AppModules/ContactUs/ViewModel/contact_us_VM.dart';
import 'package:aizacreationzz/AppModules/Utils/AppBar.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = Get.put(contact_us_VM());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
      height: height,
      width: width,
      child: Column(children: [
        customAppBar(
          onSearch: (value) {},
          scaffoldKey: scaffoldKey,
          text: "Contact Us",
          isCart: true,
          isDrawer: false,
          isSearch: false,
          context: context,
        ),
        SizedBox(
          height: 20,
        ),
        FutureBuilder<contact_us>(
            future: controller.onGetContact(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Expanded(
                  child: Center(
                    child: SpinKitView(
                      themeIsDark: false,
                    ),
                  ),
                );
              return Column(
                children: [
                  SizedBox(
                    width: width / 1.1,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.location_on,
                          color: AppColor().primaryColor,
                          size: 40,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${snapshot.data!.address}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: width / 1.1,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/contactus/phoneicon.png",
                          width: width / 7,
                          height: height / 25,
                          color: AppColor().primaryColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${snapshot.data!.phone}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: width / 1.1,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/contactus/email.png",
                          width: width / 7,
                          height: height / 35,
                          color: AppColor().primaryColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${snapshot.data!.gmail}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: width / 1.2,
                    child: Center(
                      child: Text(
                        "Social Account",
                        style: TextStyle(
                            fontSize: 32,
                            color: AppColor().primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Container(
                    width: width / 1.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async{
                            await launch("${snapshot.data!.facebook}");
                            print("${snapshot.data!.facebook}",);
                          },
                          child: Image.asset(
                            "assets/contactus/facebook.png",
                            width: width / 7,
                            height: height / 30,
                          ),
                        ),
                        InkWell(
                          onTap: () async{
                            await launch("${snapshot.data!.twiter}");
                            print("${snapshot.data!.twiter}",);
                          },
                          child: Image.asset(
                            "assets/contactus/twitter.png",
                            width: width / 7,
                            height: height / 30,
                          ),
                        ),
                        InkWell(
                          onTap: () async{
                            await launch("${snapshot.data!.linkedin}");
                            print("${snapshot.data!.linkedin}",);
                          },
                          child: Image.asset(
                            "assets/contactus/linkedin.png",
                            width: width / 7,
                            height: height / 30,
                          ),
                        ),
                        InkWell(
                          onTap: () async{
                            await launch("${snapshot.data!.instagram}");

                            print("${snapshot.data!.instagram}",);
                          },
                          child: Image.asset(
                            "assets/contactus/instagram.png",
                            width: width / 7,
                            height: height / 30,
                          ),
                        ),
                        InkWell(
                          onTap: () async{
                            await launch("${snapshot.data!.youtube}");

                            print("${snapshot.data!.youtube}",);
                          },
                          child: Image.asset(
                            "assets/contactus/YOUTUBE.png",
                            width: width / 7,
                            height: height / 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            })
      ]),
    ));
  }
}
