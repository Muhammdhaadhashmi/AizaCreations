import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/FavouriteModule/ViewModel/FavViewModel.dart';
import 'package:aizacreationzz/AppModules/HomeModule/View/FeaturedView.dart';
import 'package:aizacreationzz/AppModules/Utils/AppBar.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteViewController extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  final fromDrawer;

  FavouriteViewController(
      {required this.scaffoldKey, required this.fromDrawer});

  @override
  _FavouriteViewControllerState createState() =>
      _FavouriteViewControllerState();
}

class _FavouriteViewControllerState extends State<FavouriteViewController> {
  final controller = Get.put(FavViewModel());
  Future? fetchAndSetFuture;

  @override
  void initState() {
    super.initState();
    controller.onGetCategories();
    fetchAndSetFuture = controller.getFavProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // drawer: buildDrawer(context: context),
        backgroundColor: Colors.white,
        body: Container(
          height: AppConfig(context: context).height,
          width: AppConfig(context: context).width,
          child: Column(
            children: [
              customAppBar(
                  onSearch: (value) {
                    controller.onSearchTile(value);
                  },
                  context: context,
                  text: "Aiza Creationzz",
                  isDrawer: widget.fromDrawer ? false : true,
                  scaffoldKey: widget.scaffoldKey),
              Container(
                  height: 50,
                  width: AppConfig(context: context).width,
                  child: Obx(() => ListView.builder(
                        itemCount: controller.categoriesList.length + 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  // setState(() {
                                  controller.categorySelectID.value = index;
                                  // });
                                  controller.onFilter(id: 0);
                                },
                                child: Obx(
                                  () => Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color:
                                            controller.categorySelectID.value ==
                                                    index
                                                ? AppColor().primaryColor
                                                : Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey, blurRadius: 4)
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        myText(
                                          txtalign: TextAlign.start,
                                          title: "   ALL   ",
                                          color: controller
                                                      .categorySelectID.value ==
                                                  index
                                              ? Colors.white
                                              : AppColor().primaryColor,
                                          fontweight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  // setState(() {
                                  controller.categorySelectID.value = index;
                                  // });
                                  controller.onFilter(
                                      id: int.parse(controller
                                          .categoriesList[index - 1]
                                          .categoryId));
                                },
                                child: Obx(
                                  () => Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color:
                                            controller.categorySelectID.value ==
                                                    index
                                                ? AppColor().primaryColor
                                                : Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey, blurRadius: 4)
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        myText(
                                          txtalign: TextAlign.start,
                                          title:
                                              "  ${controller.categoriesList[index - 1].categoryName}  ",
                                          color: controller
                                                      .categorySelectID.value ==
                                                  index
                                              ? Colors.white
                                              : AppColor().primaryColor,
                                          fontweight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ))),
              Expanded(
                child: Container(
                  width: AppConfig(context: context).width,
                  child: FutureBuilder(
                      future: fetchAndSetFuture,
                      // future:  controller.onGetProducts(categoryID: widget.categoryID),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting)
                          return Center(
                            child: SpinKitView(themeIsDark: false),
                          );
                        if (!snapshot.hasData)
                          Center(
                            child: Text("No Product Found"),
                          );
                        if (controller.favProducts.isEmpty)
                          Center(
                            child: Text("No Product Found"),
                          );
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment:
                                controller.favProducts.length == 1
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(() => controller.favProducts.isEmpty
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              3),
                                      child: Center(
                                          child: Text("No Product Found")),
                                    )
                                  :
                                  // Wrap(
                                  //         runSpacing: 10,
                                  //         spacing: 10,
                                  //         children:
                                  //             controller.favProducts.map((i) {
                                  //           return Builder(
                                  //             builder: (BuildContext context) {
                                  //               return
                                  //               productTile(context, i,
                                  //                   () {
                                  //                 showLoadingIndicator(
                                  //                     context: context);
                                  //                 print("on fav");
                                  //                 controller.removeToFav(
                                  //                     context: context,
                                  //                     pro_id: i.pro_id);
                                  //                 // controller.favProducts.where((item) => item.pro_id==i.pro_id).toList()[0].,;
                                  //               }, true, false, false);
                                  //             },
                                  //           );
                                  //         }).toList(),
                                  //       ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: GridView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            controller.favProducts.length,
                                        padding: const EdgeInsets.all(4.0),
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                childAspectRatio: 0.6,
                                                mainAxisSpacing: 10.0,
                                                crossAxisSpacing: 10.0,
                                                crossAxisCount: 2),
                                        itemBuilder: (context, index) {
                                          return Obx(() => productTile(context,
                                                  controller.favProducts[index],
                                                  () {
                                                showLoadingIndicator(
                                                    context: context);
                                                print("on fav");
                                                controller.removeToFav(
                                                    context: context,
                                                    pro_id: controller
                                                        .favProducts[index]
                                                        .pro_Id);
                                                // controller.favProducts.where((item) => item.pro_id==i.pro_id).toList()[0].,;
                                              }, true, false, false));
                                          //     productTile(context,
                                          // controller.productsList[index],
                                          //     () async {
                                          //   showLoadingIndicator(context: context);
                                          //   bool islike =
                                          //   await controller.AddToFav(
                                          //       context: context,
                                          //       pro_id: controller
                                          //           .productsList[index]
                                          //           .pro_id);
                                          //   if (islike == true) {
                                          //     setState(() {
                                          //       controller.productsList[index]
                                          //           .isliked = true;
                                          //     });
                                          //     ShowMessage().showMessage(context, "Added to Favourite");
                                          //   }
                                          //   print(
                                          //       " controller.productsList[index].isliked");
                                          //   print(controller
                                          //       .productsList[index].isliked);
                                          // }, false,false,false),
                                          // );
                                        },
                                      ),
                                    )),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
