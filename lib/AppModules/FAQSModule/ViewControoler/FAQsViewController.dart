import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/FAQSModule/ViewModel/FAQsViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/AppBar.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAQsViewController extends StatefulWidget {
  @override
  _FAQsViewControllerState createState() => _FAQsViewControllerState();
}

class _FAQsViewControllerState extends State<FAQsViewController> {
  final controller = Get.put(FaqsViewModel());
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      width: width,
      color: Colors.white,
      child: Column(
        children: [
          customAppBar(
            onSearch: (value) {},
            scaffoldKey: scaffoldKey,
            text: "FAQs",
            isCart: true,
            isDrawer: false,
            isSearch: false,
            context: context,
          ),
          Expanded(
              child: FutureBuilder(
                  future: controller.getFAQS(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: SpinKitView(themeIsDark: false),
                      );
                    }
                    // else{
                    //   return Center(
                    //     child:Text("No FAQs"),
                    //   );
                    // }
                    return Obx(
                      () => ListView.builder(
                        itemCount: controller.FaqsData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image(
                                    image: AssetImage(
                                      "assets/drawericon/faqicon.png",
                                    ),
                                    height: 50,
                                    color: AppColor().primaryColor,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  myText(
                                      title:
                                          "${controller.FaqsData[index].question}",
                                      color: AppColor().primaryColor,
                                      txtalign: TextAlign.start,
                                      fontweight: FontWeight.w600),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  myText(
                                      color: Colors.black,
                                      title:
                                          "${controller.FaqsData[index].answer}",
                                      size: 15,
                                      fontweight: FontWeight.w500,
                                      txtalign: TextAlign.start),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }))
        ],
      ),
    ));
  }
}
