import 'package:aizacreationzz/AppModules/HomeModule/View/FeaturedView.dart';
import 'package:aizacreationzz/AppModules/PreBookedModule/pre_book_view_model.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';

class MyPreBookList extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  MyPreBookList({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  _MyPreBookListState createState() => _MyPreBookListState();
}

class _MyPreBookListState extends State<MyPreBookList> {
  final controller = Get.put(pre_book_view_model());

  Future? fetchAndSetFuture;
  @override
  void initState() {
    super.initState();
    controller.currentIndex.value = 2;

    fetchAndSetFuture = controller.onGetmyPrebook();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 0),
      child: SingleChildScrollView(
        child: FutureBuilder(
            future: fetchAndSetFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: SpinKitView(themeIsDark: false),
                  ),
                );
              if (controller.myprebook.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text("No Products"),
                  ),
                );
              }
              return Container(
                width: AppConfig(context: context).width,
                child: Obx(
                  () => IntrinsicGridView.vertical(
                      padding:
                          EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                      // columnCount: 3,
                      verticalSpace: 10,
                      horizontalSpace: 10,
                      children: [
                        for (int i = 0; i < controller.myprebook.length; i++)
                          Obx(
                            () => Column(
                              children: [
                                productTile(context, controller.myprebook[i],
                                    () async {
                                  // showLoadingIndicator(context: context);
                                }, false, false, true),
                              ],
                            ),
                          ),
                      ]),
                  //     GridView.builder(
                  //   shrinkWrap: true,
                  //   itemCount: controller.myprebook.length,
                  //   // itemCount: controller.productsList.length,
                  //   padding: const EdgeInsets.all(4.0),
                  //   physics: NeverScrollableScrollPhysics(),
                  //   gridDelegate:
                  //   SliverGridDelegateWithFixedCrossAxisCount(
                  //       childAspectRatio: 0.7,
                  //       mainAxisSpacing: 10.0,
                  //       crossAxisSpacing: 4.0,
                  //       crossAxisCount: 2),
                  //   itemBuilder: (context, index) {
                  //     return
                  //
                  //       Obx(
                  //             () => productTile(context,
                  //             controller.myprebook[index],
                  //                 () async {
                  //               showLoadingIndicator(context: context);
                  //
                  //             }, false),
                  //       );
                  //   },
                  // )
                ),
              );
            }),
      ),
    );
  }
}
