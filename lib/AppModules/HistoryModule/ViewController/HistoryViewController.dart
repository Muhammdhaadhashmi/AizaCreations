import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/HistoryModule/View/OrderedHistory.dart';
import 'package:aizacreationzz/AppModules/HistoryModule/ViiewModel/HistroyViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/AppBar.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryViewController extends StatefulWidget {
  @override
  _HistoryViewControllerState createState() => _HistoryViewControllerState();
}

class _HistoryViewControllerState extends State<HistoryViewController> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final controller = Get.put(HistoryViewModel());
  Future? fetchAndSetFuture;

  @override
  void initState() {
    super.initState();

    fetchAndSetFuture = controller.onGetOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: Container(
          child: Column(
            children: [
              customAppBar(
                  onSearch: (value) {
                    controller.onSearchMyPrebook(value);
                  },
                  context: context,
                  text: "Orders History",
                  searchHint: "Search By Date",
                  isDrawer: false,
                  isSearch: false,
                  scaffoldKey: scaffoldKey),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: FutureBuilder(
                      future: fetchAndSetFuture,
                      // future: controller.onGetOrders(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting)
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: SpinKitView(themeIsDark: false),
                            ),
                          );
                        if (controller.orderList == []) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text("No Orders"),
                            ),
                          );
                        }
                        if (controller.orderList.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text("No Orders"),
                            ),
                          );
                        }

                        return Obx(() => ListView.builder(
                              itemCount: controller.orderList.length,
                              shrinkWrap: true,
                              // reverse: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(() => OrderedHistory(
                                                  saleID: controller
                                                      .orderList[index].id,
                                                ))!
                                            .then((value) => {
                                                  setState(() {}),
                                                });
                                      },
                                      child: Container(
                                        // height: 80,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 2),
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        myText(
                                                          size: 10,
                                                          title: "Order ID:",
                                                          color: Colors.black,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        myText(
                                                            title:
                                                                "${controller.orderList[index].id}",
                                                            color: AppColor()
                                                                .primaryColor),
                                                        SizedBox(
                                                          width: 30,
                                                        ),
                                                        myText(
                                                          size: 10,
                                                          title: "Date :",
                                                          color: Colors.black,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        myText(
                                                            title:
                                                                "${controller.orderList[index].pdate}",
                                                            color: AppColor()
                                                                .primaryColor),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        myText(
                                                          size: 10,
                                                          title: "Price:",
                                                          color: Colors.black,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        myText(
                                                            title:
                                                                "${controller.orderList[index].totalprice} PKR",
                                                            color: AppColor()
                                                                .primaryColor),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: AppColor().primaryColor,
                                                size: 25,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ));
                      }),
                ),
              )
            ],
          ),
        ));
  }
}
