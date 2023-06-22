import 'package:aizacreationzz/AppModules/CategoryModule/View/CategoryTile.dart';
import 'package:aizacreationzz/AppModules/CategoryModule/ViewModel/CategoryViewModel.dart';
import 'package:aizacreationzz/AppModules/Constants/Color/Color.dart';
import 'package:aizacreationzz/AppModules/ProductsModule/ViewController/ProductsViewController.dart';
import 'package:aizacreationzz/AppModules/Utils/AppBar.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:aizacreationzz/AppModules/Utils/TextView/TextView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesViewController extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  final fromDrawer;

  CategoriesViewController(
      {required this.scaffoldKey, required this.fromDrawer});

  @override
  _CategoriesViewControllerState createState() =>
      _CategoriesViewControllerState();
}

class _CategoriesViewControllerState extends State<CategoriesViewController> {
  final controller = Get.put(CategoryViewModel());
  Future? fetchAndSetFuture;

  @override
  void initState() {
    super.initState();
    fetchAndSetFuture = controller.onGetCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: AppConfig(context: context).width,
      height: AppConfig(context: context).height,
      color: Colors.white,
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
          Expanded(
            child: FutureBuilder(
                future: fetchAndSetFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.connectionState == ConnectionState.none)
                    return Center(
                      child: SpinKitView(themeIsDark: false),
                    );
                  if (!snapshot.hasData)
                    return Center(
                      child: Text("No Category Found"),
                    );
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          // width: AppConfig(context: context).width,
                          child: Obx(() => ListView.builder(
                                itemCount: controller.categoriesList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(
                                          () => ProductsViewController(
                                            categoryID: int.parse(controller
                                                .categoriesList[index]
                                                .categoryId),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        // height: 40,
                                        decoration: BoxDecoration(
                                            color: AppColor().primaryColor,
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
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: myText(
                                                  txtalign: TextAlign.start,
                                                  title:
                                                      "${controller.categoriesList[index].categoryName}",
                                                  color: Colors.white,
                                                  fontweight: FontWeight.w700,
                                                  txtOverFlow:
                                                      TextOverflow.ellipsis),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Obx(
                            () => GridView.builder(
                              shrinkWrap: true,
                              itemCount: controller.categoriesList.length,
                              padding: const EdgeInsets.all(4.0),
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 0.7,
                                      mainAxisSpacing: 5.0,
                                      crossAxisSpacing: 10.0,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return Obx(() => categoryTile(
                                    context,
                                    controller,
                                    controller.categoriesList[index].categoryId,
                                    controller.categoriesList[index]));
                              },
                            ),
                            //     Wrap(
                            //   children: controller.categoriesList
                            //       .map((item) => categoryTile(
                            //           context,
                            //           controller,
                            //           item.categoryId,
                            //           controller.categoriesList
                            //               .where((data) =>
                            //                   data.categoryId == item.categoryId)
                            //               .toList()[0]))
                            //       .toList()
                            //       .cast<Widget>(),
                            // ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
