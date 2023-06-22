import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/PreBookedModule/View/my_pre_booking.dart';
import 'package:aizacreationzz/AppModules/PreBookedModule/pre_book_view_model.dart';
import 'package:aizacreationzz/AppModules/ProductsModule/ViewController/PreBookAdViewController.dart';
import 'package:aizacreationzz/AppModules/Utils/AppBar.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllPreBookedViewController extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const AllPreBookedViewController({Key? key, required this.scaffoldKey})
      : super(key: key);
  @override
  _AllPreBookedViewControllerState createState() =>
      _AllPreBookedViewControllerState();
}

class _AllPreBookedViewControllerState extends State<AllPreBookedViewController>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final controller = Get.put(pre_book_view_model());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        // drawer: buildDrawer(context: context),
        backgroundColor: Colors.white,
        body: Container(
          height: AppConfig(context: context).height,
          width: AppConfig(context: context).width,
          child: Column(
            children: [
              customAppBar(
                  onSearch: (value) {
                    // print(
                    //     'Current Index: ${DefaultTabController.of(context)!.index}');
                    if (controller.currentIndex.value == 1) {
                      controller.onSearchPrebook(value);
                    } else {
                      controller.onSearchMyPrebook(value);
                    }
                  },
                  scaffoldKey: scaffoldKey,
                  context: context,
                  isSearch: false,
                  text: "Aiza Creationzz"),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // give the tab bar a height [can change hheight to preferred height]
                      Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(
                          color: Color(0xFFF4F4F8),
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                        ),
                        child: TabBar(
                          controller: _tabController,
                          // give the indicator a decoration (color and border radius)
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                25.0,
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 4)
                              ]),
                          labelColor: AppColor().primaryColor,
                          unselectedLabelColor: Colors.black,

                          tabs: [
                            // first tab [you can add an icon using the icon property]
                            Tab(
                              text: "Pre Booking",
                            ),

                            // second tab [you can add an icon using the icon property]

                            Tab(
                              text: "My Prebook",
                            ),
                          ],
                        ),
                      ),
                      // tab bar view here
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              PreBookAdViewController(
                                scaffoldKey: widget.scaffoldKey,
                              ),
                              MyPreBookList(
                                scaffoldKey: widget.scaffoldKey,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
