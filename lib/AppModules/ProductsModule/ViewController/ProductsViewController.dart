import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/HomeModule/View/FeaturedView.dart';
import 'package:aizacreationzz/AppModules/ProductsModule/ViewModel/ProductsViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/AppBar.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProductsViewController extends StatefulWidget {
  int categoryID;

  ProductsViewController({this.categoryID = 0});

  @override
  _ProductsViewControllerState createState() => _ProductsViewControllerState();
}

class _ProductsViewControllerState extends State<ProductsViewController> {
  final controller = Get.put(ProductsViewModel());

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Future? fetchAndSetFuture;

  @override
  void initState() {
    super.initState();
    if (widget.categoryID == 0) controller.onGetCategories();
    fetchAndSetFuture = controller.onGetProducts(categoryID: widget.categoryID);
  }

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
                    controller.onSearchTile(value);
                  },
                  scaffoldKey: scaffoldKey,
                  context: context,
                  text: "Aiza Creationzz"),
              if (widget.categoryID == 0)
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
                                          color: controller
                                                      .categorySelectID.value ==
                                                  index
                                              ? AppColor().primaryColor
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 4)
                                          ]),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          myText(
                                            txtalign: TextAlign.start,
                                            title: "   ALL   ",
                                            color: controller.categorySelectID
                                                        .value ==
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
                                          color: controller
                                                      .categorySelectID.value ==
                                                  index
                                              ? AppColor().primaryColor
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 4)
                                          ]),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          myText(
                                            txtalign: TextAlign.start,
                                            title:
                                                "  ${controller.categoriesList[index - 1].categoryName}  ",
                                            color: controller.categorySelectID
                                                        .value ==
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
                child: FutureBuilder(
                    future: fetchAndSetFuture,
                    // future:  controller.onGetProducts(categoryID: widget.categoryID),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting)
                        return Center(
                          child: SpinKitView(themeIsDark: false),
                        );
                      if (!snapshot.hasData)
                        return Center(
                          child: Text("No Product Found"),
                        );
                      if (controller.productsList.isEmpty)
                        return Center(
                          child: Text("No Product Found"),
                        );
                      if (controller.productsList.isEmpty)
                        return Center(
                          child: Text("No Product Found"),
                        );
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Container(
                          width: AppConfig(context: context).width,
                          child: Obx(() => GridView.builder(
                                    itemCount: controller.productsList.length,
                                    padding: const EdgeInsets.all(4.0),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio: 0.6,
                                            mainAxisSpacing: 10.0,
                                            crossAxisSpacing: 10.0,
                                            crossAxisCount: 2),
                                    itemBuilder: (context, index) {
                                      return productTile(context,
                                          controller.productsList[index], () {
                                        showLoadingIndicator(context: context);
                                        controller.AddToFav(
                                                context: context,
                                                pro_id: controller
                                                    .productsList[index].pro_Id)
                                            .then((value) => {
                                                  if (value)
                                                    {
                                                      print("on fav"),
                                                      setState(() {
                                                        controller
                                                                .productsList[index]
                                                                .isliked =
                                                            !controller
                                                                .productsList[
                                                                    index]
                                                                .isliked;
                                                      }),
                                                    }
                                                });

                                        print(controller
                                            .productsList[index].isliked);
                                      }, false, false, false);
                                    },
                                  )
                              //     Wrap(
                              //   runSpacing: 10,
                              //   spacing: 10,
                              //   children: controller.productsList.map((i) {
                              //     return Builder(
                              //       builder: (BuildContext context) {
                              //         return productTile(context, i,(){
                              //           print("on fav");
                              //           controller.AddToFav(context: context, pro_id:i.pro_id);
                              //         },false);
                              //       },
                              //     );
                              //   }).toList(),
                              // ),
                              ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
